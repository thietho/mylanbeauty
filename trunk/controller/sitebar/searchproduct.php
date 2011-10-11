<?php
class ControllerSitebarSearchproduct extends Controller
{
	public function index()
	{
		$this->load->model("core/category");
		$this->data['loaisp'] = array();
		$this->model_core_category->getTree("loaisp",$this->data['loaisp']);
		unset($this->data['loaisp'][0]);
		
		$this->data['nhomhuong'] = array();
		$this->model_core_category->getTree("nhomhuong",$this->data['nhomhuong']);
		unset($this->data['nhomhuong'][0]);
		
		$this->data['nhanhieu'] = array();
		$this->model_core_category->getTree("nhanhieu",$this->data['nhanhieu']);
		unset($this->data['nhanhieu'][0]);
		
		$this->data['gia'] = array();
		$this->model_core_category->getTree("gia",$this->data['gia']);
		unset($this->data['gia'][0]);
		
		$this->id="content";		
		$this->template="sitebar/searchproduct.tpl";
		
		$this->render();
	}
	
	
}
?>