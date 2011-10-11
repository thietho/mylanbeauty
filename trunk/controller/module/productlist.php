<?php
class ControllerModuleProductlist extends Controller
{
	public function index($sitemapid="", $count = 0,$headername ="", $template = array(),$medias=array())
	{
		
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->load->helper('image');
		
		if($sitemapid == "")
			$sitemapid = $this->document->sitemapid;
		
		$siteid = $this->user->getSiteId();
		$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$this->data['sitemap']['breadcrumb'] = $this->model_core_sitemap->getBreadcrumb($sitemapid, $siteid);
		$this->document->title .= " - ".$this->data['sitemap']['sitemapname'];
		$step = (int)$this->request->get['step'];
		$to = $count;
		
		//Get list
		$queryoptions = array();
		$queryoptions['mediaparent'] = '%';
		$queryoptions['mediatype'] = '%';
		$queryoptions['refersitemap'] = $sitemapid;
		
		if($mediaid == "")
		{
			if(count($medias)==0)
			{
				//$medias = $this->model_core_media->getPaginationList($queryoptions, $step, $to);
				$medias = $this->model_core_media->getPaginationList($queryoptions);
			}
			
			
			
			
			$this->data['medias'] = array();
			
		
			$index = -1;
			//Page
			$page = $this->request->get['page'];		
			$x=$page;		
			$limit = $to;
			$total = count($medias); 
			$uri = "site/".$siteid."/".$sitemapid."/";
			// work out the pager values 
			$this->data['pager']  = $this->pager->pageLayoutWeb($total, $limit, $page,$uri); 
			
			$pager  = $this->pager->getPagerData($total, $limit, $page); 
			$offset = $pager->offset; 
			$limit  = $pager->limit; 
			$page   = $pager->page;
			for($i=$offset;$i < $offset + $limit && count($medias[$i])>0;$i++)
			//foreach($medias as $media)
			{
				$index += 1;
				$media = $medias[$i];
				
				$arr = $this->string->referSiteMapToArray($media['refersitemap']);
				$sitemapid = $arr[0];
				
				$link = HTTP_SERVER."site/".$siteid."/".$sitemapid."/".$media['mediaid'];
				
				$imagethumbnail = "";
				
				if($media['imagepath'] != "" )
				{
					$imagethumbnail = HelperImage::fixsize($media['imagepath'], $template['width'], $template['height']);
				}
				
				$priceproduct = $this->model_core_media->getListByParent($media['mediaid']," AND mediatype = 'price' Order by position");
				foreach($priceproduct as $key => $item)
				{
					$para = $this->string->referSiteMapToArray($item['summary']);
					foreach($para as $val)
					{
						$ar = split("=",$val);
						$priceproduct[$key][$ar[0]] = $ar[1];	
					}
					
				}
				
				$this->data['medias'][] = array(
					'mediaid' => $media['mediaid'],
					'title' => $media['title'],
					'summary' => $media['summary'],
					'price' => $media['price'],
					'imagethumbnail' => $imagethumbnail,
					'fileid' => $media['imageid'],
					'statusdate' => $this->date->formatMySQLDate($media['statusdate'], 'longdate', "/"),
					'link' => $link
				);
				
			}
			
			
			
		}
		
		$this->id="news";
		$this->template=$template['template'];
		$this->render();
	
	}
	
}
?>