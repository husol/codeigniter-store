<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends MY_Controller {
	function __construct() {
		parent::__construct();
	//	$this->_init();
	}

	private function _init()
	{

	}

	public function login() {
		$rules = array(
			array(
				'field' => 'username',
				'label' => 'Username',
				'rules' => 'trim|required|xss_clean'
			),
			array(
				'field' => 'password',
				'label' => 'Password',
				'rules' => 'required'
			),
		);
		$this->form_validation->set_rules($rules);
		if($this->form_validation->run() == FALSE)
			$this->load->view('admin/login');
		else
		{
			$check = $this->adminmodel->login($_POST['username'], $_POST['password']);
		//	var_dump($_POST);
			if($check != null)
			{
				$session = array(
					'auth' => $check->u_ugid,
					'id' => $check->uid,
					'user' => $check->u_uname
				);
				$this->session->set_userdata($session);
				if(isset($_POST['remember']) && $_POST['remember'] == 1)
				{
					$this->input->set_cookie(
						array(
							'name' => 'auth',
							'value' => $check->u_ugid,
							'expire' => 604800
						)
					);
					$this->input->set_cookie(
						array(
							'name' => 'id',
							'value' => $check->uid,
							'expire' => 604800
						)
					);
					$this->input->set_cookie(
						array(
							'name' => 'user',
							'value' => $check->u_uname,
							'expire' => 604800
						)
					);
				}
				header('Location: ' . $_SERVER['HTTP_REFERER']);
			}
			else
			{
				$result['message'] = 'Wrong username/password';
				$result['url'] = $_SERVER['HTTP_REFERER'];
				$this->load->view('admin/result', $result);
			}
		}
	}


/*====================================MAIN FUNCTION ======================================*/

	public function index()
	{
		$this->settings();
	}

/*============================== MENU ================================*/

	public function menus($order = 'ordering', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getMenus($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'Menu management';
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'name' => array('Menu name', ''),
			'mngroup' => array('Group', ''),
			'type' => array('Type', ''),
			'ordering' => array('Ordering', 'text-center'),
			'status' => array('Status', 'text-center')
		);
		$data['btn_add'] = 'New Menu';
		$data['btn_add_url'] = 'menu/new';
		$data['container_id'] = 'menu-data';
		$data['block'] = 'menus';
	//	var_dump($data);
		$this->load->view('admin/main', $data);
	}

	public function menu($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
	//	$str = $this->uri->segment(QSTR + 1);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
			{
				$data['data'] = $this->adminmodel->getMenu($str);
			}
		//	$data['category'] = $this->get_category();
			$data['types'] = $this->adminmodel->getCategoryByGroup();
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function add_menu()
	{
		if(isset($_POST['add_menu']))
		{
			$add_result = $this->adminmodel->addMenu($_POST);
			if($add_result)
			{
				$result['message'] = 'New menu added';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_menu()
	{
		$update_result = $this->adminmodel->updateMenu($_POST);
	 	if($update_result)
		{
			$result['message'] = 'Menus info updated';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		else
		{
			$result['message'] = 'An unexpected error occurred. Please try again!';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		$this->load->view('admin/result', $result);
	}


/*============================== END MENU ================================*/


/*============================== ACCOUNT ================================*/

	public function account()
	{
		$data['data'] = $this->adminmodel->getAdmin($this->session->userdata('id'));
		$data['page_type'] = 2;
		$data['heading'] = 'Account';
		$data['container_id'] = 'account-data';
		$data['block'] = 'account';
		$this->load->view('admin/main', $data);

	}

	public function update_password()
	{


		$update_result = $this->adminmodel->updatePassword($_POST, $this->session->userdata('id'));
	 	if($update_result)
		{
			$result['message'] = 'Password updated successfully';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			$result['message'] = 'An unexpected error occurred. Please try again!';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
	}

	public function create_user()
	{

		$create_result = $this->adminmodel->addUser();
	}

/*============================== END ACCOUNT ================================*/


/*============================== SETTING ================================*/

	public function settings()
	{
		$data['data'] = $this->site_config;
		$data['page_type'] = 2;
		$data['heading'] = 'Setting';
		$data['container_id'] = 'setting-data';
		$data['block'] = 'setting';
		$this->load->view('admin/main', $data);
	}

	public function update_settings()
	{

		$update_result = $this->adminmodel->updateConfig($_POST);
	 	if($update_result)
		{
			$result['message'] = 'Settings updated';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			$result['message'] = 'Nothing \'s changed. Please try again!';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
	}


	public function homepageModules($order = 'ordering', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getModules($order, $sort, $limit, $idx, $type = 'homepage');
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'name' => array('Name', ''),
			'position' => array('Position/function', ''),
			'ordering' => array('Ordering', 'text-center'),
			'status' => array('Status', 'text-center'),
			'lastmodified' => array('Last Modified', ''),
		);
		$data['page_type'] = 1;
		$data['heading'] = 'Homepage Modules';
		$data['btn_add'] = 'New module';
		$data['btn_add_url'] = 'homepageModule/new';
		$data['container_id'] = 'home-modules-data';
		$data['block'] = 'homepage-modules';
		$this->load->view('admin/main', $data);
	}


	public function homepageModule($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
				$data['data'] = $this->adminmodel->getModule($str);
			$data['heading'] = 'Home page module';
			$data['category'] = $this->get_module_category(1, 'homepage');
			$data['category_tree'] = $this->get_category(1, 'post');
			$data['extra_js'] = array('admin-homepage-module.js');
			$this->load->view('admin/blocks/form', $data);
		}
	}

/*============================== END SETTING ================================*/


/*============================== UPLOAD IMG ================================*/

	public function create_folder(){
		if($this->input->is_ajax_request()){
			mkdir(UDIR.'/'.utf8_decode($_POST['name']), 0777, true);
			if(is_dir(UDIR.'/'.utf8_decode($_POST['name'])))
				echo 'ok';
			else
				echo 'fail';
			return;
		}
		else
			return false;
	}

	public function delete_folders()
	{
		if($this->input->is_ajax_request()){
			$this->delete_folder(UDIR.'/'.$_POST['path']);
		}
		else
			return false;
	}

	public function delete_folder($dir)
	{
		foreach(scandir($dir) as $sub)
		{
			if($sub == '.' || $sub == '..')
				continue;
			else
			{
				if(is_dir($dir.'/'.$sub))
					$this->delete_folder($dir.'/'.$sub);
				else
					unlink($dir.'/'.$sub);
			}
		}
		rmdir($dir);
	}

	public function get_folder()
	{
		$dir = UDIR;
		$data = array();
		$exception_name = array('crop', 'large', 'medium', 'small', 'thumbnail');
		$exception_type = array('jpg', 'JPG', 'jpeg', 'png', 'PNG', 'html', 'swf');
		if(is_dir($dir))
		{
			$results = scandir($dir);
			$i = 0;
			foreach($results as $result)
			{
				if($result == '.' || $result == '..' || in_array($result, $exception_name) || in_array(pathinfo($dir.'/'.$result, PATHINFO_EXTENSION), $exception_type))
					continue;
				else
				{
					$data[$i] = array();
					if(is_dir($dir.'/'.$result))
					{
						$data[$i]['name'] = $result;
							$sub_results = scandir($dir.'/'.$result);
							$j = 0;
							foreach($sub_results as $sub_result)
							{
								if($sub_result == '.' || $sub_result == '..' || in_array($sub_result, $exception_name) || in_array(pathinfo($dir.'/'.$result.'/'.$sub_result, PATHINFO_EXTENSION), $exception_type))
									continue;
								else
								{
									$data[$i]['sub'][$j] = array();
									if(is_dir($dir.'/'.$result.'/'.$sub_result))
									{
										$data[$i]['sub'][$j]['name'] = $sub_result;
										$lasts = scandir($dir.'/'.$result.'/'.$sub_result);
										$k = 0;
										foreach($lasts as $last)
										{
											if($last == '.' || $last == '..' || in_array($last, $exception_name) || in_array(pathinfo($dir.'/'.$result.'/'.$sub_result.'/'.$last, PATHINFO_EXTENSION), $exception_type))
												continue;
											else
											{
												if(is_dir($dir.'/'.$result.'/'.$sub_result.'/'.$last))
												{
													$data[$i]['sub'][$j]['sub'][$k] = $last;
												}
											}
											$k++;
										}
									}
								}
								$j++;
							}
					}
				}
				$i++;
			}
		}
	//	echo json_encode($data);
		print_r( json_encode($data) );
		return;
	}

	public function upload()
	{
		session_start();
		error_reporting(E_ALL | E_STRICT);
		if($this->uri->segment(QSTR + 1) != '')
		{
			if($this->uri->segment(QSTR + 2) == null)
				$this->session->set_userdata('dir', urldecode($this->uri->segment(QSTR + 1)));
			elseif($this->uri->segment(QSTR + 3) == null)
				$this->session->set_userdata('dir', urldecode($this->uri->segment(QSTR + 1)).'/'.urldecode($this->uri->segment(QSTR + 2)));
			else
				$this->session->set_userdata('dir', urldecode($this->uri->segment(QSTR + 1)).'/'.urldecode($this->uri->segment(QSTR + 2)).'/'.urldecode($this->uri->segment(QSTR + 3)));
		}

		$this->load->library('uploadhandler');
	//	$upload_handler = new Uploadhandler();
		if(isset($_SESSION['dir']))
			$dir = $_SESSION['dir'];
	//	$this->unlink_origin($dir);
	}

	public function get_uploader()
	{
		$this->load->view('admin/blocks/uploader');
	}

	public function clean_db()
	{
		$delete_result = $this->adminmodel->deleteGarbageImg();
	}

	public function clean_file()
	{

		$data = $this->adminmodel->getAllImg();
		$files = glob(UDIR.'/medium/*.jpeg');
		foreach($files as $file){
		//	foreach($data as $pic)
		//	{
				echo $file;
			//	$pic = UDIR.'/thumbnail/'.$pic->img_name.'jpeg';
			//	echo $pic;
		//		if($file != $pic){
		//			if(is_file($file))
		//				unlink($file);
		//		}
		//	}
		}
	}

	public function unlink_origin($dir)
	{
		$files = glob(UDIR.'/'.$dir.'/*.jpeg');
		foreach($files as $file){
		  if(is_file($file))
			unlink($file);
		}
	}

	public function unlink_img()
	{
		$name = $_POST['name'];
		$dir = '';
		if($_POST['dir'] != '')
			$dir = $_POST['dir'];
		else
			$dir = date('Y/m');
		$p1 = UDIR.'/'.$dir.'/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		$p1 = UDIR.'/'.$dir.'/large/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		$p1 = UDIR.'/'.$dir.'/medium/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		$p1 = UDIR.'/'.$dir.'/small/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		$p1 = UDIR.'/'.$dir.'/thumbnail/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		$p1 = UDIR.'/'.$dir.'/crop/'.$name;
		if(file_exists($p1))
		{
			unlink($p1);
		}
		if($_POST['id'] !== '' && $_POST['pid'] != '')
		{
			$delete_result = $this->adminmodel->deleteImg($_POST['id']);
		}
		return 'done';
	}

/*============================== END UPLOAD IMG ================================*/


/*============================== CATEGORY ================================*/

	public function categories($order = 'level', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getCategories($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'Category Management';
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'category' => array('Category', ''),
			'level' => array('Level', 'text-center'),
			'parent' => array('Parent', ''),
			'status' => array('Public', 'mw-100 text-center'),
		);
		$data['btn_add'] = 'New Category';
		$data['btn_add_url'] = 'category/new';
		$data['container_id'] = 'categories-data';
		$data['block'] = 'categories';
		$this->load->view('admin/main', $data);
	}

	public function category()
	{
		$data['page'] = $this->uri->segment(QSTR);
		$str = $this->uri->segment(QSTR + 1);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
			{
				$data['data'] = $this->adminmodel->getCategoryDetail($str);
			}
			$data['category'] = $this->get_category(1, 'post');
			$data['orders'] = range(1, 8);
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function get_category($level = 1, $str = '')
	{
		$i = $level;
		$data['category'] = array();
		while($this->adminmodel->getCategoryByLevel($i, $str) != null)
		{
			$data['category'][$i] = $this->adminmodel->getCategoryByLevel($i, $str);
			$i++;
		}
		return $data['category'];
		var_dump($data['category']);
	}

	public function add_category()
	{
		if($this->input->post('add_category')) {
			$add_result = $this->adminmodel->addCategory($this->input->post());
			if($add_result) {
				$result['message'] = 'New category added';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			} else {
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_category()
	{
		if(isset($_POST['update_category']))
		{
			$update_result = $this->adminmodel->updateCategory($this->input->post());
			if($update_result)
			{
				$result['message'] = 'Category updated';
				$result['url'] = $_SERVER['HTTP_REFERER'];
				$this->load->view('admin/result', $result);
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
				$this->load->view('admin/result', $result);
			}
		}
	}

/*============================== END CATEGORY ================================*/


/*============================== POSTS ================================*/

	public function posts($order = 'created', $sort = 'desc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getPosts($order, $sort, $limit, $idx);
	//	var_dump($result);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'title' => array('Title', ''),
			'category' => array('Category', 'mw-140'),
			'status' => array('Published', 'mw-100 text-center'),
			'featured' => array('Featured', 'mw-90 text-center'),
			'author' => array('Author', 'mw-80'),
			'created' => array('Created', 'mw-90'),
			'viewed' => array('Viewed', 'mw-80 text-center')
		);
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'Post Management';
		$data['btn_add'] = 'New post';
		$data['btn_add_url'] = 'post/new';
		$data['container_id'] = 'posts-data';
		$data['block'] = 'posts';
		$data['filter']['category'] = $this->get_category(1, 'post');
		$this->load->view('admin/main', $data);
	}

	public function get_all_posts($order = 'created', $sort = 'desc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp'])*2;
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getPosts($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'title' => array('Title', ''),
			'category' => array('Category', 'mw-90'),
			'status' => array('Published', 'mw-100 text-center'),
			'featured' => array('Featured', 'mw-90 text-center'),
			'author' => array('Author', 'mw-90'),
			'created' => array('Created', 'mw-90'),
			'viewed' => array('Viewed', 'mw-90 text-center')
		);
		$data['page'] = 'get_all_posts';
		$data['page_type'] = 1;
		$data['container_id'] = 'posts-data';
		$data['block'] = 'posts';
		$data['category'] = $this->get_category('page', 1, 'post');
		$this->load->view('admin/posts-browser', $data);
		return;

	}

	public function post()
	{
		$data['page'] = $this->uri->segment(QSTR);
		$str = $this->uri->segment(QSTR + 1);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
			{
				$data['data'] = $this->adminmodel->getPost($str);
				if(isset($data['data']) && $data['data']->tags != '')
				{
					$data['tags'] = array(
						1 => array(),
						2 => array()
					);
					$tags = explode(';', $data['data']->tags);
					for($i=0; $i<count($tags); $i=$i+2){
						if($tags[$i] == 1)
							array_push($data['tags'][1], $tags[$i+1]);
						else
							array_push($data['tags'][2], $tags[$i+1]);
					}
				}
			}
		//	$data['category'] = $this->get_category();
			$data['category'] = $this->get_category(1);
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function add_post()
	{
		if(isset($_POST['add_post']))
		{
			$_POST['p_datetime'] = date('Y-m-d H:i:s');
			$_POST['p_author'] = $this->session->userdata['id'];
			$_POST['p_ym'] = $this->handle_img_string($_POST['p_img'])['dir'];
			$_POST['p_img'] = $this->handle_img_string($_POST['p_img'])['img'];
			$add_result = $this->adminmodel->addPost($_POST);
			if(!is_null($add_result))
			{
				if($_POST['p_tags'] != '')
				{
					$tags = explode(',', $_POST['p_tags']);
					foreach($tags as $tag)
						$this->adminmodel->addTag($tag, $add_result[0]);
				}
				if($_POST['p_tags_2'] != '')
				{
					$tags = explode(',', $_POST['p_tags_2']);
					foreach($tags as $tag)
						$this->adminmodel->addTag($tag, $add_result[0], 2);
				}
				if($_POST['p_gallery'] != '')
				{
					$gallery = array();
					foreach(explode(', ', $_POST['p_gallery']) as $gal)
					{
						$items = explode('|', $gal);
						$items[0] = $this->handle_img_string($items[0])['path'];
						array_push($gallery, $items);
					}
				//	var_dump($gallery);
					$this->adminmodel->addImg($add_result[0], $gallery);
				}
			 	$result['message'] = 'New post submited';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_post()
	{
		if(isset($_POST['update_post']))
		{
			$_POST['p_lastmodified'] = date('Y-m-d H:i:s');
		//	if(!isset($_POST['p_ym']))
			$_POST['p_ym'] = $this->handle_img_string($_POST['p_url'])['dir'];
			$_POST['p_img'] = $this->handle_img_string($_POST['p_url'])['img'];
			$update_result = $this->adminmodel->updatePost($_POST);
		//	var_dump($_POST);
		//	$update_result = false;
			if($update_result)
			{
				if($_POST['del_tags'] != '')
				{
					$del_tags = explode(',', $_POST['del_tags']);
					foreach($del_tags as $tag)
						$this->adminmodel->deleteRef($_POST['pid'], $tag);
				}
				if($_POST['del_tags_2'] != '')
				{
					$del_tags = explode(',', $_POST['del_tags_2']);
					foreach($del_tags as $tag)
						$this->adminmodel->deleteRef($_POST['pid'], $tag);
				}
				if($_POST['p_tags'] != '')
				{
					$tags = explode(',', $_POST['p_tags']);
				//	if(is_array($tags))
						foreach($tags as $tag)
							$this->adminmodel->addTag($tag, $_POST['pid']);
				//	else
				//		$this->adminmodel->addTag($_POST['p_tags'], $_POST['pid']);
				}
				if($_POST['p_tags_2'] != '')
				{
					$tags = explode(',', $_POST['p_tags_2']);
					foreach($tags as $tag)
						$this->adminmodel->addTag($tag, $_POST['pid'], 2);
				}
				if($_POST['del_imgs'] != '')
					$this->adminmodel->deleteImg(explode(',', $_POST['del_imgs']));
				$new_imgs = $_POST['new_imgs'] != '' ? explode(', ', $_POST['new_imgs']) : array();
				if($_POST['p_gallery'] != '' && count($new_imgs) > 0)
				{
					$gallery = array();
					$list = explode(', ', $_POST['p_gallery']);
					$i = 0;
					while($i < count($list))
					{
						if(in_array($i, $new_imgs))
						{
							$items = explode('|', $list[$i]);
							$items[0] = $this->handle_img_string($items[0])['path'];
							array_push($gallery, $items);
						}
						$i++;
					}
					$this->adminmodel->addImg($_POST['pid'], $gallery);
				}
				$result['message'] = 'Post updated';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function handle_img_string($str, $pattern = '/large|medium|small|thumbnail/')
	{
		preg_match($pattern, $str, $checks, PREG_OFFSET_CAPTURE);
		$result = array(
			'dir' => isset($checks[0][1]) ? substr($str, 0, $checks[0][1]) : substr($str, 0, strrpos($str, '/')+1),
			'path' => substr($str, strpos($str, 'data/')+5),
			'img' => substr($str, strrpos($str, '/')+1),
		);
		return $result;
	}

/*============================== END POSTS ================================*/


/*============================== MEMBER ================================*/

	public function members($order = 'name', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getMembers($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['heading'] = 'Member Management';
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'name' => array('Name', ''),
			'gender' => array('gender', ''),
			'class' => array('Class', 'text-center'),
			'status' => array('Status', 'text-center')
		);
		$data['page_type'] = 1;
		$data['btn_add'] = 'New member';
		$data['btn_add_url'] = 'member/new';
	//	$data['search-block'] = 'member-search';
		$data['container_id'] = 'members-data';
		$data['block'] = 'members';
		$this->load->view('admin/main', $data);
	}

	public function member($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
			{
				$data['data'] = $this->adminmodel->getMember($str);
				$data['img_folder'] = 'member';
			}
			$data['classes'] = $this->adminmodel->getClasses();
			$data['countries'] = $this->adminmodel->getCountries();
			$this->load->view('admin/blocks/form', $data);
		}

	}

	public function add_member()
	{
		if(isset($_POST['add_member']))
		{
			$_POST['p_gid'] = 1;
			$add_result = $this->adminmodel->addmember($_POST);
			if($add_result)
			{
				$result['message'] = 'New member added';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_member()
	{
		if(isset($_POST['update_member']))
		{
			$_POST['p_gid'] = 1;
			$update_result = $this->adminmodel->updatemember($_POST);
			if($update_result)
			{
				$result['message'] = 'Member info updated';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function search_member($num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = $this->config['ipp'];
		$idx = $limit*($num - 1);
		if(isset($_POST['search']))
		{
			if(!isset($_POST['cid']))
				$_POST['cid'] = 0;
			if(!isset($_POST['p_name']))
				$_POST['p_name'] = '';
			if(!isset($_POST['p_sku']))
				$_POST['p_sku'] = '';
			if(!isset($_POST['p_material']))
				$_POST['p_material'] = '';
			if(!isset($_POST['p_color']))
				$_POST['p_color'] = '';
			if(!isset($_POST['p_size']))
				$_POST['p_size'] = '';
			if(!isset($_POST['p_decor']))
				$_POST['p_decor'] = '';
			if(!isset($_POST['p_package']))
				$_POST['p_package'] = '';
			$_SESSION['post'] = $_POST;
			$_SESSION['data'] = $this->adminmodel->searchmembers($_POST, $limit, $idx);
		}
		else
			$_SESSION['data'] = $this->adminmodel->searchmembers($_SESSION['post'], $limit, $idx);
		header('location: '.admin_url.'/member_search_result/'.$num);
	}

	public function member_search_result($num)
	{
		if(isset($_SESSION['data']))
		{
			$data = $_SESSION['data'];
			$data['page_count'] = ceil($data[0]->pcount/$this->config['ipp']);
			$data['page_current'] = $num;
		}
		$data['page'] = 'search_member';
		$data['heading'] = 'Search result';
		$data['img-folder'] = 'gift';
		$data['page_type'] = 1;
		$data['btn-add'] = 'New member';
		$data['btn-add-url'] = 'member/new';
		$data['search-block'] = 'member-search';
		$data['container-id'] = 'members-data';
		$data['block'] = 'members';
		if(!is_numeric($num))
			$num = 1;
		$data['category'] = $this->get_category();
	//	var_dump($_SESSION['post']);
		require 'application/views/admin/main.php';
	}

/*============================== END MEMBER ================================*/


/*============================== USER ================================*/


	public function users($order = 'username', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getUsers($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['heading'] = 'Member Management';
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'username' => array('User Name', ''),
			'name' => array('Name', ''),
			'authority' => array('Authority', ''),
			'status' => array('Status', 'text-center'),
		);
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'User Management';
		$data['btn_add'] = 'New user';
		$data['btn_add_url'] = 'user/new';
		$data['container_id'] = 'users-data';
		$data['block'] = 'users';
		$this->load->view('admin/main', $data);
	}

	public function user($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
			{
				$data['data'] = $this->adminmodel->getUser($str);
				$data['img_folder'] = 'user';
				$data['ug'] = $this->adminmodel->getUGroup();
			}
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function add_user()
	{
		if(isset($_POST['add_user']))
		{
			$add_result = $this->adminmodel->addUser($_POST);
			if($add_result)
			{
				$result['message'] = 'New user added';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_user()
	{
		if(isset($_POST['update_user']))
		{
			$update_result = $this->adminmodel->updateUser($_POST);
			if($update_result)
			{
				$result['message'] = 'Users info updated';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'Nothing \'s changed. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_ustate()
	{
		$id = $_POST['id'];
		$state = $_POST['state'];
		$update_result = $this->adminmodel->updateUserState($id, $state);
		if($update_result)
			echo 'ok';
		return;
	}

	public function delete_user()
	{
		$id = $_POST['id'];
		$delete_result = $this->adminmodel->deleteUser($id);
		if($update_result)
			echo 'ok';
		return;
	}

/*============================== END USER ================================*/


/*============================== PARTNER ================================*/

	public function partners($num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$data['data'] = $this->adminmodel->getPartners();
		if(isset($data['data']))
		{
			$data['page_count'] = ceil($data['data'][0]->pcount/$limit);
			$data['page_current'] = $num;
		}
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'Partner Management';
		$data['btn_add'] = 'Add Partner';
		$data['btn_add_url'] = 'partner/new';
		$data['container_id'] = 'partners-data';
		$data['block'] = 'partners';
	//	var_dump($data);
		$this->load->view('admin/main', $data);
	}

	public function partner($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
				$data['data'] = $this->adminmodel->getPartner($str);
				$data['heading'] = 'Partner';
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function add_partner()
	{
		$add_result = $this->adminmodel->addPartner($_POST);
	 	if($add_result)
		{
			$result['message'] = 'New partner added';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		else
		{
			$result['message'] = 'An unexpected error occurred. Please try again!';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		$this->load->view('admin/result', $result);
	}

	public function update_partner()
	{
		$update_result = $this->adminmodel->updatePartner($_POST);
	 	if($update_result)
		{
			$result['message'] = 'Partners info updated';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		else
		{
			$result['message'] = 'An unexpected error occurred. Please try again!';
			$result['url'] = $_SERVER['HTTP_REFERER'];
		}
		$this->load->view('admin/result', $result);
	}


/*============================== END PARTNER ================================*/



/*============================== SUBMISSION ================================*/

	public function submissions($order = 'title', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getSubmissions($order, $sort, $limit, $idx);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'title' => array('Title', ''),
			'name' => array('Name', ''),
			'datetime' => array('Datetime', '')
		);
		$data['page'] = $this->uri->segment(QSTR);
		$data['page_type'] = 1;
		$data['heading'] = 'Submission Management';
		$data['container_id'] = 'submissions-data';
		$data['block'] = 'submissions';
		$this->load->view('admin/main', $data);
	}

	public function submission($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			$data['data'] = $this->adminmodel->getSubmission($str);
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function update_submission()
	{
		if(isset($_POST['update_post']))
		{
			$update_result = $this->adminmodel->updatepost($_POST);
			$result['message'] = 'News updated';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
	}

/*============================== END SUBMISSION ================================*/


/*============================== MODULE ================================*/

	public function modules($order = 'name', $sort = 'asc', $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ipp']);
		$idx = intval($limit*($num - 1));
		$result = $this->adminmodel->getModules($order, $sort, $limit, $idx, null);
		$data['data'] = $result['rows'];
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
		$config['base_url'] = base_url($data['current'].'/'.$order.'/'.$sort);
		$config['total_rows'] = $result['count'];
		$config['uri_segment'] = 5;
		$data['pagination'] = $this->createPagination($config);
		$data['page'] = $this->uri->segment(QSTR);
		$data['order'] = $order;
		$data['sort'] = $sort;
		$data['fields'] = array(
			'name' => array('Name', ''),
			'type' => array('Type', ''),
			'position' => array('Position/function', ''),
			'ordering' => array('Ordering', 'text-center'),
			'status' => array('Status', 'text-center'),
			'lastmodified' => array('Last Modified', ''),
		);
		$data['page_type'] = 1;
		$data['heading'] = 'Module';
		$data['btn_add'] = 'New module';
		$data['btn_add_url'] = 'module/new';
		$data['container_id'] = 'module-data';
		$data['block'] = 'modules';
		$this->load->view('admin/main', $data);
	}


	public function module($str)
	{
		$data['page'] = $this->uri->segment(QSTR);
		if(!isset($str) || $str != 'new' && !is_numeric($str))
		{
			$result['message'] = 'No data';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
		else
		{
			if(is_numeric($str))
				$data['data'] = $this->adminmodel->getModule($str);
		//	$data['heading'] = 'Module';
		//	$data['types'] = $this->adminmodel->getModuleType();
			$data['category'] = $this->get_module_category();
			$data['category_tree'] = $this->get_category(1, 'post');
			$data['extra_js'] = array('admin-module.js');
			$this->load->view('admin/blocks/form', $data);
		}
	}

	public function get_module_category($level = 1, $type = null)
	{
		$i = $level;
		$data['category'] = array();
		while($this->adminmodel->getModuleCategoryByLevel($i, $type) != null)
		{
			$data['category'][$i] = $this->adminmodel->getModuleCategoryByLevel($i, $type);
			$i++;
		}
		return $data['category'];
	//	var_dump($data['category']);
	}

	public function get_child_module_type()
	{
		if(isset($_POST))
		{
		//	$str = '"type":"'.$_POST['ctype'].'"';
			$data['types'] = $this->adminmodel->getChildModuleType($_POST['cid']);
			if(isset($data['types']))
				$this->load->view('admin/blocks/append/module-types', $data);
			else
				echo '';
			return;
		}
		else
			return false;
	}

	public function add_module()
	{
		if($this->input->post('add_module'))
		{
			$post = $this->input->post();
			if($this->input->post('cm_cid'))
				$post['m_mcid'] = $post['cm_mcid'];

			$add_result = $this->adminmodel->addModule($post);
			if($add_result)
			{
				if($this->input->post('p_gallery'))
				{
					$gallery = array();
					foreach(explode(', ', $post['p_gallery']) as $gal)
					{
						$items = explode('|', $gal);
						$items[0] = $this->handle_img_string($items[0])['path'];
						array_push($gallery, $items);
					}
				//	var_dump($gallery);
					$this->adminmodel->addImg($add_result[0], $gallery);
				}
				$result['message'] = 'New module added';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
			}
			$this->load->view('admin/result', $result);
		}
	}

	public function update_module()
	{
		if($this->input->post('update_module')){
			$post = $this->input->post();
			if($this->input->post('cm_cid'))
				$post['m_mcid'] = $post['cm_cid'];
			$post['time'] = date('Y-m-d H:i:s');
			$update_result = $this->adminmodel->updateModule($post);
			if($update_result)
			{
				if($this->input->post('del_imgs'))
				$this->adminmodel->deleteImg(explode(',', $post['del_imgs']));
				$new_imgs = $this->input->post('new_imgs') ? explode(', ', $post['new_imgs']) : array();
				if($this->input->post('p_gallery') && count($new_imgs) > 0)
				{
					$gallery = array();
					$list = explode(', ', $post['p_gallery']);
					$i = 0;
					while($i < count($list))
					{
						if(in_array($i, $new_imgs))
						{
							$items = explode('|', $list[$i]);
							$items[0] = $this->handle_img_string($items[0])['path'];
							array_push($gallery, $items);
						}
						$i++;
					}
					$this->adminmodel->addImg($post('pid'), $gallery);
				}

			 	$result['message'] = 'Module\'s content updated';
				$result['url'] = $_SERVER['HTTP_REFERER'];
				$this->load->view('admin/result', $result);
			}
			else
			{
				$result['message'] = 'An unexpected error occurred. Please try again!';
				$result['url'] = $_SERVER['HTTP_REFERER'];
				$this->load->view('admin/result', $result);
			}
		}
	}


/*============================== END MODULE ================================*/

	public function media()
	{

			$data['page_type'] = 1;
			$data['heading'] = 'Media';
			$data['container_id'] = 'media-data';
			$data['block'] = 'media';
			$this->load->view('admin/blocks/uploader');

	}

/*============================== AJAX ACTION ================================*/

	public function ajax_update()
	{
		if($_POST['type'] != 'featured')
		{
			if($_POST['cat'] == 'menu')
			{
				$update_result = $this->adminmodel->updateMenuStat($_POST);
				if($update_result)
					echo 'ok';
			}
			if($_POST['cat'] == 'category')
			{
				$update_result = $this->adminmodel->updateCategoryStat($_POST);
				if($update_result)
					echo 'ok';
			}
			if($_POST['cat'] == 'post')
			{
				$update_result = $this->adminmodel->updatePostStat($_POST);
				if($update_result)
					echo 'ok';
			}
			if($_POST['cat'] == 'module')
			{
				$update_result = $this->adminmodel->updateModuleStat($_POST);
				if($update_result)
					echo 'ok';
			}
			if($_POST['cat'] == 'user')
			{
				$update_result = $this->adminmodel->updateUserStat($_POST);
				if($update_result)
					echo 'ok';
			}
			if($_POST['cat'] == 'member')
			{
				$update_result = $this->adminmodel->updateMemberStat($_POST);
				if($update_result)
					echo 'ok';
			}
		}
		else
		{
			if($_POST['cat'] == 'post')
			{
				$update_result = $this->adminmodel->updatePostFeatured($_POST);
				if($update_result)
					echo 'ok';
			}
		}
	}


	public function ajax_delete()
	{
		switch($_POST['cat'])
		{
			case 'menu':
				$delete_result = $this->adminmodel->deleteMenu($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
			case 'module':
				$check = $this->adminmodel->checkModuleType($_POST['id']);
				$delete_result = $this->adminmodel->deleteModule($_POST['id']);
				if($delete_result)
					echo 'ok';
				else
					echo 'An error occurred when deleting module';
				return;
				break;
			case 'user':
				$delete_result = $this->adminmodel->deleteUser($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
			case 'partner':
				$delete_result = $this->adminmodel->deletePartner($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
			case 'post':
				$delete_result = $this->adminmodel->deletePost($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
			case 'category':
				$delete_result = $this->adminmodel->deleteCategory($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
			case 'submission':
				$delete_result = $this->adminmodel->deleteSubmission($_POST['id']);
				if($delete_result)
					echo 'ok';
				break;
		}
	}

	public function ajax_update_submission()
	{
		$update_result = $this->adminmodel->updateSubmission($_POST);
		if($update_result)
			echo 'ok';
	}

	public function get_subcategory()
	{
		$data = $this->adminmodel->getSubCategory($_POST['cid']);
		require 'application/views/admin/blocks/categories-block.php';
		return;
	}

/*============================== END AJAX ACTION ================================*/


/*==================================== END MAIN FUNCTION ======================================*/


	public function doLogin()
	{
		$check = $this->adminmodel->login($_POST['username'], $_POST['password']);
	//	var_dump($_POST);
		if($check != null)
		{
			$session = array(
				'auth' => $check->u_ugid,
				'id' => $check->uid,
			//	'state' => $check->u_stat,
				'user' => $check->u_uname,
			//	'name' => $check->u_name
			);
			$this->session->set_userdata($session);
			if(isset($_POST['remember']) && $_POST['remember'] == 1)
			{
				$this->input->set_cookie(
					array(
						'name' => 'auth',
						'value' => $check->u_ugid,
						'expire' => 604800
					)
				);
				$this->input->set_cookie(
					array(
						'name' => 'id',
						'value' => $check->uid,
						'expire' => 604800
					)
				);
				$this->input->set_cookie(
					array(
						'name' => 'user',
						'value' => $check->u_uname,
						'expire' => 604800
					)
				);
			}
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		}
		else
		{
			$result['message'] = 'Wrong username/password';
			$result['url'] = $_SERVER['HTTP_REFERER'];
			$this->load->view('admin/result', $result);
		}
	}

	public function create_password($value)
	{
		echo $this->adminmodel->encrypt($value);
		return;
	//	$value = $this->uri->segment(QSTR + 1);
		$key = 'tr_key';
		$data = trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $value, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND))));
		echo $this->manipulate_string($data).'<br>';
		echo $data;
	}

	public function encrypt($value)
	{
	//	$value = $this->uri->segment(QSTR + 1);
		$key = 'tr';
		$data = trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $value, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND))));
		echo $this->manipulate_string($data).'<br>';
		echo $data;
	}

	public function decrypt($value)
	{
		$value = $this->manipulate_string($value, 'bw');
		$key = 'tr';
		$data = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, base64_decode($value), MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND)));
		echo $data;
	}

	public function manipulate_string($str, $direct = 'fw')
	{
		$disallowed = array('=', '+', '/');
		$allowed = array('.e', '.p', '.s');
		if($direct == 'fw')
			return str_replace($disallowed, $allowed, $str);
		else
			return str_replace($allowed, $disallowed, $str);
	}

	public function logout()
	{
		$this->session->sess_destroy();
		delete_cookie('auth');
		delete_cookie('id');
		delete_cookie('user');
		header('Location: ' . $this->admin_url);
	}

	public function checkAuth()
	{
		if(isset($this->session->userdata['auth']))
		{
			if($this->session->userdata['auth'] <= 2)
				return $this->session->userdata['auth'];
			else
				return false;
		}
		elseif($this->input->cookie('auth') && $this->input->cookie('id') && $this->input->cookie('user'))
		{
			$session = array(
				'auth' => $this->input->cookie('auth'),
				'id' => $this->input->cookie('id'),
				'user' => $this->input->cookie('user')
			);
			$this->session->set_userdata($session);
			if($this->session->userdata['auth'] <= 2)
				return $this->session->userdata['auth'];
			else
				return false;
		}
		else
			return false;
	}

	public function request_uri()
	{
		$url = $_SERVER["REQUEST_URI"];
		return $url;
	}

	public function uri($index)
	{
		$str = explode('/', $_SERVER["REQUEST_URI"]);
		if(isset($str[$index]) && $str[$index] != '')
			return $str[$index];
		else
			return null;
	}

	/*
	method for creating pagination, taking 1 array as parameter with at least 4 required key-value pairs:
		'base_url', 'total_rows', 'per_page', 'uri_segment'
	The function returns pagination links that can showed on page by echo it;
	*/
	public function createPagination($conf){
		$config['base_url'] = $conf['base_url'];
		$config['total_rows'] = $conf['total_rows'];
		$config['per_page'] = isset($conf['per_page']) ? $conf['per_page'] : $this->site_config['ipp'];
		$config['uri_segment'] = $conf['uri_segment'];
		$config['num_links'] = 4;
		$config['use_page_numbers'] = TRUE;
		$config['first_link'] = 'First';
		$config['prev_link'] = '<i class="fa fa-angle-double-left"></i>';
		$config['last_link'] = 'Last';
		$config['next_link'] = '<i class="fa fa-angle-double-right"></i>';
		$config['full_tag_open'] = '<ul class="pagination pagination-sm margin-5">';
		$config['full_tag_close'] = '</ul>';
		$config['first_tag_open'] = '<li>';
		$config['prev_tag_open'] = '<li>';
		$config['last_tag_open'] = '<li>';
		$config['next_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['prev_tag_close'] = '</li>';
		$config['last_tag_close'] = '</li>';
		$config['next_tag_close'] = '</li>';
		$config['cur_tag_open'] = '<li class="active"><a>';
		$config['cur_tag_close'] = '</a></li>';
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$this->pagination->initialize($config);
		return $this->pagination->create_links();
	}

	/*========================== TEMP ============================*/

	public function send_mail()
	{
		$config = array(
			'protocol' => 'smtp',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_port' => 456,
			'smtp_user' => 'tamvobiz@gmail.com',
			'smtp_pass' => 'g14f21n1425215y',
			'charset' => 'utf-8',
			'wordwrap' => TRUE,
			'mailtype' => 'html'
		//	'newline' => "\r\n"
		);
		$this->load->library('email', $config);
		$this->email->set_newline("\r\n");
	//	$this->email->initialize($config);
		$this->email->from('tamvobiz@gmail.com', 'Tam Vo');
		$this->email->to('vntbiz@gmail.com');
		$this->email->cc('vonhattam@gmail.com');
		$this->email->subject('Email Test');
		$content = '<h1>Message title</h1>';
		$content += '<div><strong>Very important!</strong></div>';
		$content += '<div>Email content goes here</div>';
		$content += '<div>Signature</div>';
		$this->email->message($content);
		$this->email->send();
		echo $this->email->print_debugger();
	}

	public function tempct()
	{
	/* 	$result = $this->adminmodel->ctlist();
		$str1 = '';
		$str2 = '';
		foreach($result as $item){
			$str1 .= '"'.$item['ct_name'].'", ';
			$str2 .= '"'.$item['ct_code'].'", ';
//echo $item['ct_name']		;
		}
		echo $str1.'<br><br>';
		echo $str2; */
		$typeArray = array(
			'1'	=> array('type'	=> 'ALLOCATION',
						 'pos'		=> 'right',
						 'order'	=> '1',
					),

			'2'	=> array('type'	=> 'BEST_PERFORMER',
						 'pos'	=> 'right',
						 'order'	=> '3',
					),

			'3'	=> array('type'	=> 'BOND',
						 'pos'	=> 'left',
						 'order'	=> '2',
					),

			'4'	=> array('type'	=> 'HOLDING',
						 'pos'	=> 'left',
						 'order'	=> '6',
					),

			'8'	=> array('type'	=> 'TOP10_TRANSACTION',
						 'pos'	=> 'left',
						 'order'	=> '3',
					),

			'11'=> array('type'	=> 'FLAGGED_TRANSACTION',
						 'pos'	=> 'left',
						 'order'	=> '4',
					),

			'12'=> array('type'	=> 'PENDING_TRANSACTION',
						 'pos'	=> 'left',
						 'order'	=> '5',
					),

			'5'	=> array('type'	=> 'NETWORTH',
						 'pos'	=> 'right',
						 'order'	=> '5',
					),

			'6'	=> array('type'	=> 'PERFORMANCE_YTD',
						 'pos'	=> 'left',
						 'order'	=> '1',
					),

			'7'	=> array('type'	=> 'TOP10_HOLDING',
						 'pos'	=> 'right',
						 'order'	=> '2',
					),

			'9'	=> array('type'	=> 'WATCHLIST',
						 'pos'	=> 'left',
						 'order'	=> '7',
					),
			'10'	=> array('type'	=> 'WORST_PERFORMER',
						 'pos'	=> 'right',
						 'order'	=> '4',
					),
		);
		$temp = serialize($typeArray);
		echo $temp; die;
	}

	public function checkInfo()
	{
		echo $this->input->ip_address().'<br><br>';
		echo phpinfo().'<br><br>';
	}

}
