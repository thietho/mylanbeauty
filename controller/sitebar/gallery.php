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
					  
		$medias = $this->getSanPhanMoi();
		
		$arr = array('',0,'',$template,$medias);
		$this->data['sanphammoi']['title'] ="Sản phẩm mới";
		$this->data['sanphammoi']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
		$this->id="content";
		$this->template="sitebar/gallery.tpl";
		$this->render();
	}
	function getSanPhanMoi()
	{
		$this->load->model('core/sitemap');
		$this->load->model('core/media');
		$data_media = array();
		$listmediaid = $this->model_core_media->getInformation("sortsanphammoi","sort");
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