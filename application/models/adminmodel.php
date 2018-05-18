<?php

class AdminModel extends CI_Model {
    function __construct() {
    }

	public function login($username, $pass)
	{
		$pass = $this->encrypt($pass);
        $query = $this->db->get_where('user',array('u_uname' => $username, 'u_pass' => $pass, 'u_ugid <=' => 2, 'u_stat' => 1));
        return $query->num_rows() > 0 ? $query->row() : null;

	}

	public function editorLogin($username, $pass)
	{
		$pass = $this->encrypt($pass);
        $query = $this->db->get_where('user',array('u_uname' => $username, 'u_pass' => $pass, 'u_ugid <>' => 99, 'u_stat' => 1));
        return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function encrypt($value)
	{
		$key = 'c4cdb9fa4cd11e07ed38906cf77de0af';
		$data = trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $value, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND))));
		return $data;
	}

	public function getConfig()
	{
		$query = $this->db->query("SELECT * FROM config");
		return $query->num_rows() > 0 ? $query->row_array() : null;
	}

	public function getCategoryByGroup()
	{
		$sql = "SELECT a.cid cid, a.c_name name, a.c_hasmeta hasmeta , a.c_type type, b.c_name name_trans FROM category a LEFT JOIN category_trans b ON a.cid = b.c_ref WHERE a.c_group = 'page' AND a.c_level = 1 AND a.c_stat = '1' ORDER BY a.c_name ASC";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->result() : null;
	}


/*============================== MENU MANAGEMENT ================================*/

/* 	public function getMenus($limit, $idx)
	{
		$sql = "SELECT mnid, mn_name, mn_group, mn_ordering, mn_stat, c_name, c_meta, (SELECT COUNT(mnid) FROM menu WHERE mn_group = ?) mcount FROM menu LEFT JOIN category ON mn_cid = cid WHERE mn_group = ? LIMIT ".$idx.", ".$limit;
		$query = $this->db->query($sql, array('Main menu', 'Main menu'));
		return $query->num_rows() > 0 ? $query->result() : null;
	} */

	public function getMenus($order, $sort, $limit, $idx)
	{
		$this->db->start_cache();
		$this->db->select('mnid, mn_name name, mn_name_trans name_trans, mn_group mnGroup, mn_ordering ordering, mn_stat status, c_name, c_type type');
		$this->db->from('menu');
		$this->db->join('category', 'mn_cid = cid');
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
        $this->db->order_by($order, $sort);
        $this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}


	public function getMenu($mnid)
	{
		$sql = "SELECT mnid, mn_name, mn_title, mn_name_trans, mn_title_trans, mn_cid, mn_target, mn_ordering, mn_stat, pid, p_title FROM menu LEFT JOIN post ON mn_target = pid WHERE mnid = ?";
		$query = $this->db->query($sql, array($mnid));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addMenu($data)
	{
		$slug = $this->convertUtf8($data['mn_name']);
		$slug = url_title($slug);
		$slug_trans = $this->convertUtf8($data['mn_name_trans']);
		$slug_trans = url_title($slug_trans);
		$sql = "INSERT INTO menu (mn_name, mn_slug, mn_title, mn_name_trans, mn_slug_trans, mn_title_trans, mn_group, mn_cid, mn_target, mn_ordering) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['mn_name'], $slug, $data['mn_title'], $data['mn_name_trans'], $slug_trans, $data['mn_title_trans'], 'Main menu', $data['mn_cid'], $data['mn_target'], $data['mn_ordering']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateMenuStat($data)
	{
		$sql = "UPDATE menu set mn_stat = ? WHERE mnid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateMenu($data)
	{
		$slug = $this->convertUtf8($data['mn_name']);
		$slug = url_title($slug);
		$slug_trans = $this->convertUtf8($data['mn_name_trans']);
		$slug_trans = url_title($slug_trans);
		$sql = "UPDATE menu set mn_name = ?, mn_slug = ?, mn_title = ?, mn_name_trans = ?, mn_slug_trans = ?, mn_title_trans = ?, mn_cid = ?, mn_target = ?, mn_ordering = ? WHERE mnid = ?";
		$query = $this->db->query($sql, array($data['mn_name'], $slug, $data['mn_title'], $data['mn_name_trans'], $slug_trans, $data['mn_title_trans'], $data['mn_cid'], $data['mn_target'], $data['mn_ordering'], $data['mnid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteMenu($mnid)
	{
		$sql = "DELETE FROM menu WHERE mnid = ?";
		$query = $this->db->query($sql, $mnid);
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END MENU MANAGEMENT ================================*/


/*============================== CONFIG MANAGEMENT ================================*/


	public function updateConfig($data)
	{
		$sql = "UPDATE config set logo = ?, sitename = ?, title = ?, email_receiver = ?, metadescription = ?, metakeyword = ?, fb_profile = ?, ppp = ?, ipp = ?";
		$this->db->query($sql, array($data['logo'], $data['sitename'], $data['title'], $data['email_receiver'], $data['metadescription'], $data['metakeyword'], $data['fb_profile'], $data['ppp'], $data['ipp']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END CONFIG MANAGEMENT ================================*/


/*============================== MODULE MANAGEMENT ================================*/

	public function getModules($order, $sort, $limit, $idx, $type = null)
	{
		//, SUBSTRING_INDEX(c_meta, ",", 1) to_sort

		$this->db->start_cache();
		$this->db->select('mid, m_name name, m_name_trans name_trans, m_lastmodified lastmodified, m_ordering ordering, m_stat status, mc_name position, mc_type type, mc_fn');
		$this->db->from('module');
		$this->db->join('module_category', 'm_mcid = mcid', 'left');
		if(!is_null($type))
			$this->db->where('mc_type', $type);
		else
			$this->db->where('mc_type != "homepage"');
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
        $this->db->order_by($order, $sort);
        $this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getModuleCategoryByLevel($level, $type = null)
	{
		$this->db->select('mcid, mc_name, mc_slug, mc_level, mc_parent, mc_hasmeta, mc_fn');
		$this->db->from('module_category');
		$this->db->where('mc_level', $level);
		if(!is_null($type))
			$this->db->where('mc_type', $type);
		else
			$this->db->where('mc_type != "homepage"');
		$this->db->order_by('mc_name');
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getModuleType()
	{
		$sql = "SELECT mcid, mc_name, mc_parent, mc_meta, mc_level FROM module_category";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getChildModuleType($cid)
	{
		$sql = "SELECT mcid, mc_name, mc_meta, mc_level FROM module_category WHERE mc_level = 2 AND mc_parent = ?";
		$query = $this->db->query($sql, array($cid));
		return $query->num_rows() > 0 ? $query->result() : null;
	}
	
	public function getModule($mid)
	{
		$sql = "SELECT mid, m_name, m_name_trans, m_content, m_content_trans, m_meta, m_mcid, m_ordering, m_stat, mc_name, mc_slug, mc_fn FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE mid = ?";
		$query = $this->db->query($sql, array($mid));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function getCidByMeta($str)
	{
		$sql = "SELECT mcid FROM module_category WHERE mc_meta LIKE ?";
		$query = $this->db->query($sql, array('%'.$str.'%'));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addModule($data)
	{
		$sql = "INSERT INTO module (m_name, m_name_trans, m_content, m_content_trans, m_meta, m_mcid, m_ordering, m_stat) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['m_name'], $data['m_name_2'], $data['m_content'], $data['m_content_2'], $data['m_meta'], $data['m_mcid'], $data['m_ordering'], $data['m_stat']));
		return $this->db->affected_rows() > 0 ? $this->db->insert_id() : false;
	}

	public function updateModule($data)
	{
		$sql = "UPDATE module set m_name = ?, m_name_trans = ?, m_content = ?, m_content_trans = ?, m_meta = ?, m_mcid = ?, m_ordering = ?, m_stat = ?, m_lastmodified = ? WHERE mid = ?";
		$query = $this->db->query($sql, array($data['m_name'], $data['m_name_2'], $data['m_content'], $data['m_content_2'], $data['m_meta'], $data['m_mcid'], $data['m_ordering'], $data['m_stat'], $data['time'], $data['mid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateModuleStat($data)
	{
		$sql = "UPDATE module set m_stat = ? WHERE mid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function checkModuleType($mid)
	{
		$this->db->select('mc_name');
		$this->db->from('module');
		$this->db->join('module_category', 'm_mcid = mcid');
		$this->db->where('mid', $mid);
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->row_array() : false;
	}

	public function deleteModule($mid)
	{
		$sql = "DELETE FROM module WHERE mid = ?";
		$query = $this->db->query($sql, array($mid));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteModuleRelated($mid)
	{
		$sql = "DELETE poll_option, vote FROM poll_option LEFT JOIN vote ON poid = v_poid WHERE po_pid = ?";
		$query = $this->db->query($sql, $mid);
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END MODULE MANAGEMENT ================================*/


/*============================== ACCOUNT MANAGEMENT ================================*/

	public function getAccount($uid)
	{
		$sql = "SELECT uid, u_uname, u_pass, u_mobi, u_email FROM user WHERE uid =:uid";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getAdmin($uid)
	{
		$sql = "SELECT uid, u_uname, u_pass FROM user WHERE uid = ?";
		$query = $this->db->query($sql, $uid);
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addUser2()
	{
		if(isset($user['author']))
			$author = $user['author'];
		else
			$author = 0;
		$pass = '12345678';
		$pass = $this->encrypt($pass);
		$sql = "INSERT IGNORE INTO admin (u_uname, u_pass, u_name, u_add, u_mobi, u_email, u_stat, u_auth) VALUES (:username, :password, :name, :address, :mobile, :email, :stat, :author)";
        $query = $this->db->query($sql);
        $query->execute(array(':username' => 'adadmin', ':password' => $pass, ':name' => 'Anh Duong Admin', ':address' => 'No Where', ':mobile' => '000', ':email' => 'admin@email.com', ':stat' => 1, ':author' => 1));
		return $query->num_rows() > 0 ? true : false;
	}

	public function updatePassword($data, $uid)
	{
		$u_pass = $this->encrypt($data['u_pass']);
		$sql = "UPDATE user set u_pass = ? WHERE uid = ?";
		$query = $this->db->query($sql, array($u_pass, $uid));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateAdmin($data)
	{
		if($data['u_pass'] == '')
		{
			$sql = "UPDATE admin set u_name = ?, user_address = ?, user_mobile = ?, user_email = ?, user_author = ? WHERE user_id = ?";
			$this->db->query($sql, array($user['name'], $user['address'], $user['mobile'],$user['email'], $author, $user['id']));
		}
		else
		{
			$u_pass = $this->encrypt($data['u_pass']);
			$sql = "UPDATE users set user_password = ?, user_name = ?, user_address = ?, user_mobile = ?, user_email = ?, user_author = ? WHERE user_id = ?";
			$this->db->query($sql, array($pass, $user['name'], $user['address'], $user['mobile'],$user['email'], $author, $user['id']));
		}
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END ACCOUNT MANAGEMENT ================================*/


/*============================== CATEGORY MANAGEMENT ================================*/

	public function getCategories($order, $sort, $limit, $idx)
	{
		$this->db->start_cache();
		$this->db->select('a.cid cid, a.c_name category, a.c_slug c_slug, a.c_level level, a.c_editable editable, a.c_parent parent, a.c_grparent grparent, b.c_name category_trans, c.c_name parentname, d.c_name grparentname, a.c_stat status');
		$this->db->from('category a');
		$this->db->join('category_trans b', 'a.cid = b.c_ref', 'left');
		$this->db->join('category c', 'a.c_parent = c.cid', 'left');
		$this->db->join('category d', 'a.c_grparent = d.cid', 'left');
		$this->db->where('a.c_group = "page" AND a.c_level >= 1 AND a.c_editable = 1');
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
        $this->db->order_by($order, $sort);
        $this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getCategoryByLevel($c_level, $str = '')
	{
		$sql = "SELECT a.cid cid, a.c_name c_name, a.c_intro intro, a.c_slug c_slug, a.c_level c_level, a.c_parent c_parent, a.c_grparent c_grparent, a.c_type c_type, a.c_hasmeta c_hasmeta, a.c_editable c_editable, b.c_name name_trans, b.c_intro intro_trans FROM category a LEFT JOIN category_trans b ON a.cid = b.c_ref WHERE c_level = ? AND c_type LIKE ? AND a.cid != ? ORDER BY c_name";
		$query = $this->db->query($sql, array($c_level, '%'.$str.'%', CATEGORY_CONTACT));
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getCategoryDetail($cid)
	{
		$sql = "SELECT a.cid cid, a.c_name name, a.c_intro intro, a.c_slug slug, a.c_level level, a.c_ordering ordering, a.c_editable editable, a.c_parent parent, a.c_grparent grparent, b.c_name name_trans, b.c_intro intro_trans, c.c_name parentname FROM category a LEFT JOIN category_trans b ON a.cid = b.c_ref LEFT JOIN category c ON a.c_parent = c.cid WHERE a.cid = ?";
		$query = $this->db->query($sql, $cid);
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addCategory($data)
	{
		$slug = $this->convertUtf8($data['c_name']);
		$slug = url_title($slug);
		$sql = "INSERT INTO category (c_name, c_slug, c_parent, c_grparent, c_group, c_type, c_hasmeta, c_level, c_ordering, c_intro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['c_name'], $slug, $data['c_parent'], $data['c_grparent'], 'page', 'post', 0, $data['c_level'], $data['c_ordering'], $data['c_intro']));
		return $this->db->affected_rows() > 0 ? $this->addCategoryTrans($this->db->insert_id(), $data) : false;
	}

	public function addCategoryTrans($cid, $data)
	{
		$slug = $this->convertUtf8($data['c_name_2']);
		$slug = url_title($slug);
		$sql = "INSERT INTO category_trans (c_name, c_slug, c_ref, c_intro) VALUES (?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['c_name_2'], $slug, $cid, $data['c_intro_2']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateCategoryStat($data)
	{
		$sql = "UPDATE category set c_stat = ? WHERE cid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateCategory($data)
	{
		$slug = $this->convertUtf8($data['c_name']);
		$slug = url_title($slug);
		$sql = "UPDATE category set c_name = ?, c_slug = ?, c_parent = ?, c_grparent = ?, c_level = ?, c_ordering = ?, c_intro = ? WHERE cid = ?";
		$query = $this->db->query($sql, array($data['c_name'], $slug, $data['c_parent'], $data['c_grparent'], $data['c_level'], $data['c_ordering'], $data['c_intro'], $data['cid']));
		return $query ? $this->updateCategoryTrans($data): false;
	}

	public function updateCategoryTrans($data)
	{
		$slug = $this->convertUtf8($data['c_name_2']);
		$slug = url_title($slug);
		$sql = "UPDATE category_trans set c_name = ?, c_slug = ?, c_intro = ? WHERE c_ref = ?";
		$query = $this->db->query($sql, array($data['c_name_2'], $slug, $data['c_intro_2'], $data['cid']));
		return $query ? true : false;
	}

	public function deleteCategory($cid)
	{
		$sql = "DELETE a FROM category a LEFT JOIN category_trans b ON a.cid = b.c_ref WHERE a.cid = ?";
	//	$sql = "DELETE FROM category WHERE cid = ?";
		$query = $this->db->query($sql, $cid);
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteCateRelated($cid)
	{
		$sql = "DELETE category, category_trans FROM category a LEFT JOIN category_trans b ON a.cid = b.c_ref WHERE a.c_parent = ? OR a.c_grparent = ?";
		$query = $this->db->query($sql, array($cid, $cid));
		return $this->db->affected_rows() > 0 ? true : false;
	}


/*============================== END CATEGORY MANAGEMENT ================================*/


/*============================== IMAGE MANAGEMENT ================================*/

	public function getAllImg()
	{
		$sql = "SELECT img_name FROM img";
		$query = $this->db->query($sql);

		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function deleteGarbageImg()
	{
		$sql = "DELETE FROM img WHERE img_pid NOT IN (SELECT pid FROM member) ";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? true : false;
	}

/*============================== END IMAGE MANAGEMENT ================================*/


/*============================== POST MANAGEMENT ================================*/

	public function getPosts($order, $sort, $limit, $idx, $author = null)
	{
		$this->db->start_cache();
		$this->db->select('a.pid, a.p_title title, a.p_ym path, a.p_img img, a.p_author authorid, a.p_datetime created, a.p_stat status, a.p_featured featured, a.p_views viewed, b.p_title title_trans, c_name category, u_name author');
		$this->db->from('post a');
		$this->db->join('post_trans b', 'a.pid = b.p_ref', 'left');
		$this->db->join('category', 'p_cid = cid');
		$this->db->join('user', 'p_author = uid');
		if(!is_null($author))
			$this->db->where('p_author', $author);
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
		$this->db->order_by($order, $sort);
		$this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getPost($pid)
	{
		$sql = "SELECT a.pid pid, a.p_title title, b.p_title title_trans, a.p_slug slug, b.p_slug slug_trans, a.p_ym path, a.p_img img, a.p_shorttext shorttext, b.p_shorttext shorttext_trans, a.p_content content, b.p_content content_trans, a.p_meta, a.p_author author, a.p_datetime datetime, a.p_published published, a.p_lastmodified lastmodified, a.p_cid cid, a.p_views views, a.p_stat stat, a.p_featured featured, c.c_name, c.c_slug c_slug, d.c_slug c_slug_trans, GROUP_CONCAT(DISTINCT CONCAT(t_lang,';',t_name) SEPARATOR ';') tags, GROUP_CONCAT(DISTINCT iid,'|',i_url,'|',IFNULL(i_caption, ''),'|',IFNULL(i_caption_trans, '') SEPARATOR '|') gallery FROM post a LEFT JOIN post_trans b ON a.pid = b.p_ref LEFT JOIN category c ON a.p_cid = cid LEFT JOIN category_trans d ON c.cid = d.c_ref LEFT JOIN image ON a.pid = i_pid LEFT JOIN tag_ref ON a.pid = tr_pid LEFT JOIN tag ON tr_tid = tid WHERE a.pid = ? GROUP BY a.pid";
		$query = $this->db->query($sql, $pid);
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addPost($data)
	{
		$slug = $this->convertUtf8($data['p_title']);
		$slug = url_title($slug);
		$p_published = date('Y-m-d H:i', strtotime($data['p_published']));
		$sql = "INSERT INTO post (p_title, p_slug, p_ym, p_img, p_shorttext, p_content, p_meta, p_author, p_datetime, p_published, p_cid, p_stat, p_featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$this->db->query($sql, array(htmlspecialchars($data['p_title'], ENT_QUOTES), $slug, $data['p_ym'], $data['p_img'], $data['p_shorttext'], $data['p_content'], $data['p_meta'], $data['p_author'], $data['p_datetime'], $p_published, $data['p_cid'], $data['p_stat'], $data['p_featured']));
		if($this->db->affected_rows() > 0)
			return $this->addPostTrans($this->db->insert_id(), $data);
		else
			return false;
	}

	public function addPostTrans($pid, $data)
	{
		$slug = $this->convertUtf8($data['p_title_2']);
		$slug = url_title($slug);
		$sql = "INSERT INTO post_trans (p_title, p_slug, p_shorttext, p_content, p_ref) VALUES (?, ?, ?, ?, ?)";
		$this->db->query($sql, array(htmlspecialchars($data['p_title_2'], ENT_QUOTES), $slug, $data['p_shorttext_2'], $data['p_content_2'], $pid));
		return $this->db->affected_rows() > 0 ? array(0 => $pid, 1 => $this->db->insert_id()) : false;
	}

	public function updatePost($data)
	{
		$slug = $this->convertUtf8($data['p_title']);
		$slug = url_title($slug);
		$p_published = date('Y-m-d H:i', strtotime($data['p_published']));
		$sql = "UPDATE post set p_title = ?, p_slug = ?, p_ym = ?, p_img = ?, p_shorttext = ?, p_content = ?, p_meta = ?, p_cid = ?, p_stat = ?, p_featured = ?, p_published = ?, p_lastmodified = ? WHERE pid = ?";
		$query = $this->db->query($sql, array(htmlspecialchars($data['p_title'], ENT_QUOTES), $slug, $data['p_ym'], $data['p_img'], $data['p_shorttext'], $data['p_content'], $data['p_meta'], $data['p_cid'], $data['p_stat'], $data['p_featured'], $p_published, $data['p_lastmodified'], $data['pid']));
		if($query)
			return $this->updatePostTrans($data);
		//	return true;
		else
			return false;
	}

	public function updatePostTrans($data)
	{
		$slug = $this->convertUtf8($data['p_title_2']);
		$slug = url_title($slug);
		$sql = "UPDATE post_trans set p_title = ?, p_slug = ?, p_shorttext = ?, p_content = ? WHERE p_ref = ?";
		$query = $this->db->query($sql, array(htmlspecialchars($data['p_title_2'], ENT_QUOTES), $slug, $data['p_shorttext_2'], $data['p_content_2'], $data['pid']));
		return $query;
	}

	public function addTag($tag, $pid, $lang = 1)
	{
		$key = $lang.'-'.$tag;
		$slug = $this->convertUtf8($tag);
		$slug = url_title($slug);
		$sql = "INSERT IGNORE INTO tag (t_unique, t_name, t_slug, t_lang) VALUES (?, ?, ?, ?)";
		$query = $this->db->query($sql, array($key, $tag, $slug, $lang));
		if($this->db->affected_rows() > 0)
		{
			$tid = $this->db->insert_id();
			$this->addTagRef($pid, $tid);
		}
		else
		{
			$this->addRefByTag($pid, $tag);
		}
	}

	public function addImg($pid, $array)
	{
		$sql = "INSERT INTO image (i_pid, i_url, i_caption, i_caption_trans) VALUES ";
		foreach($array as $gal)
			$sql .= '("'.$pid.'", "'.$gal[0].'", "'.$gal[1].'", "'.$gal[2].'"),';
		$this->db->query(rtrim($sql, ','));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteImg($param)
	{
		$this->db->where_in('iid', $param);
		$this->db->delete('image');
		return $this->db->affected_rows() > 0 ? true : false;

	}

	public function addTagRef($pid, $tid)
	{
	//	$key = $pid.'-'.$tid;
		$sql = "INSERT INTO tag_ref (tr_pid, tr_tid) VALUES (?, ?)";
		$this->db->query($sql, array($pid, $tid));
	}

	public function addRefByTag($pid, $tag)
	{
		$sql = "INSERT INTO tag_ref (tr_pid, tr_tid) SELECT ?, tid FROM tag WHERE t_name = ?";
		$this->db->query($sql, array($pid, $tag));
	}

	public function deleteRef($pid, $tag)
	{
		$sql = "DELETE tag_ref FROM tag_ref LEFT JOIN tag ON tr_tid = tid WHERE tr_pid = ? AND t_name = ?";
		$this->db->query($sql, array($pid, $tag));
	}

	public function getPostTags($tags)
	{
		$this->db->select('tid');
		$this->db->from('tag');
		$this->db->where_in('t_name', $tags);
		$query = $this->db->get();
		return $query->result();
	}

	public function deleteTag($pid, $tags)
	{
		$sql = "DELETE FROM tag WHERE t_pid = ? AND t_name NOT IN (?)";
		$this->db->query($sql, array($pid, $tags));
	}

	public function updatePostStat($data)
	{
		$sql = "UPDATE post set p_stat = ? WHERE pid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updatePostFeatured($data)
	{
		$sql = "UPDATE post set p_featured = ? WHERE pid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deletePost($pid)
	{
		$sql = "DELETE a FROM post a LEFT JOIN post_trans b ON a.pid = b.p_ref LEFT JOIN image ON a.pid = i_pid WHERE a.pid = ?";
		$this->db->query($sql, $pid);
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END POST MANAGEMENT ================================*/


/*============================== USER MANAGEMENT ================================*/

	public function getUGroup()
	{
		$sql = "SELECT * FROM user_group LIMIT 1, 10";
		$query = $this->db->query($sql);

		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getUsers($order, $sort, $limit, $idx)
	{
		$this->db->start_cache();
		$this->db->select('uid, u_uname username, u_pic, u_name name, u_stat status, ug_name authority');
		$this->db->from('user');
		$this->db->join('user_group', 'u_ugid = ugid');
		$this->db->where('uid !=', '1');
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
        $this->db->order_by($order, $sort);
        $this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getUsersList()
	{
		$sql = "SELECT uid, u_name FROM user";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getUser($uid)
	{
		$sql = "SELECT * FROM user WHERE uid = ?";
		$query = $this->db->query($sql, array($uid));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addUser($data)
	{
		$pass = $this->encrypt($data['u_pass']);
		$sql = "INSERT IGNORE INTO user (u_uname, u_pass, u_pic, u_name, u_email, u_stat, u_ugid) VALUES (?, ?, ?, ?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['u_uname'], $pass, $data['u_pic'], $data['u_name'], $data['u_email'], $data['u_stat'], $data['u_ugid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateUser($data)
	{
		$sql = "UPDATE user SET u_name = ?, u_pic = ?, u_email = ?, u_stat = ?, u_ugid = ? WHERE uid = ?";
		$query = $this->db->query($sql, array($data['u_name'], $data['u_pic'], $data['u_email'], $data['u_stat'], $data['u_ugid'], $data['uid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updateUserStat($data)
	{
		$sql = "UPDATE user set u_stat = ? WHERE uid = ?";
		$query = $this->db->query($sql, array($data['stat'], $data['id']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteUser($uid)
	{
		$sql = "DELETE FROM user WHERE uid = ?";
		$query = $this->db->query($sql, array($uid));
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END USER MANAGEMENT ================================*/


/*============================== PARTNER MANAGEMENT ================================*/

	public function getPartners()
	{
		$sql = "SELECT ptid, pt_name, pt_img, (SELECT COUNT(ptid) FROM partner) pcount FROM partner";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getPartner($ptid)
	{
		$sql = "SELECT * FROM partner WHERE ptid = ?";
		$query = $this->db->query($sql, array($ptid));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function addPartner($data)
	{
		$slug = $this->convertUtf8($data['pt_name']);
		$slug = url_title($slug);
		$sql = "INSERT INTO partner (pt_name, pt_slug, pt_img, pt_link) VALUES (?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['pt_name'], $slug, $data['pt_img'], $data['pt_link']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function updatePartner($data)
	{
		$slug = $this->convertUtf8($data['pt_name']);
		$slug = url_title($slug);
		$sql = "UPDATE partner SET pt_name = ?, pt_slug = ?, pt_img = ?, pt_link = ? WHERE ptid = ?";
		$query = $this->db->query($sql, array($data['pt_name'], $slug, $data['pt_img'], $data['pt_link'], $data['ptid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deletePartner($ptid)
	{
		$sql = "DELETE FROM partner WHERE ptid = ?";
		$query = $this->db->query($sql, array($ptid));
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END PARTNER MANAGEMENT ================================*/


/*============================== SUBMISSION MANAGEMENT ================================*/

	public function getSubmissions($order, $sort, $limit, $idx)
	{
		$this->db->start_cache();
		$this->db->select('sid, s_title title, s_name name, s_datetime datetime, s_stat status');
		$this->db->from('submission');
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
        $this->db->order_by($order, $sort);
        $this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result_array();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function countUnread()
	{
		$sql = "SELECT COUNT(sid) scount FROM submission WHERE s_stat = 0";
		$query = $this->db->query($sql);
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function getSubmission($sid)
	{
		$sql = "SELECT * FROM submission WHERE sid = ?";
		$query = $this->db->query($sql, array($sid));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function updateSubmission($data)
	{
		$sql = "UPDATE submission set s_stat = 1 WHERE sid = ?";
		$query = $this->db->query($sql, array($data['sid']));
		return $this->db->affected_rows() > 0 ? true : false;
	}

	public function deleteSubmission($sid)
	{
		$sql = "DELETE FROM submission WHERE sid = ?";
		$query = $this->db->query($sql, array($sid));
		return $this->db->affected_rows() > 0 ? true : false;
	}

/*============================== END SUBMISSION MANAGEMENT ================================*/


	public function createCountryList($data)
	{
		$sql = "INSERT INTO country (ct_code, ct_name) VALUES (:c_code, :c_name)";
		$query = $this->db->query($sql);
		$query->execute(array(':c_code' => $data['c_code'], ':c_name' => $data['c_name']));
		return $query->num_rows() > 0 ? true : false;
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

	public function ctlist()
	{
		$this->db->select('ct_name, ct_code');
		$this->db->from('country');
		$this->db->order_by('ct_name');
		$query = $this->db->get();
		return $query->result_array();
	}
}
