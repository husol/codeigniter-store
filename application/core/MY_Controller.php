<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

	private static $instance;
	public $model = null;
	public $admin_url = '';
	public $site_config = array();
	public $sc;

	public function __construct()
	{
		parent::__construct();
		$this->load_model();
		$this->setConfig();
		$this->admin_url = base_url('admin').'/';
		if($this->input->cookie('name') && $this->input->cookie('id') && $this->input->cookie('email'))
		{
			$session = array(
				'name' => $this->input->cookie('name'),
				'id' => $this->input->cookie('id'),
				'email' => $this->input->cookie('email')
			);
			$this->session->set_userdata($session);
		}
		if($this->checkAuth() && $this->uri->segment(2) === 'login')
		{
			header('location: ' .$this->admin_url);
		}
		elseif(!$this->checkAuth() && $this->uri->segment(2) !== 'login')
			header('location: ' .$this->admin_url.'login');
		else return;
		$this->sc = $this->adminmodel->countUnread();
	}

 	public function load_model(){
		$this->load->model('adminmodel','',TRUE);
	}

	public function setConfig() {
		$this->site_config = $this->adminmodel->getConfig();
	}

}