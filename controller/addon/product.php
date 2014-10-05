<?php
class ControllerAddonProduct extends Controller
{
	private $error = array();
	public function index()
	{
		
		$this->document->breadcrumb = "Tìm kiếm sản phẩm";
		$this->getList();
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
	
	private function getList()
	{
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->load->helper('image');
		$donvi = 1000;
		//$para = $this->string->referSiteMapToArray($_GET['search']);
		
		$keyword = urldecode($_GET['keyword']);
		$loaisp = urldecode($_GET['loaisp']);
		$nhanhieu = urldecode($_GET['nhanhieu']);
		$gia = urldecode($_GET['gia']);
		if($keyword == "" && $loaisp == "" && $nhanhieu == "" && $gia == "")
		{
			$this->data['output'] = "Bạn chưa chọn tiêu chí tìm kiếm";
			return;
		}
		
		$where = " AND mediatype = 'module/product' AND mediaparent = ''";
		if($keyword !="")
		{
			@$arrkey = split(' ', $keyword);
			$arr = array();
			$arrcode = array();
			$arrbarcode = array();
			$arrref = array();
			$arrsummary = array();
			$arrdescription = array();
			
			foreach($arrkey as $key)
			{
				$arr[] = "title like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrcode[] = "code like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrbarcode[] = "barcode like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrref[] = "ref like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrsummary[] = "summary like '%".$key."%'";
			}
			foreach($arrkey as $key)
			{
				$arrdescription[] = "description like '%".$key."%'";
			}
			$where .= " AND (
								(". implode(" AND ",$arr). ") 
								OR (". implode(" AND ",$arrcode). ") 
								OR (". implode(" AND ",$arrbarcode). ") 
								OR (". implode(" AND ",$arrref). ") 
								OR (". implode(" AND ",$arrsummary). ") 
								OR (". implode(" AND ",$arrdescription). ") 
							)";
		}
		if($loaisp)
		{
			$where .= " AND refersitemap like '%[".$loaisp."]%'";
		}
		if($nhanhieu)
		{
			$where .= " AND brand like '".$nhanhieu."'";
		}
		if($gia)
		{
			@$arrgia = split("-",$datasearch['gia']);
			$giatu = (int)$arrgia[0];
			$giaden = (int)$arrgia[1];
			$whereprice=" AND mediatype = 'module/product'";
			if($giatu)
				$whereprice = " AND price >= '".$giatu*$donvi ."'";
			if($giaden)
				$whereprice.= " AND price <= '".$giaden*$donvi ."'";
			
			$mediaprice = $this->model_core_media->getList($whereprice);
			
			$listparent = $this->string->matrixToArray($mediaprice,"mediaparent");
			
		}
		
		$medias = $this->model_core_media->getList($where);
		
		if(count($listparent))
		{
			$data = array();
			foreach($medias as $key =>$item)
			{
				if(!in_array($item['mediaid'],$listparent))
				{
					unset($medias[$key]);	
				}
				else
				{
					$data[] = $item;	
				}
			}
			$medias = $data;
		}
		else
		{
			if($hasprice)
				$medias = array();	
		}
		
		$template = array(
							  'template' => "module/product_list.tpl",
							  'width' => 170,
							  'height' =>170,
							  'widthpreview' => 450,
						  	  'heightpreview' =>450
							  );
		$arr = array("",'',"Kết quả tìm kiếm",$template,$medias);
		$this->data['output'] = $this->loadModule('module/productlist','getAll',$arr);
	}
	
	public function getViewList()
	{
		$this->data['medias'] =array();
		if(isset($_SESSION['proviews']))
		{
			$this->data['medias'] = $_SESSION['proviews'];
		}
		
		$this->id="content";
		$this->template="sitebar/productview_list.tpl";
		$this->render();
	}
	
	public function addViewlist()
	{
		$this->load->model("core/media");
		$this->load->helper('image');
		$data = $this->request->get;
		if(!isset($_SESSION['proviews']))
		{
			$_SESSION['proviews'] = array();	
		}
		$mediaid = $data['mediaid'];
		$media = $this->model_core_media->getItem($mediaid);
		$media['imagethumbnail'] = HelperImage::resizePNG($media['imagepath'], 100, 100);
		$arr = $this->string->referSiteMapToArray($media['refersitemap']);
		$sitemapid = $arr[0];
		$media['link'] = $this->document->createLink($sitemapid,$media['alias']);
		$_SESSION['proviews'][$mediaid] = $media;
		
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>