<?php
class ControllerPageHome extends Controller
{
	function __construct() 
	{
		//$this->iscache = true;
	 	$this->name ="PageHome";
   	}
	public function index()
	{
		//if($this->cachehtml->iscacht($this->name) == false)
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
						  'width' => 765,
						  'height' =>0
						  );
		
			$arr = array("bannerhome",0,"",$template);
			$this->data['bannerhome'] = $this->loadModule('module/block','getList',$arr);
			//San pham moi
			$template = array(
								  'template' => "module/product_list.tpl",
								  'width' => 180,
								  'height' =>180,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
						  
			$medias = $this->getProduct("","sanphamhot");
			
			$arr = array($sitemap['sitemapid'],0,$sitemap['sitemapname'],$template,$medias);
			$this->data['producthome']['sanphamhot']['title'] ="Sản phẩm hot";
			$this->data['producthome']['sanphamhot']['data'] = $this->loadModule('module/productlist','getAll',$arr);
			
			
			$template = array(
								  'template' => "module/product_list.tpl",
								  'width' => 180,
								  'height' =>180,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
					  
			$this->load->model('core/sitemap');
			//$listroot = $this->model_core_sitemap->getListByParent("sanpham", $this->member->getSiteId());
			$data_sitemap = array();
			$this->model_core_sitemap->getTreeSitemap("sanpham", $data_sitemap, $this->member->getSiteId());
			
			foreach($data_sitemap as $sitemap)
			{
				if($sitemap['countchild'] == 0)
				{
					//$sitemap = $this->model_core_sitemap->getItem("mypham",$this->member->getSiteId());
					$medias = $this->getProduct($sitemap['sitemapid'],"");
					$arr = array($sitemap['sitemapid'],0,$sitemap['sitemapname'],$template,$medias);
					$this->data['producthome'][$sitemap['sitemapid']]['title'] = $sitemap['sitemapname'];
					$this->data['producthome'][$sitemap['sitemapid']]['data'] = $this->loadModule('module/productlist','getAll',$arr);
				}
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
		$this->document->title .= $this->document->setup['Title'];
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
		$this->data['leftsitebar']['gallery'] = $this->loadModule('sitebar/gallery');
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
		$data_media = array();
		$listmediaid = $this->model_core_media->getInformation("sort".$status,"sort");
		if($listmediaid == "")
			$listmediaid = $this->model_core_media->getInformation("sort".$rootid,"sort");
		if($listmediaid!="")
		{
			$arrmediaid = $this->string->referSiteMapToArray($listmediaid);
			
		
			
			foreach($arrmediaid as $mediaid)
			{
				$media = $this->model_core_media->getItem($mediaid);
				if($media['status']== 'active')
				$data_media[] = $media;
			}
			return $data_media;
		}
		
		$siteid = $this->member->getSiteId();
		$sitemaps = array();
		
		if($rootid != "")
		{
			$this->model_core_sitemap->getTreeSitemap($rootid,$sitemaps, $siteid);
			$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		}
		
		$where = " AND mediatype = 'module/product'";
		$where .= " AND mediaparent = ''";
		
		if(count($arrsitemapid))
		{
			foreach($arrsitemapid as $item)
			{
				$arr[] = " refersitemap like '%[".$item."]%'";
			}
			$where .= "AND (". implode($arr," OR ").")";
		}
		$listmediaid = $this->model_core_media->getInformation("sortsanphamhot","sort");
		if($listmediaid!="")
		{
			$arrmediaid = $this->string->referSiteMapToArray($listmediaid);
			$where .= " AND mediaid NOT IN ('".implode("','",$arrmediaid)."')";
		}
		//echo $where."<br>";
		$data = array();
		$data = $this->model_core_media->getList($where);
		$data_media = array_merge($data_media,$data);
		return $data_media;
	}
	
}
?>