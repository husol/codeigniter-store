<?php

function vurl($url){
	// i.e 20160203
	$version = config_item('version');
	return base_url() . preg_replace('{\\.([^./]+)$}', ".$version.\$1", $url);
}