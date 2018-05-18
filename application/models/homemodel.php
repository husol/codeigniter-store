<?php

class HomeModel extends CI_Model {
    function __construct() {
    }

	public function getConfig() {
		$query = $this->db->query("SELECT * FROM config");
		if($query->num_rows() > 0)
			return $query->row_array();
		else
			return null;
	}

	public function getMenu($str, $lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('mnid, mn_slug, mn_name, GROUP_CONCAT(a.c_name, "/", a.c_slug, "#" ORDER BY a.c_ordering ASC, a.c_lastmodified DESC) children', false);
			$this->db->from('menu');
			$this->db->join('category a', 'mn_cid = a.c_parent', 'left');
		}
		else
		{
			$this->db->select('mnid, mn_slug_trans mn_slug, mn_name_trans mn_name, GROUP_CONCAT(b.c_name, "/", b.c_slug, "#" ORDER BY a.c_ordering ASC, a.c_lastmodified DESC) children', false);
			$this->db->from('menu');
			$this->db->join('category a', 'mn_cid = a.c_parent', 'left');
			$this->db->join('category_trans b', 'a.cid = b.c_ref', 'left');
		}
		$this->db->where('mn_group', $str);
		$this->db->where('mn_stat', 1);
		$this->db->group_by('mnid');
		$this->db->order_by('mn_ordering', 'asc');
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->result_array() : null;
	}

	public function defineMenuBySlug($str, $lang = 1)
	{
		if($lang == 1)
			$sql = "SELECT mn_name, mn_slug, mn_title, mn_target, mn_cid, cid, c_name, c_slug, c_type FROM category LEFT JOIN menu ON mn_cid = cid WHERE mn_slug = ? OR c_slug = ? ORDER BY mn_ordering LIMIT 1";
		else
			$sql = "SELECT mn_name, mn_slug, mn_title, mn_target, mn_cid, a.cid, b.c_name, b.c_slug, a.c_type FROM category_trans b LEFT JOIN category a ON b.c_ref = a.cid LEFT JOIN menu ON mn_cid = b.c_ref WHERE mn_slug_trans = ? OR b.c_slug = ? ORDER BY mn_ordering LIMIT 1";
		$query = $this->db->query($sql, array($str, $str));
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function getHomeModules()
	{
		$sql = "SELECT mid, m_name, m_name_trans, m_content, m_content_trans, m_meta, mc_fn FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND mc_type = ? ORDER BY m_ordering ASC, m_lastmodified DESC";
		$query = $this->db->query($sql, array('homepage'));
		return $query->num_rows() > 0 ? $query->result() : null;
	}
	
	public function getHomeModuleByCategory($id, $lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1 AND (c.cid = '.$id.' OR c.c_parent = '.$id.' OR c.c_grparent = '.$id.')');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit(8);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}
	
	public function getSidebarModules()
	{
		$sql = "SELECT mid, m_name, m_name_trans, m_content, m_content_trans, m_meta, mc_fn FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND mc_type = ? ORDER BY m_ordering ASC, m_lastmodified DESC";
		$query = $this->db->query($sql, array('sidebar'));
		return $query->num_rows() > 0 ? $query->result() : null;
	}

	public function getBanner()
	{
		$this->db->select('m_content');
		$this->db->from('module');
		$this->db->join('module_category', 'm_mcid = mcid');
		$this->db->where('m_stat', 1);
		$this->db->where('m_ordering !=', 0);
		$this->db->where('mc_type', 'banner');
		$this->db->order_by('m_ordering', 'asc');
		$this->db->limit(1);
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function getPartners()
	{
		$this->db->select('pt_name, pt_img, pt_link');
		$this->db->from('partner');
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->result() : null;
	}
	
	public function getFooter($lang = 1)
	{
		if($lang == 1)
			$this->db->select('m_content m_content');
		else
			$this->db->select('m_content_trans m_content');
		$this->db->from('module');
		$this->db->join('module_category', 'm_mcid = mcid');
		$this->db->where('m_stat', 1);
		$this->db->where('m_ordering !=', 0);
		$this->db->where('mc_type', 'footer');
		$this->db->order_by('m_ordering', 'asc');
		$this->db->limit(1);
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->row() : null;
	}

	public function getAdLeader()
	{
		$sql = "SELECT m_content FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND m_ordering != 0 AND mc_pos = ? ORDER BY m_ordering ASC LIMIT 1";
		$query = $this->db->query($sql, array('top'));
		if($query->num_rows() > 0)
		{
			return $query->row();
		}
		else
			return null;
	}

	public function getAdSkyScrapper()
	{
		$sql = "SELECT m_content FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND m_ordering != 0 AND mc_pos = ? ORDER BY m_ordering ASC LIMIT 2";
		$query = $this->db->query($sql, array('skyscrapper'));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

	public function getAdSidebar()
	{
		$sql = "SELECT m_content, m_ordering FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND m_ordering != 0 AND mc_pos = ? ORDER BY m_ordering ASC";
		$query = $this->db->query($sql, array('sidebar'));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

	public function getAdOverlay()
	{
		$sql = "SELECT m_content FROM module LEFT JOIN module_category ON m_mcid = mcid WHERE m_stat = 1 AND m_ordering != 0 AND mc_pos = ? ORDER BY m_ordering ASC LIMIT 1";
		$query = $this->db->query($sql, array('overlay'));
		if($query->num_rows() > 0)
		{
			return $query->row();
		}
		else
			return null;
	}

	public function getCategory($c_level)
	{
		$sql = "SELECT cid, c_name, c_slug, c_level, c_parent, c_grparent FROM category WHERE c_group = 1 AND c_level = ?";
		$query = $this->db->query($sql, array($c_level));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

	public function getCategoryTree($cid, $lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.cid, a.c_name, a.c_slug, GROUP_CONCAT(b.pid,"//",b.p_title,"//",b.p_slug) child', false);
			$this->db->from('category a');
			$this->db->join('post b', 'a.cid = b.p_cid', 'left');
		}
		else
		{
			$this->db->select('a.cid, c.c_name, c.c_slug, GROUP_CONCAT(b.pid,"//",d.p_title,"//",d.p_slug) child', false);
			$this->db->from('category a');
			$this->db->join('post b', 'a.cid = b.p_cid', 'left');
			$this->db->join('category_trans c', 'a.cid = c.c_ref');
			$this->db->join('post_trans d', 'b.pid = d.p_ref', 'left');
		}
		$this->db->where('a.c_parent', $cid);
		$this->db->group_by('a.cid');
		$query = $this->db->get();
		if($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else
			return null;
	}

	public function getAllCate()
	{
		$sql = "SELECT cid, c_name, c_slug FROM category WHERE c_level = 2";
		$query = $this->db->query($sql);
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

/*============================== POST ================================*/

	public function getFeaturedPosts($lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('a.p_featured = 1 AND a.p_stat = 1 AND c.c_stat = 1');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit(6);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}

	public function getLatestProducts($lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('c.c_slug = 44 OR c.c_parent = 44 OR c.c_grparent = 44');
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit(8);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}

	public function getLatestPosts($lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1');
		$this->db->where('c.cid !=', CATEGORY_SINGLE);
		$this->db->order_by('p_published', 'desc');
		$this->db->limit(6);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}

	public function getTopViewed($lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1 AND a.p_cid != 8');
		$this->db->where('c.cid !=', CATEGORY_SINGLE);
		$this->db->order_by('p_views', 'desc');
		$this->db->limit(5);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}

	public function getLatest($lang = 1)
	{
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
		}
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1');
		$this->db->where('c.cid = 8 OR c.c_parent = 8 OR c.c_grparent = 8');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit(5);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			return $query->result();
		else
			return null;
	}

	public function checkCategory($id, $lang = 1)
	{
		
	}
	
	public function getCategoryInfo($id, $lang = 1)
	{
		$this->db->select('a.c_name, c_level, a.c_intro');
		if($lang == 1){
			$this->db->from('category a');
			$this->db->where('a.cid', $id);
		} else {
			$this->db->from('category_trans a');
			$this->db->join('category b', 'a.c_ref = b.cid');
			$this->db->where('a.c_ref', $id);
		}
		$query = $this->db->get();
		return $query->num_rows() > 0 ? $query->row_array() : null;
	}
	
	public function getPostsByCid($id, $limit, $idx, $lang = 1)
	{
		$this->db->start_cache();
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug, COUNT(e.cid) hasChild');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid', 'left');
			$this->db->join('category e', 'c.cid = e.c_parent', 'left');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug, COUNT(e.cid) hasChild');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
			$this->db->join('category e', 'c.cid = e.c_parent', 'left');
		}
		$this->db->where('c.cid', $id);
		$this->db->or_where('c.c_parent', $id);
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1 AND e.c_stat = 1');
		$this->db->where('c.cid !=', CATEGORY_SINGLE);
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
		$this->db->group_by('a.pid');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getPostsByTag($tag, $limit, $idx, $lang = 1)
	{
		$this->db->start_cache();
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
			$this->db->join('tag_ref', 'a.pid = tr_pid');
			$this->db->join('tag', 'tr_tid = tid');
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
			$this->db->join('tag_ref', 'a.pid = tr_pid', 'left');
			$this->db->join('tag', 'tr_tid = tid', 'left');
		}
		$this->db->where('t_name', $tag);
		$this->db->where('t_lang', $lang);
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1');
		$this->db->where('c.cid !=', CATEGORY_SINGLE);
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();
		$this->db->order_by('p_published', 'desc');
		$this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function getPostsByAuthor($id, $limit, $idx)
	{
		$sql = "SELECT pid, p_title, p_slug, p_ym, p_img, p_shorttext, p_author, p_published, p_views, c_name, c_slug, u_name, u_slug, (SELECT COUNT(pid) FROM post LEFT JOIN category ON p_cid = cid  LEFT JOIN user ON p_author = uid WHERE p_stat = 1 AND uid = ? AND c_type = 'post') pcount FROM post LEFT JOIN category ON p_cid = cid LEFT JOIN user ON p_author = uid WHERE p_stat = 1 AND uid = ? AND c_type = 'post' AND c_stat = 1 GROUP BY pid ORDER BY p_published DESC LIMIT ".$idx.",".$limit;
		$query = $this->db->query($sql, array($id, $id));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

	public function getPost($pid, $lang = 1)
	{
		if($lang == 1)
		//	$sql = "SELECT * FROM post LEFT JOIN category ON p_cid = cid WHERE pid = ?";
			$sql = "SELECT pid, p_title, p_slug, p_ym, p_img, p_shorttext, p_author, p_published, p_datetime, p_views, p_content, p_meta, c_name, c_slug, u_name, u_slug, GROUP_CONCAT(DISTINCT t_name SEPARATOR ',') tags FROM post LEFT JOIN category ON p_cid = cid LEFT JOIN tag_ref ON pid = tr_pid LEFT JOIN tag ON (tr_tid = tid AND t_lang = 1) LEFT JOIN user ON p_author = uid WHERE p_stat = 1 AND pid = ? GROUP BY pid";
		else
			$sql = "SELECT a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, a.p_meta, b.p_shorttext, a.p_author, a.p_published, a.p_datetime, a.p_views, b.p_content, d.c_name, d.c_slug, u_name, u_slug, GROUP_CONCAT(DISTINCT t_name SEPARATOR ',') tags FROM post a LEFT JOIN post_trans b ON a.pid = b.p_ref LEFT JOIN category_trans d ON a.p_cid = d.c_ref LEFT JOIN tag_ref ON a.pid = tr_pid LEFT JOIN tag ON (tr_tid = tid AND t_lang = 2) LEFT JOIN user ON a.p_author = uid WHERE a.p_stat = 1 AND a.pid = ? GROUP BY a.pid";
		$query = $this->db->query($sql, array($pid));
		if($query->num_rows() > 0)
		{
			return $query->row();
		}
		else
			return null;
	}

	public function getRelated($cid)
	{
		$sql = "SELECT pid, p_name, p_slug, p_cover, c_slug FROM post LEFT JOIN category ON p_cid = cid WHERE p_stat = 1 AND p_cid = ? ORDER BY p_published LIMIT 5";
		$query = $this->db->query($sql, array($cid));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

	public function quickSearchPosts($data, $limit, $idx, $lang = 1)
	{
		$this->db->start_cache();
		if($lang == 1)
		{
			$this->db->select('a.pid, a.p_title, a.p_slug, a.p_ym, a.p_img, a.p_shorttext, a.p_author, a.p_published, a.p_views, c.c_name, c.c_slug');
			$this->db->from('post a');
			$this->db->join('category c', 'p_cid = c.cid');
			$this->db->like('a.p_title', $data);
			$this->db->or_like('a.p_shorttext', $data);
			$this->db->or_like('a.p_content', $data);
		}
		else
		{
			$this->db->select('a.pid, b.p_title, b.p_slug, a.p_ym, a.p_img, b.p_shorttext, a.p_author, a.p_published, a.p_views, d.c_name, d.c_slug');
			$this->db->from('post a');
			$this->db->join('post_trans b', 'a.pid = b.p_ref');
			$this->db->join('category c', 'a.p_cid = c.cid');
			$this->db->join('category_trans d', 'a.p_cid = d.c_ref');
			$this->db->like('b.p_title', $data);
			$this->db->or_like('b.p_shorttext', $data);
			$this->db->or_like('b.p_content', $data);
		}
		$this->db->where('a.p_stat = 1 AND c.c_stat = 1');
		$this->db->where('c.cid !=', CATEGORY_SINGLE);
		$this->db->stop_cache();
		$result['count'] = $this->db->count_all_results();		
		$this->db->group_by('a.pid');
		$this->db->order_by('p_published', 'desc');
		$this->db->limit($limit, $idx);
		$query = $this->db->get();
		if($query && $query->num_rows() > 0)
			$result['rows'] = $query->result();
		else
			$result['rows'] = null;
		$this->db->flush_cache();
		return $result;
	}

	public function upcountHit($id)
	{
		$sql = "UPDATE post set p_views = p_views + 1 WHERE pid = ?";
		$query = $this->db->query($sql, array($id));
		if($this->db->affected_rows() > 0)
		{
			return true;
		}
		else
			return null;
	}

	public function getRelatedNews($cid)
	{
		$sql = "SELECT pid, p_name, p_slug, p_cover FROM post WHERE p_cid = :cid";
		$query = $this->db->query($sql);
		$query->execute(array(':cid' => $cid));
		if($query->num_rows() > 0)
		{
			return $query->result();
		}
		else
			return null;
	}

/*==============================  END POST ================================*/


	public function addSubmission($data)
	{
		$sql = "INSERT INTO submission (s_title, s_name, s_mobi, s_email, s_content, s_datetime) VALUES (?, ?, ?, ?, ?, ?)";
		$query = $this->db->query($sql, array($data['s_title'], $data['s_name'], $data['s_mobi'], $data['s_email'], $data['s_content'], $data['s_datetime']));
		if($this->db->affected_rows() > 0)
		{
			return true;
		}
		else
			return false;
	}

	public function getSubmission()
	{
		$query = $this->db->get('submission');
			return $query->result_array();
	}


}
