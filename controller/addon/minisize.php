<?php
class ControllerAddonMinisize extends Controller
{
	private $error = array();
	public function index()
	{
		$this->document->breadcrumb .= " » Mini size";
		$this->document->title .= " - Mini size";
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->load->model("core/category");
		$this->load->helper('image');
		
		$this->data['producttype'] = array();
		$this->model_core_category->getTree("producttype",$this->data['producttype']);
		unset($this->data['producttype'][0]);
		
		$this->getListByBrand('Sisley');
		$this->id="content";
		$this->template="addon/minisize.tpl";
		$this->render();
	}
	
	public function getListByBrand($brand)
	{
		$arrprotype = $this->string->matrixToArray($this->data['producttype'],'categoryid');
		$where = " AND brand = '".$brand."' AND noteprice in ('".implode("','",$arrprotype)."')";
		
	}
}
?>