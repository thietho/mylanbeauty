<?php
class ControllerSitebarGallery extends Controller
{
	function __construct() 
	{
		//$this->iscache = true;
		/*$arr=array();
		foreach($_GET as $key => $val)
			$arr[] = $key."=".$val;*/
	 	$this->name ="SitebarGallery";
   	}
	public function index()
	{
		if($this->cachehtml->iscacht($this->name) == false)
		{
			//San pham moi
			//$this->load->model('core/sitemap');
			$this->load->model('core/media');
			$this->load->helper('image');
			$template = array(
								  'template' => "sitebar/product_list.tpl",
								  'width' => 60,
								  'height' =>60,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
						  
			$arrbrandid = array(
								"Sisley",
								"Lancome",
								"EsteeLauder",
								"Clinique",
								"Clarins",
								"Shishedo",
								"VictoriaSecrect"
								);			  
			$this->data['views'] = array();
			foreach($arrbrandid as $brandid)
			{
				$medias = $this->getSanPhanMoi("sortsanphammoi".$brandid);
				$arr = array('',0,'',$template,$medias);
				$media = $this->model_core_media->getItem(SITEID."cat".$brandid);
				$this->data['views'][$brandid]['logo'] = HelperImage::resizePNG($media['imagepath'],190,190);
				$this->data['views'][$brandid]['title'] ="Sisley";
				$this->data['views'][$brandid]['link'] = $this->document->createLink('brand','Sisley');
				$this->data['views'][$brandid]['data'] = $this->loadModule('module/productlist','getAll',$arr);
			}
			
			
			/*$medias = $this->getSanPhanMoi("sortsanphammoiLancome");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['Lancome']['title'] ="Lancome";
			$this->data['views']['Lancome']['link'] = $this->document->createLink('brand','Lancome');
			$this->data['views']['Lancome']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$medias = $this->getSanPhanMoi("sortsanphammoiEsteeLauder");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['EsteeLauder']['title'] ="Estee Lauder";
			$this->data['views']['EsteeLauder']['link'] = $this->document->createLink('brand','EsteeLauder');
			$this->data['views']['EsteeLauder']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$medias = $this->getSanPhanMoi("sortsanphammoiClinique");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['Clinique']['title'] ="Clinique";
			$this->data['views']['Clinique']['link'] = $this->document->createLink('brand','Clinique');
			$this->data['views']['Clinique']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$medias = $this->getSanPhanMoi("sortsanphammoiClarins");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['Clarins']['title'] ="Clarins";
			$this->data['views']['Clarins']['link'] = $this->document->createLink('brand','Clarins');
			$this->data['views']['Clarins']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$medias = $this->getSanPhanMoi("sortsanphammoiShishedo");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['Shishedo']['title'] ="Shishedo";
			$this->data['views']['Shishedo']['link'] = $this->document->createLink('brand','Shishedo');
			$this->data['views']['Shishedo']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$medias = $this->getSanPhanMoi("sortsanphammoiVictoriaSecrect");
			$arr = array('',0,'',$template,$medias);
			$this->data['views']['VictoriaSecrect']['title'] ="Victoria Secrect";
			$this->data['views']['VictoriaSecrect']['link'] = $this->document->createLink('brand','VictoriaSecrect');
			$this->data['views']['VictoriaSecrect']['data'] = $this->loadModule('module/productlist','getAll',$arr);*/
		}
		
		$this->id="content";
		$this->template="sitebar/gallery1.tpl";
		$this->render();
	}
	function getSanPhanMoi($code)
	{
		$this->load->model('core/sitemap');
		$this->load->model('core/media');
		$data_media = array();
		$listmediaid = $this->model_core_media->getInformation($code,"sort");
		$arrmediaid = array();
		
		$arrmediaid = $this->string->referSiteMapToArray($listmediaid);
		foreach($arrmediaid as $mediaid)
		{
			$media = $this->model_core_media->getItem($mediaid);
			if($media['status']== 'active')
				$data_media[] = $media;
		}
			
		return $data_media;
		
	}

}
?>