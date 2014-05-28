<?php
class ControllerCommonHeadermobile extends Controller
{
	public function index()
	{
		
		$this->id="header";
		$this->template="common/headermobile.tpl";
		
		$this->render();
	}
}
?>