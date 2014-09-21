<?php
class ControllerAddonRequest extends Controller
{
	private $error = array();
	public function index()
	{
		
		$this->document->breadcrumb .= " » Yêu cầu tư vấn";
		$this->document->title .= $this->document->breadcrumb;
		$this->data['skinstatus'] = array("Khô","Dầu","Nhại cảm","Hổn hợp dầu","Hổn hợp khô","Da yếu","Da mụn","Da mỏng");
		$this->id="content";
		$this->template="addon/request.tpl";
		$this->render();
	}
	
	public function send()
	{
		$data = $this->request->post;
		if($this->validateForm($data))
		{
			$this->load->model("core/user");
			$activecode = $this->model_core_user->getInformation($data['username'], "activecode");
			if($data['activecode'] == $activecode)
			{
				//Kich hoat tai khoang
				$user['userid'] = $data['username'];
				$user['status'] = "active";
				$this->model_core_user->updatestatus($user);
				$this->data['output'] = "true";
				$this->model_core_user->saveInformation($data['username'], "activecode", "");
			}
			else
			{
				$this->data['output'] = "Mã kích hoạt không đúng";
			}
			
		}
		else
		{
			foreach($this->error as $item)
			{
				$this->data['output'] .= $item."<br>";
			}
		}
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm($data)
	{
		
		
    	if(trim($data['username']) == "")
		{
      		$this->error['username'] = "Bạn chưa nhập tên đăng nhập";
    	}
		
		if(trim($data['activecode']) =="")
		{
      		$this->error['activecode'] = "Bạn chưa nhập mã kích hoạt";
    	}
		else
		{
			$this->load->model("core/user");
			$activecode = $this->model_core_user->getInformation($data['username'], "activecode");
			if($activecode == "")
				$this->error['activecode'] = "tài khoản của bạn đã kích hoạt rồi";
		}
		
		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
}
?>