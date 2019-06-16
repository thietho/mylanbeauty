<?php
class ControllerServicesCheckconnect extends Controller
{	
	public function index()
	{
		$this->data['output'] = 'conneted';
		
		$this->id="media";
		$this->template="common/output.tpl";
		$this->render();
	}
}
?>