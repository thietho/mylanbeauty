<?php
class ControllerCoreCategory extends Controller
{
	private $error = array();
   
	public function index()
	{
		if(!$this->user->hasPermission($this->getRoute(), "access"))
		{
			$this->response->redirect("?route=common/permission");
		}
		$this->data['permissionAdd'] = true;
		$this->data['permissionEdit'] = true;
		$this->data['permissionDelete'] = true;
		if(!$this->user->hasPermission($this->getRoute(), "add"))
		{
			$this->data['permissionAdd'] = false;
		}
		if(!$this->user->hasPermission($this->getRoute(), "edit"))
		{
			$this->data['permissionEdit'] = false;
		}
		if(!$this->user->hasPermission($this->getRoute(), "delete"))
		{
			$this->data['permissionDelete'] = false;
		}
		//$this->load->language('core/category');
		//$this->data = array_merge($this->data, $this->language->getData());
		
		$this->document->title = $this->language->get('heading_title');
		
		$this->load->model("core/category");
		$this->getList();
	}
	
	public function insert()
	{
		if(!$this->user->hasPermission($this->getRoute(), "add"))
		{
			$this->response->redirect("?route=common/permission");
		}
		
    	$this->getForm();
	}
	
	public function update()
	{
		if(!$this->user->hasPermission($this->getRoute(), "edit"))
		{
			$this->response->redirect("?route=common/permission");
		}
		else
		{
			//$this->load->language('core/category');
			//$this->data = array_merge($this->data, $this->language->getData());
			
			
			$this->load->model("core/category");
			$this->data['haspass'] = false;
			$this->data['readonly'] = 'readonly="readonly"';
		
		
			$this->getForm();
		}
		
  	}
	
	
	public function delete() 
	{
		$listcatelogyid=$this->request->post['delete'];
		//$listcatelogyid=$_POST['delete'];
		$this->load->model("core/category");
		if(count($listcatelogyid))
		{
			$this->model_core_category->deletedatas($listcatelogyid);
			$this->data['output'] = "Xóa thành công";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
  	}
	
	public function updateposition()
	{
		$listposition=$this->request->post['position'];
		//$listcatelogyid=$_POST['delete'];
		$this->load->model("core/category");
		if(count($listposition))
		{
			foreach($listposition as $key => $item)
			{
				$data['catelogyid'] = $key;
				$data['position'] = $item;
				$this->model_core_category->updateposition($data);		
			}
			
			$this->data['output'] = "Cập nhật thành công";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
		
	}
	
	private function getList() 
	{
		$this->data['insert'] = $this->url->http('core/category/insert');
		$this->data['delete'] = $this->url->http('core/category/delete');		
		
		$this->data['datas'] = array();
		$rows = $this->model_core_category->getDanhMucPhanLoai();
		unset($rows[0]);
		$this->data['datas'] = array();
		
		$eid="ex0-node";
		$eclass="child-of-ex0-node";
		foreach($rows as $item)
		{
			
			$deep = $item['level'];
			$link_edit = $this->url->http('core/category/update&catelogyid='.$item['catelogyid']);
			$text_edit = "Edit";
			
			$link_addchild = $this->url->http('core/category/update&parent='.$item['catelogyid']);
			$text_addchild = "Add child";
			
			$tab="";
			if(count($item['countchild'])==0)
				$tab="<span class='tab'></span>";
		
			$class="";
			if($item['parentpath']!="")
				$class=$eclass.$item['parentpath'];
				
			$this->data["datas"][]=array(
										'catelogyid'=>$item['catelogyid'],
										'prefix'=>$this->string->getPrefix("--",$deep),
										'deep'=>$deep + 1,
										'eid' =>$eid . $item['path'] ,
										'class' =>$class,
										'catelogyname'=>$item['catelogyname'],
										'parent'=>$item['parent'],
										'position'=>$item['position'],
										'tab'=>$tab,
										'link_edit'=>$link_edit,
										'text_edit' =>$text_edit,
										'link_addchild' => $link_addchild,
										'text_addchild' => $text_addchild
								    );
			
			
		}
		
		$this->data['refres']=$_SERVER['QUERY_STRING'];
		$this->id='content';
		$this->template="core/category_list.tpl";
		$this->layout="layout/center";
		
		$this->render();
	}
	
	
	private function getForm()
	{
		$this->data['error'] = @$this->error;
		$this->load->model("core/category");
		
		$this->data['datas'] = array();
		$this->data['datas'] = $this->model_core_category->getDanhMucPhanLoai();
		
		if ((isset($this->request->get['catelogyid'])) ) 
		{
      		$this->data['item'] = $this->model_core_category->getItem($this->request->get['catelogyid']);
    	}
		
		$this->id='content';
		$this->template='core/category_form.tpl';
		$this->layout="layout/center";
		
		$this->render();
	}
	
	public function save()
	{
		$data = $this->request->post;
		if($this->validateForm($data))
		{
			$this->load->model("core/category");
			$this->model_core_category->save($data);
			$this->data['output'] = "true";
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
		if($data['id'] == "")
		{
			$this->load->model("core/category");
			$item = $this->model_core_category->getItem($data['catelogyid']);
			if(count($item)>0)
				$this->error['catelogyid'] = "Category is used";
		}
		if ((strlen($data['catelogyid']) == 0)) 
		{
      		$this->error['catelogyid'] = "Category Id is not null";
    	}
		if ((strlen($data['catelogyname']) == 0)) 
		{
      		$this->error['catelogyname'] = "Category name is not null";
    	}

		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	//Cac ham xu ly tren form
	
}
?>