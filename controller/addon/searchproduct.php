<?php
class ControllerAddonSearchproduct extends Controller
{
	public function index()
	{
		$this->document->breadcrumb .= "  » Tìm kiếm sản phẩm";
		$this->load->model("core/category");
		$this->load->model("core/sitemap");
		$this->data['loaisp'] = array();
		$siteid = $this->member->getSiteId();
		$this->model_core_sitemap->getTreeSitemap("sanpham",$this->data['loaisp'],$siteid);
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
		
		if(@$_GET['keyword'] !='' || $_GET['loaisp'] != '' || $_GET['nhanhieu'] !='')
		{
			$this->getList();	
		}
		
		$this->id="content";		
		$this->template="addon/searchproduct.tpl";
		
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
		if(@$keyword == "" && $loaisp == "" && $nhanhieu == "" && $gia == "")
		{
			@$this->data['output'] = "Bạn chưa chọn tiêu chí tìm kiếm";
			return;
		}
		
		$where = " AND mediatype = 'module/product' AND mediaparent = ''";
		if(@$keyword !="")
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
		if(@$loaisp)
		{
			$where .= " AND refersitemap like '%[".$loaisp."]%'";
		}
		if(@$nhanhieu)
		{
			$where .= " AND brand like '".$nhanhieu."'";
		}
		/*if(@$gia)
		{
			@$arrgia = split("-",$datasearch['gia']);
			$giatu = (int)$arrgia[0];
			$giaden = (int)$arrgia[1];
			$whereprice=" AND mediatype = 'module/product'";
			if(@$giatu)
				$whereprice = " AND price >= '".$giatu*$donvi ."'";
			if(@$giaden)
				$whereprice.= " AND price <= '".$giaden*$donvi ."'";
			
			$mediaprice = $this->model_core_media->getList($whereprice);
			
			$listparent = $this->string->matrixToArray($mediaprice,"mediaparent");
			
		}*/
		
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
			if(@$hasprice)
				$medias = array();	
		}
		
		$template = array(
							  'template' => "module/product_list.tpl",
							  'width' => 320,
							  'height' =>320,
							  'widthpreview' => 450,
						  	  'heightpreview' =>450
							  );
		$arr = array("",'',"Kết quả tìm kiếm",$template,$medias);
		$this->data['searchresult'] = $this->loadModule('module/productlist','getAll',$arr);
	}
	
}
?>