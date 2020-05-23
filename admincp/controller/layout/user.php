<?php
	class ControllerLayoutUser extends Controller
	{
		public function index()
		{
			@$this->template="layout/user.tpl";
			@$this->children=array(
				'common/header',
				'common/footer',
				
				
			);
			@$this->render();
		}
	}
?>