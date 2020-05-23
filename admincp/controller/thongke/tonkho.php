<?php
/**
 * Class ControllerCoreItems
 *
 * @property ModelCoreMedia model_core_media
 * @property ModelCoreCategory model_core_category
 * @property ModelQuanlykhoPhieuNhapXuat model_quanlykho_phieunhapxuat
 * @property ModelSalesShop model_sales_shop
 * @property ModelQuanlykhoDonvitinh model_quanlykho_donvitinh
 */
class ControllerThongkeTonkho extends Controller
{
	private $error = array();
	function __construct() 
	{
        @$this->load->model("core/media");
        @$this->load->model("core/category");
        @$this->load->model("quanlykho/phieunhapxuat");
		@$this->load->model("core/module");
        @$this->load->model("quanlykho/donvitinh");
        @$this->load->model("sales/shop");
		$moduleid = $_GET['route'];
		@$this->document->title = @$this->model_core_module->getBreadcrumbs($moduleid);
		if(@$this->user->checkPermission($moduleid)==false)
		{
			@$this->response->redirect('?route=page/home');
		}

        $this->data['nhanhieu'] = $this->model_core_category->getChild('nhanhieu');
        unset($this->data['nhanhieu'][count($this->data['nhanhieu'])-1]);
        $brandother = $this->model_core_category->getChild('brandother');
        foreach($brandother as $cat)
        {
            $this->data['nhanhieu'][] = $cat;
        }
        $where = " ORDER BY shopname";
        @$this->data['data_shop'] = @$this->model_sales_shop->getList($where);
	}
	public function index()
	{
		@$this->thongke();
		@$this->id='content';
		@$this->template="thongke/tonkho.tpl";
		@$this->layout="layout/center";
		@$this->render();
	}
	public function thongke()
	{
        set_time_limit (0);
        $data = array();
        foreach($this->data['nhanhieu'] as $cat)
        {
            $where = " AND mediatype = 'module/product'
                        AND brand = '".$cat['categoryid']."'
                        AND inventory <> 0
                        Order by code";
            $this->data['medias'][$cat['categoryid']] = @$this->model_core_media->getList($where);
            foreach($this->data['medias'][$cat['categoryid']] as $key => $media)
            {
                $inventory = @$this->model_core_media->getInventory($media['mediaid']);
                $arr_ton = @$this->model_quanlykho_donvitinh->toDonVi($inventory,$media['unit']);
                $this->data['medias'][$cat['categoryid']][$key]['khoinventory'] = @$this->model_quanlykho_donvitinh->toText($arr_ton);
                foreach(@$this->data['data_shop'] as $shop)
                {
                    $shopinventory = @$this->model_core_media->getShopInventory($shop['id'],$media['mediaid']);
                    $str = '';

                    if(@$shopinventory)
                    {
                        $arr_ton = @$this->model_quanlykho_donvitinh->toDonVi($shopinventory,$media['unit']);
                        $inventorytext = @$this->model_quanlykho_donvitinh->toText($arr_ton);
                        $str = $shop['shopname']." Tồn: ". $inventorytext;
                    }
                    $this->data['medias'][$cat['categoryid']][$key]['shopinventory'] .= $str;
                }
            }

        }

	}
	
}
?>