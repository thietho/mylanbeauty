<?php
class ControllerAddonCart extends Controller
{
	private $error = array();
	public function index()
	{
		$this->document->breadcrumb .= "Giỏ hàng";
		
		$this->id="content";
		$this->template="addon/cart.tpl";
		$this->render();
	}
	
	public function getList()
	{
		$this->data['medias'] =array();
		if(isset($_SESSION['cart']))
		{
			$this->data['medias'] = $_SESSION['cart'];
		}
		$this->id="content";
		$this->template="addon/cart_list.tpl";
		$this->render();
	}
	
	public function add()
	{
		$this->load->model("core/media");
		$this->load->helper('image');
		$data = $this->request->get;
		if(!isset($_SESSION['cart']))
		{
			$_SESSION['cart'] = array();	
		}
		$mediaid = $data['mediaid'];
		$media = $this->model_core_media->getItem($mediaid);
		$para = $this->string->referSiteMapToArray($media['summary']);
		foreach($para as $val)
		{
			$ar = split("=",$val);
			$media[$ar[0]] = $ar[1];	
		}
		$price = $this->string->toNumber($media['gia']);
		if((int)$media['khuyenmai']!=0)
			$price = $this->string->toNumber($media['khuyenmai']);
		$parent = $this->model_core_media->getItem($media['mediaparent']);
		$media['imagethumbnail'] = HelperImage::resizePNG($parent['imagepath'], 100, 100);
		$qty =(int)$_SESSION['cart'][$mediaid]['qty'];
		
		$_SESSION['cart'][$mediaid] = array(
											'mediaid' => $mediaid,
											'title' => $parent['title']."-". $media['title'],
											'price' => $media['price'],
											'imagethumbnail' => $media['imagethumbnail'],
											'qty' => $qty+1
											);
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	public function update()
	{
		$this->load->model("core/media");
		$this->load->helper('image');
		$data = $this->request->get;
		if(!isset($_SESSION['cart']))
		{
			$_SESSION['cart'] = array();	
		}
		$mediaid = $data['mediaid'];
		$media = $this->model_core_media->getItem($mediaid);
		$media['imagethumbnail'] = HelperImage::resizePNG($media['imagepath'], 100, 100);
		$qty =  $this->string->toNumber($data['qty']);
		$_SESSION['cart'][$mediaid]['qty'] = $qty;
		
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	public function remove()
	{
		$data = $this->request->get;	
		$mediaid = $data['mediaid'];
		unset($_SESSION['cart'][$mediaid]);
		
		$this->data['output'] = "true";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>