<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Site extends CI_Controller {

	private static $instance;
	public $model = null;
	public $site_config = array();
	public $lg = '';
	public $ver = '';
	public function __construct()
	{
		parent::__construct();
		$this->load_model();
		$this->ver = $this->config->item('version');
	//	$this->setConfig();
	//	echo '<script>alert("'.$this->uri->segment(1).'")</script>';
	 	if($this->uri->segment(1) == 'en')
		{
			$this->lang->load('site', 'english');
			$this->lg = 2;
			$this->lgPath = 'en/';
		}
		else
		{				
			$this->lang->load('site', 'vietnam');
			$this->lg = 1;
			$this->lgPath = null;
		}
	}
	
 	public function load_model(){
		$this->load->model('homemodel','',TRUE);
	}
	
	public function setConfig()
	{
		$this->site_config = $this->adminmodel->getConfig();
	}

}