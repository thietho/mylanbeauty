<?php
class ControllerPageHome extends Controller
{
	function __construct() 
	{
		$this->iscache = true;
	 	$this->name ="PageHome";
   	}
	public function index()
	{
		if($this->cachehtml->iscacht($this->name) == false)
		{
			//Brand
			$template = array(
						  'template' => "module/category_brand.tpl"
						  );
		
			$arr = array("nhanhieu",$template);
			$this->data['brand'] = $this->loadModule('module/category','getList',$arr);
			//Banner home
			$template = array(
						  'template' => "home/banner.tpl",
						  'width' => 548,
						  'height' =>548
						  );
		
			$arr = array("bannerhome",0,"",$template);
			$this->data['bannerhome'] = $this->loadModule('module/block','getList',$arr);
			//San pham moi
			$template = array(
						  'template' => "home/product.tpl",
						  'width' => 176,
						  'height' =>176
						  );
						  
			$medias = $this->getProduct("","sanphamhot");
			$arr = array("",0,"Sản phẩm hot",$template,$medias);
			$this->data['producthome']['sanphamhot'] = $this->loadModule('module/productlist','getAll',$arr);
						  
			$this->load->model('core/sitemap');
			$listroot = $this->model_core_sitemap->getListByParent("sanpham", $this->member->getSiteId());
			foreach($listroot as $sitemap)
			{
				//$sitemap = $this->model_core_sitemap->getItem("mypham",$this->member->getSiteId());
				$medias = $this->getProduct($sitemap['sitemapid'],"");
				$arr = array("",0,$sitemap['sitemapname'],$template,$medias);
				$this->data['producthome'][$sitemap['sitemapid']] = $this->loadModule('module/productlist','getAll',$arr);
			}
			/*$sitemap = $this->model_core_sitemap->getItem("trangdiem",$this->member->getSiteId());
			$medias = $this->getProduct($sitemap['sitemapid'],"");
			$arr = array("",12,$sitemap['sitemapname'],$template,$medias);
			$this->data['producthome']['trangdiem'] = $this->loadModule('module/productlist','index',$arr);*/
			
			/*$medias = $this->getProduct("sanphamkhuyenmai");
			$arr = array("",12,"Sản phẩm khuyến mãi",$template,$medias);
			$this->data['producthome']['sanphamkhuyenmai'] = $this->loadModule('module/productlist','index',$arr);*/
			/*$arr = array("gioithieu");
			$this->data['producthome'] = $this->loadModule('module/information','index',$arr);*/
			//
			$this->loadSiteBar();
			
		}
		
		$this->id="content";
		$this->template="page/home.tpl";
		$this->layout="layout/home";
		$this->render();
	}
	
	private function loadSiteBar()
	{
		//Left sitebar
		$this->data['leftsitebar']['searchproduct'] = $this->loadModule('sitebar/searchproduct');
		$arr = array('sanpham');
		$this->data['leftsitebar']['produtcategory'] = $this->loadModule('sitebar/catalogue','index',$arr);
		$this->data['leftsitebar']['cart'] = $this->loadModule('sitebar/cart');
		//$this->data['leftsitebar']['faq'] = $this->loadModule('sitebar/faq');
		
		//$this->data['leftsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		//$this->data['leftsitebar']['exchange'] = $this->loadModule('sitebar/exchange');
		//$this->data['leftsitebar']['weblink'] = $this->loadModule('sitebar/weblink');
		//$this->data['leftsitebar']['hitcounter'] = $this->loadModule('sitebar/hitcounter');
		
		//Rigth sitebar
		/*$this->data['rightsitebar']['login'] = $this->loadModule('sitebar/login');
		$this->data['rightsitebar']['search'] = $this->loadModule('sitebar/search');
		$this->data['rightsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['rightsitebar']['banner'] = $this->loadModule('sitebar/banner');
		$this->data['rightsitebar']['question'] = $this->loadModule('sitebar/question');*/
	}
	
	function getProduct($rootid,$status)
	{
		$this->load->model('core/sitemap');
		$this->load->model('core/media');
		$siteid = $this->member->getSiteId();
		$sitemaps = array();
		if($rootid == "")
			$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
		else
		{
			$this->model_core_sitemap->getTreeSitemap($rootid,$sitemaps, $siteid);
		}
		$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		
		/*//print_r($sitemaps);
		
		$arrsitemapid = array();
		foreach($sitemaps as $item)
		{
			echo $item['sitemapid'];	
			array_push($arrsitemapid, $item['sitemapid']);
		}*/
		
		$queryoptions = array();
		$queryoptions['mediaparent'] = '%';
		$queryoptions['mediatype'] = '%';
		$options['refersitemap'] = $arrsitemapid;
		$options['groupkeys'] = $status;
		$data = $this->model_core_media->getPaginationList($options, $step=0, $to=9);
		
		return $data;
	}
	
}
?>