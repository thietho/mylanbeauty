<?php
final class Member {
	public $data = array();
	private $siteid;
	
	public $go_country;
  	
	public function __construct() {
		$this->db = Registry::get('db');
		$this->request = Registry::get('request');
		$this->session  = Registry::get('session');
		$this->json  = Registry::get('json');
		$this->string  = Registry::get('string');
		$this->date  = Registry::get('date');
		
		
		/*switch($this->request->get['lang'])
		{
			case "":
				$this->siteid = SITEID;
				break;
			case "vn":
				$this->siteid = "vietname";
				break;
			case "en":
				$this->siteid = SITEID;
				break;
		}*/
		if(@$this->request->get['lang'])
		{
			
			$this->siteid = $this->request->get['lang'];
		}
		else
		{
			$this->siteid = SITEID;
		}
		
		if(@$this->request->get['contry'])
		{
			$this->go_country = $this->request->get['contry'];
			$this->session->set('country',$this->go_country);
		}
		else
		{
			@$this->go_country = $this->session->data['country'];
		}
		if(@$_COOKIE['username'] != "")
		{
			@$this->login($_COOKIE['username'],$_COOKIE['password']);	
		}
    	$this->data = $this->session->data['member'];
  	}
	public function isLogged() {
    	if(@$this->session->data['member']){
			
			return true;
		}
		
		return false;
  	}
	private function writelog()
	{
		$starttime = $this->date->getToday();
		$sessionid = session_id();
		$username  = $this->username;
		$ip = $_SERVER['REMOTE_ADDR'];
		//kiem tra co id chua
		$sql = "SELECT * 
				FROM `user_stats`
				WHERE sessionid = '".$sessionid."'
				" ;
		$query = $this->db->query($sql);
		if($query->num_rows==0)
		{
			$sql = "INSERT INTO `user_stats` (
								`id` ,
								`starttime` ,
								`sessionid` ,
								`username` ,
								`ip` 
								)
								VALUES (
								NULL , 
								'".$starttime."', 
								'".$sessionid."', 
								'".$username."', 
								'".$ip."'
									);";
			$this->db->query($sql);
		}
		else
		{
			$sql = "UPDATE `user_stats` SET 
					`starttime` = '".$starttime."' 
					`username` = '".$username."'
					`ip` = '".$ip."'
					
					WHERE `user_stats`.`sessionid` ='".$sessionid."'";
		}
		
		
	}
	
	public function getHitCounter()
	{
				
		$sql = "Select `user_stats`.* 
									from `user_stats`";
		$query = $this->db->query($sql);
		return count($query->rows);
	}
	
	public function getOnline()
	{
		$current_time = $this->date->getToday();
		$session_timelimit = 20; 
		$session_timout = $this->date->addMinutes($current_time,-$session_timelimit) ;
		
		$sql = "Select `user_stats`.* 
									from `user_stats` WHERE `user_stats`.`starttime` >= '".$session_timout."'";
		$query = $this->db->query($sql);
		return count($query->rows);
	}
	
	public function getOnlineInMonth()
	{
		$current_time = $this->date->getToday();
		$year = $this->date->getYear($current_time);
		$mon = $this->date->getMonth($current_time);
		$sql = "SELECT  `user_stats` . * 
						FROM  `user_stats` 
						WHERE YEAR(`starttime`) =".$year."
						AND MONTH(`starttime`) =".$mon;
		$query = $this->db->query($sql);
		return count($query->rows);
	}
	
	private function updatelistonline()
	{
		$current_time = $this->date->getToday();
		$session_timelimit = 20; 
		$session_timout = $this->date->addMinutes($current_time,-$session_timelimit) ;
		//$sql="DELETE FROM `user_stats` WHERE `user_stats`.`starttime` <= '".$session_timout."'";
		//$this->db->query($sql);
	}
	public function getId() {
    	return $this->userid;
  	}
	
	public function getUserTypeId() {
    	return $this->usertypeid;
  	}
	
	public function getSiteId() {
    	return $this->siteid;
  	}
	
  	public function getUserName() {
    	return $this->username;
  	}
	//return array
	public function _getPermissions($moduleid, $arrJSON)
	{
		$arr = array();
		
		$arrModule = $this->_getModules($arrJSON);
		
		$index = $this->string->inArray($moduleid, $arrModule) + 1;
		
		if($index > 0 && count($arrJSON[$index][0]) > 0)
		{
			return $arrJSON[$index][0];
		}

		return $arr;
	}
	
	//return array
	public function _getSitemaps($moduleid, $arrJSON)
	{
		$arr = array();
		
		$arrModule = $this->_getModules($arrJSON);
		
		$index = $this->string->inArray($moduleid, $arrModule) + 1;
		
		if($index > 0 && count($arrJSON[$index][1]) > 0)
		{
			return $arrJSON[$index][1];
		}

		return $arr;
	}
//END PERMISSION JSON
	
}
?>