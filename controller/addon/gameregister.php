<?php
class ControllerAddonGameregister extends Controller
{
	private $error = array();
	public function index()
	{
		//print_r($_SESSION);
		$this->document->breadcrumb .= " » Tham gia chương trình";
		$this->document->title .= " » Tham gia chương trình";
		$this->id="content";
		$this->template="addon/game_register.tpl";
		$this->render();
	}
	
	public function send()
	{
		$data = $this->request->post;
		
		if(@$this->validateForm($data))
		{
			$this->load->model("addon/gameregister");
			
			$data['registime'] = $this->date->getToday();
			$data['id'] = $this->model_addon_gameregister->save($data);
			print_r($data);
		}
		else
		{
			foreach($this->error as $item)
			{
				@$this->data['output'] .= $item."<br>";
			}
		}
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm($data)
	{
		
		
    	if(trim($data['fullname']) == "")
		{
      		$this->error['fullname'] = "Bạn chưa nhập họ tên!";
    	}
		
		if(trim($data['phone']) =="")
		{
      		$this->error['phone'] = "Bạn chưa nhập số điện thoại";
    	}
		if(trim($data['address']) =="")
		{
      		$this->error['address'] = "Bạn chưa nhập địa chỉ";
    	}
		if(trim($data['email']) =="")
		{
      		$this->error['email'] = "Bạn chưa nhập email";
    	}
		
		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
}
?>