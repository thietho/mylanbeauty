<?php
class ControllerSitebarGallery extends Controller
{
	public function index()
	{
		//San pham moi
		$template = array(
							  'template' => "sitebar/product_list.tpl",
							  'width' => 60,
							  'height' =>60,
							  'widthpreview' => 450,
							  'heightpreview' =>450
							  );
					  
		$medias = $this->getSanPhanMoi("sortsanphammoiSisley");
		$arr = array('',0,'',$template,$medias);
		$this->data['views']['Sisley']['title'] ="Sisley";
		$this->data['views']['Sisley']['data'] = $this->loadModule('module/productlist','getAll',$arr);
		
		$medias = $this->getSanPhanMoi("sortsanphammoiLancome");
		$arr = array('',0,'',$template,$medias);
		$this->data['views']['Lancome']['title'] ="Lancome";
		$this->data['views']['Lancome']['data'] = $this->loadModule('module/productlist','getAll',$arr);
		
		$medias = $this->getSanPhanMoi("sortsanphammoiEsteeLauder");
		$arr = array('',0,'',$template,$medias);
		$this->data['views']['EsteeLauder']['title'] ="Estee Lauder";
		$this->data['views']['EsteeLauder']['data'] = $this->loadModule('module/productlist','getAll',$arr);
		
		$medias = $this->getSanPhanMoi("sortsanphammoiClinique");
		$arr = array('',0,'',$template,$medias);
		$this->data['views']['Clinique']['title'] ="Clinique";
		$this->data['views']['Clinique']['data'] = $this->loadModule('module/productlist','getAll',$arr);
		
		$this->id="content";
		$this->template="sitebar/gallery.tpl";
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