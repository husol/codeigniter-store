<?php
class Home extends MY_Site {
	public $model = null;
	public $site_config = array();
	public $base_info = array();
	public $page_title = null;
	public $mainmenu = '';
	public $topmenu = '';
	public $home_modules = array();
	public $sidebar = array();
	public $sidebar_tree = null;
	public $ads = array();
	public $tree = array();
	function __construct() {
		parent::__construct();
		$this->_init();
	}

	private function _init() {
		$this->load->model('homemodel','',TRUE);
		$this->site_config = $this->homemodel->getConfig();
		$this->mainmenu = $this->homemodel->getMenu('Main menu', $this->lg);
		$param = $this->uri->segment(1) == 'en' ? $this->uri->segment(2) : $this->uri->segment(1);

		foreach($this->mainmenu as $key => $menu)
		{
			if($param == $menu['mn_slug']){
				$this->mainmenu[$key]['isActive'] = true;
			}
			if(isset($menu['children']) && $menu['children'] != '')
			{
				$this->mainmenu[$key]['hasChild'] = true;
				$sub_menus = explode('#,', $menu['children']);
				$this->mainmenu[$key]['children'] = $sub_menus;
				foreach($sub_menus as $num => $sub_menu){
					$sub_menu = explode('/', $sub_menu);
					$this->mainmenu[$key]['children'][$num] = $sub_menu;
					if(strpos($sub_menu[1], $param) !== false)
					{
						$this->mainmenu[$key]['isActive'] = true;
						$this->mainmenu[$key]['children'][$num]['isActive'] = true;
					}
				}
			}
		}
		$this->base_info['banner'] = $this->homemodel->getBanner($this->lg);
		$this->base_info['footer'] = $this->homemodel->getFooter($this->lg);
		$this->ads['leader'] = $this->homemodel->getAdLeader();

		$load_sidebar = true;
		if(!$this->uri->segment(1)) {
			$load_sidebar = false;
		}
        else if($this->uri->segment(1) == 'en' && (!$this->uri->segment(2) || $this->uri->segment(2) == 'about-us')) {
			$load_sidebar = false;
		}
		else if($this->uri->segment(1) == 'gioi-thieu') {
			$load_sidebar = false;
		}
        if($this->uri->segment(1) == 'en' && (!$this->uri->segment(2) || $this->uri->segment(2) == 'contact')) {
			$load_sidebar = false;
		}
		else if($this->uri->segment(1) == 'lien-he') {
			$load_sidebar = false;
		}

		if($load_sidebar) {
			$this->get_sidebar();
		}
	}

	public function wait()
	{
		$this->load->view('home/pending');
	}

	public function function_filter($param1 = null, $param2 = null, $param3 = null, $param4 = null)
	{

		if($param1 == 'en')
		{
			$param1 = $param2;
			$param2 = $param3;
			$param3 = $param4;
		}
		if(method_exists($this, $param1))
		{
			$this->{$param1}($param2, $param3);
		}
		else{
			$filter_data = $this->homemodel->defineMenuBySlug($param1, $this->lg);
			if(!isset($filter_data))
				show_404();

			$this->page_title = $filter_data->mn_title;
			if(!isset($param2)){
				if($filter_data->mn_cid == 1) $this->contact();

				switch($filter_data->c_type)
				{
					case 'single page':
						$this->post($filter_data->mn_target);
						break;
					case 'post':
						$this->posts($filter_data->cid);
						break;
					case 'video':
						$this->videos();
						break;
				}
			}
			else
			{
				if(!isset($param3)){
					if(!is_numeric($param2))
					{
						switch($filter_data->c_type)
						{
							case 'post':
								$this->post($param2);
								break;
							case 'video':
								$this->video_detail($param2, $param3);
								break;
						}
					}
					else
					{
						switch($filter_data->c_type)
						{
							case 'post':
								$this->posts($filter_data->cid, $param2);
								break;
							case 'video':
								show_404();
								break;
						}
					}
				}
				else
				{
					if($filter_data->c_type == 'post')
						show_404();
				}
			}
		}
	}

	public function get_home_modules()
	{
		$modules = $this->homemodel->getHomeModules();
		$i = 1;
		if(isset($modules)){
			foreach($modules as $item)
			{
				$meta = json_decode($item->m_meta, true);
				switch($item->mc_fn) {
					case 'featured_s1':
					case 'featured_s2':
						$this->home_modules[$i]['content']['header'] = $this->lg == 1 ? $item->m_name : $item->m_name_trans;
						$this->home_modules[$i]['content']['posts'] = $this->homemodel->getHomeModuleByCategory($meta['id'], $this->lg);
						$this->home_modules[$i]['content']['news'] = $this->homemodel->getHomeModuleByCategory(8, $this->lg);
						$this->home_modules[$i]['function'] = $item->mc_fn;
						break;
					case 'slideshow':
						$j = 0;
						foreach($meta['slideshow'] as $itemSlide){
							$this->home_modules['slideshow']['function'] = $item->mc_fn;
							$this->home_modules['slideshow']['content'][$j]['src'] = $itemSlide['src'];
							$this->home_modules['slideshow']['content'][$j]['caption'] = $this->lg === 1 ? (isset($itemSlide['caption']) ? $itemSlide['caption'] : '') : (isset($itemSlide['caption_trans']) ? $itemSlide['caption_trans'] : '');
							$j++;
						}
						break;
				}
				$i++;
			}
		}
	}

	public function get_sidebar()
	{
		$sidebar = $this->homemodel->getSidebarModules();
		$i = 1;
		if(isset($sidebar)){
			foreach($sidebar as $item)
			{
				$this->sidebar[$i]['function'] = $item->mc_fn;
				switch($item->mc_fn)
				{
					case 'category_tree':
						$this->sidebar[$i]['content']['header'] = $item->m_name;
						$this->sidebar[$i]['content']['data'] = $this->homemodel->getCategoryTree(json_decode($item->m_meta, true)['id'], $this->lg);
						break;
					case 'top_viewed':
						$this->sidebar[$i]['content'] = $this->homemodel->getTopViewed($this->lg);
						break;
					case 'latest':
						$this->sidebar[$i]['content'] = $this->homemodel->getLatest($this->lg);
						break;
					case 'facebook_like_box':
						$this->sidebar[$i]['content'] = json_decode($item->m_meta, true);
						break;
					case 'youtube_video':
						$this->sidebar[$i]['content'] = json_decode($item->m_meta, true);
						$this->sidebar[$i]['content']['slug'] = url_title($this->convertUtf8($this->sidebar[$i]['content']['title']));
						break;
					default:
						$this->sidebar[$i]['content'] = $item->m_content;
				}
				$i++;
			}
		}
	}

	public function build_tree($tr)
	{
		$this->tree['url'][0] = base_url();
		$this->tree['name'][0] = 'Trang chủ';
		$str = '';
		for($i=1;$i<$this->uri->total_segments();$i++)
		{
			$str = $str.$this->uri->segment($i).'/';
			$this->tree['url'][$i] = base_url($str).'.html';
		}
		$tree = explode('/', $tr);
		for($i=0;$i<count($tree);$i++)
		{
			$this->tree['name'][$i+1] = $tree[$i];
		}
	}

	public function get_category()
	{
		$i = 1;
		$data['category'] = array();
		while($this->homemodel->getCategory($i) != null)
		{
			$data['category'][$i] = $this->homemodel->getCategory($i);
			$i++;
		}
		return $data['category'];
	}

	public function index()
    {
		$data['featured'] = $this->homemodel->getFeaturedPosts($this->lg);
		$data['latestProducts'] = $this->homemodel->getLatestProducts($this->lg);
		$data['latestNews'] = $this->homemodel->getLatestPosts($this->lg);
		$data['modules'] = $this->get_home_modules();

		$data['partners'] = $this->homemodel->getPartners();
		$data['page_style'] = 1;
		$data['page'] = 'Home';
		$data['block'] = 'home';
		$data['idx'] = 0;

		$this->load->view('home/main', $data);
    }

/*============================== POSTS ================================*/

	public function posts($id = null, $num = 1)
    {
		if($id == null)
			show_404();
		if(!is_numeric($num))
			$num = 1;

		$limit = intval($this->site_config['ppp']);
		$idx = intval($limit*($num - 1));
		$data['page_style'] = 1;
		$data['posts_style'] = 2;
		$data['page'] = 'posts';
		$data['block'] = 'posts';
		$data['no_data'] = lang('no_post');
		$cat = $this->homemodel->getCategoryInfo($id, $this->lg);
		$this->product_intro = $cat['c_intro'];
		if(!$cat['c_name'])
			$this->load->view('home/main', $data);
		$tree = $this->homemodel->getCategoryTree($id, $this->lg);
		//$this->sidebar_tree['content']['data'] = count($tree[0]['child']) > 0 ? $tree : null;
		$data['heading'] = $this->sidebar_tree['content']['header'] = $cat['c_name'];
		$data['header_icon'] = 'level-up rotate-90';
		$this->sidebar_tree['content']['data'] = count($tree) > 0 ? $tree : null;

		$result = $this->homemodel->getPostsByCid($id, $limit, $idx, $this->lg);
		$data['data'] = $result['rows'];
		if(isset($data['data'])){
			$data['page_current'] = $num;
			$conf['uri_segment'] = 2;
			$conf['total_rows'] = $result['count'];
			$conf['per_page'] = $limit;
			$data['pagination'] = $this->pagination($conf);
		}

		$this->get_home_modules();
		$this->load->view('home/main', $data);
    }

	public function tag($str = null, $num = 1)
    {
		if(is_null($num))
			$num = 1;
		if($str == null || !is_numeric($num))
			show_404();

		$limit = intval($this->site_config['ppp']);
		$idx = intval($limit*($num - 1));
		$str = urldecode($str);
		$result = $this->homemodel->getPostsByTag($str, $limit, $idx, $this->lg);
		$data['data'] = $result['rows'];
		if(isset($data['data'])){
			$data['page_current'] = $num;
			$conf['uri_segment'] = 3;
			$conf['str'] = $str;
			$conf['total_rows'] = $result['count'];
			$conf['per_page'] = $limit;
			$data['pagination'] = $this->pagination($conf);
		}
		$data['page_style'] = 1;
		$data['posts_style'] = 3 ;
		$data['page'] = 'posts';
		$data['block'] = 'posts';
		$data['header_icon'] = 'tags';
		$this->page_title = $data['heading'] = lang('posts_with_tag').' "'.urldecode($str).'"';
		$data['no_data'] = lang('no_post');
		$this->load->view('home/main', $data);

    }

	public function post($str)
	{
		$id = $this->get_id_from_str($str);
		if(!is_numeric($id))
			show_404();

		$data['data'] = $this->homemodel->getPost($id, $this->lg);
		if(!isset($data['data']))
			show_404();

		$this->homemodel->upcountHit($id);
		$this->get_home_modules();

		$data['page_style'] = 1;
		$data['page'] = 'post';
		$data['block'] = 'post';
		$this->page_title = $data['heading'] = $data['data']->p_title;
		if($data['data']->p_meta != '')
		{
			$data['extra_css'] = array('flexslider.min.css');
			$data['extra_js'] = array('jquery.flexslider-min.js', 'post.js');
		}
		if($data['data']->c_slug != 'single-page')
		{
			$data['og'] = array(
				'title' => $data['data']->p_title,
				'url' => base_url($data['data']->c_slug.'/'.$data['data']->p_slug.'-'.$data['data']->pid),
				'image' => base_url('asset/data/'.$data['data']->p_ym.'thumbnail/'.$data['data']->p_img),
				'des' => $data['data']->p_shorttext,
			);
			if($data['data']->tags != '')
			$data['tags'] = explode(',', $data['data']->tags);
			$data['preferred'] = base_url($this->lgPath.$data['data']->c_slug.'/'.$data['data']->p_slug.'-'.$data['data']->pid);
			if(current_url() == $data['preferred'])
				$this->load->view('home/main', $data);
			else
				redirect($data['preferred'], 'location', 301);
		}
		else
		{
			$data['preferred'] = current_url();
			$this->load->view('home/main', $data);
		}
	}


/*============================== END POSTS ================================*/

	public function pagination($conf)
	{
		$config['uri_segment'] = $this->lg == 1 ? $conf['uri_segment'] : $conf['uri_segment'] + 1;
		if(isset($conf['str']))
			$config['base_url'] = base_url($this->lgPath.$this->uri->segment($this->lg).'/'.$conf['str']);
		else
			$config['base_url'] = base_url($this->lgPath.$this->uri->segment($this->lg));
		$config['use_page_numbers'] = TRUE;
		$config['total_rows'] = $conf['total_rows'];
		$config['per_page'] = $conf['per_page'];
		$config['num_links'] = 3;
		$config['next_link'] = '<i class="fa fa-angle-double-right"></i><i class="fa fa-angle-double-right"></i>';
		$config['prev_link'] = '<i class="fa fa-angle-double-left"></i><i class="fa fa-angle-double-left"></i>';
		$config['first_link'] = lang('first_page');
		$config['last_link'] = lang('last_page');
		$this->pagination->initialize($config);
		return $this->pagination->create_links();
	}

	public function quick_search()
	{
		$post = $this->input->post('input');
		if(!$this->input->post('input'))
			$post = '';
		header('location: '.base_url().($this->lg == 1 ? 'tim-kiem/' : 'en/search/').$post);

	/* 	else
			$_SESSION['hdata'] = $this->homemodel->quickSearchProducts($_SESSION['hpost'], $limit, $idx);		 */
	}

	public function search_result($str, $num = 1)
	{
		if(!is_numeric($num))
			$num = 1;
		$limit = intval($this->site_config['ppp']);
		$idx = intval($limit*($num - 1));
		if(isset($str))
		{
			$temp = explode('/', $str);
			$key = urldecode($temp[0]);
			if(count($str) == 1)
			{
				$result = $this->homemodel->quickSearchPosts($key, $limit, $idx, $this->lg);
				//var_dump($result);die;
				$data['data'] = $result['rows'];
			}
		}
		if(isset($data['data'])){
			$data['page_current'] = $num;
			$conf['uri_segment'] = 3;
			$conf['str'] = $str;
			$conf['total_rows'] = $result['count'];
			$conf['per_page'] = $limit;
			$data['pagination'] = $this->pagination($conf);
		}
		$data['page_style'] = 1;
		$data['posts_style'] = 3 ;
		$data['page'] = 'posts';
		$data['block'] = 'posts';
		$data['header_icon'] = 'search';
		$this->page_title = $data['heading'] = lang('search_result').' "'.urldecode($str).'"';
		$data['no_data'] = lang('search_no_result').' "'.urldecode($str).'"';
		$this->load->view('home/main', $data);
	}

	public function contact()
	{
		$data['page_style'] = 1;
		$data['page'] = 'contact';
		$data['block'] = 'contact';
		$this->get_home_modules();
		$this->load->view('home/main', $data);
	}

	public function about()
	{
		$data['page_style'] = 1;
		$data['page'] = 'about';
		$data['block'] = 'about';
		if($this->uri->segment(1) == 'en') {
			$data['page'] = 'about_en';
			$data['block'] = 'about_en';
			$this->page_title = "About";
		}
		else {
			$this->page_title = "Giới thiệu";
		}
		$data['heading'] = $this->page_title;
		$this->load->view('home/main', $data);
	}

	public function submit_form()
	{
		if(isset($_POST['submit']))
		{
			$_POST['s_datetime'] = date('Y-m-d H:i:s');
		 	$send_result = $this->homemodel->addSubmission($_POST);
			if($send_result)
			{
				$this->sendMail($this->input->post());
				$result['state'] = true;
				$result['message'] = lang('contact_submit_success');
			}
			else
			{
				$result['state'] = false;
				$data['message'] = lang('contact_submit_fail');
			}
			$data['page_style'] = 1;
			$data['page'] = 'Home';
			$data['block'] = 'home';
			$this->session->set_flashdata('result', $result);
			header('location: '.base_url($this->lgPath));
		}
	}


	/* ================ OTHERS ================= */

	/*
	method for sending email function, taking 1 array as parameter with at least 4 required key-value pairs:
		'template' -- name of the file contain html email content. e.g.: 'email_template',
		'subject' -- email subject,
		'email' -- send to email,
		'name' -- name of the receiver
	*/
	public function sendMail($data)
	{
		$config = array(
			'protocol' => 'smtp',
			'smtp_host' => 'smtp.zoho.com',
			'smtp_port' => 465,
			'smtp_user' => 'enquiry@husol.org',
			'smtp_pass' => 'husol123ok',
			'mailtype' => 'html',
			'charset' => 'iso-8859-1',
			'wordwrap' => TRUE
		);
		$this->load->library('email', $config);
		$this->email->set_newline("\r\n");
		$this->email->from($this->site_config['email_sender']);
		$this->email->to($this->site_config['email_receiver']);
		$this->email->subject('['.date('d/m/Y | H:i').'] New submission');
		$email['data'] = $data;
		$content = $this->load->view('home/blocks/email_submission', $email, TRUE);
	 	$this->email->message($content);
		if($this->email->send())
			return true;
		else
			return $this->email->print_debugger();
	}


	// Function via: http://css-tricks.com/snippets/php/get-current-page-url/
	function getUrl() {
	  $url  = @( $_SERVER["HTTPS"] != 'on' ) ? 'http://'.$_SERVER["SERVER_NAME"] :  'https://'.$_SERVER["SERVER_NAME"];
	  $url .= ( $_SERVER["SERVER_PORT"] !== 80 ) ? ":".$_SERVER["SERVER_PORT"] : "";
	  $url .= $_SERVER["REQUEST_URI"];
	  return $url;
	}

	public function get_hf()
	{
		$hf = $this->homemodel->getHF();
		return $hf;
	}

	public function truncate($text, $limit = 20)
	{
		if(str_word_count($text) > $limit)
		{
			$word_array = str_word_count($text, 2);
			$idx = array_keys($word_array);
			$text = substr($text, 0, $idx[$limit]).'...';
			return $text;
		}
		else
			return $text;
	}

	public function uri($index)
	{
		$str = explode('/', $_SERVER["REQUEST_URI"]);
		if(isset($str[$index]) && $str[$index] != '')
			return $str[$index];
		else
			return null;
	}


	public function get_id_from_str($str, $sep = '-')
	{
		$rq = explode($sep, $str);
		end($rq);
		$idx = key($rq);
		$id = $rq[$idx];
		return $id;
	}

	function ConvertUtf8($str){
        if(!$str) return false;
        $unicode = array(
			'a' =>  'A|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ|á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ',
			'b' =>  'B',
			'c' =>  'C',
			'd' =>  'D|Đ|đ',
			'e' =>  'E|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ|é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
			'f' =>  'F',
			'g' =>  'G',
			'h' =>  'H',
			'i' =>  'I|Í|Ì|Ỉ|Ĩ|Ị|í|ì|ỉ|ĩ|ị',
			'j' =>  'J',
			'k' =>  'K',
			'l' =>  'L',
			'm' =>  'M',
			'n' =>  'N',
			'o' =>  'O|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ|ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
			'p' =>  'P',
			'q' =>  'Q',
			'r' =>  'R',
			's' =>  'S',
			't' =>  'T',
			'u' =>  'U|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự|ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
			'v' =>  'V',
			'w' =>  'W',
			'x' =>  'X',
			'y' =>  'Y|Ý|Ỳ|Ỷ|Ỹ|Ỵ|ý|ỳ|ỷ|ỹ|ỵ',
			'z' =>  'Z'
        );
        foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
			return $str;
    }

	public function show_angle()
	{
		echo $this->getAngle('15h30').'<br>';
		echo $this->getAngle('15H39').'<br>';
		echo $this->getAngle('2:26').'<br>';
	}

	public function getAngle($a)
	{
		$time = preg_split( "/(h|H|\:)/", $a );
		$temp = abs(0.5*((60*($time[0] > 12 ? $time[0] - 12 : $time[0]) - 11*$time[1])));
		return $temp > 180 ? $temp-180 : $temp;
	}
}
