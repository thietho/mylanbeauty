<?php
class ControllerCoreMember extends Controller
{
	private $error = array();
	function __construct() 
	{
	 	$this->load->model("core/user");
		$this->load->model("core/category");
		$this->load->model("quanlykho/phieunhapxuat");
		$this->load->model("quanlykho/hoahong");
		$this->load->model("addon/thuchi");
		
   	}
	public function index()
	{
		$this->data['insert'] = $this->url->http('core/member/insert');
		$this->data['delete'] = $this->url->http('core/user/delete');		
		
		
		$this->id='content';
		$this->template="core/member_list.tpl";
		$this->layout=$this->user->getLayout();
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	public function insert()
	{
		if(!$this->user->hasPermission($this->getRoute(), "add"))
		{
			$this->response->redirect("?route=common/permission");
		}
		//$this->load->language('core/user');
		//$this->data = array_merge($this->data, $this->language->getData());
		
		$this->document->title = $this->language->get('heading_title');
		
		$this->data['haspass'] = true;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) 
		{
			$this->request->post['birthday'] = $this->date->formatViewDate($this->request->post['birthday']);
			$this->model_core_user->insertuser($this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->http('core/user'));
		}
    
    	$this->getForm();
	}
	
	public function update()
	{
		if(!$this->user->hasPermission($this->getRoute(), "edit"))
		{
			$this->response->redirect("?route=common/permission");
		}
		else
		{
			//$this->load->language('core/user');
			//$this->data = array_merge($this->data, $this->language->getData());
			
			$this->document->title = $this->language->get('heading_title');
			
			$this->data['haspass'] = false;
			
			
		
			$this->getForm();
		}
		
  	}
	
	public function active()
	{
		$id = $this->request->get['id'];
		
		
		$data['id'] = $id;
		$user=$this->model_core_user->getId($id);
		if($user['status'] == "lock")
			$data['status'] = "active";
		else
			$data['status'] = "lock";
		$this->model_core_user->updateCol($id,'status',$data['status']);
		if($data['status'] == "active")
			$this->data['output']="Kích hoạt thành công";
		if($data['status'] == "lock")
			$this->data['output']="User đã bị khóa";
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
	}
	
	public function delete() 
	{
		$listuserid=$this->request->post['delete'];
		//$listuserid=$_POST['delete'];
		
		if(count($listuserid))
		{
			foreach($listuserid as $id)
			{
				$this->model_core_user->destroy($id);
			}
			$this->data['output'] = "Xóa thành công";
		}
		$this->id="content";
		$this->template="common/output.tpl";
		$this->render();
  	}
	private function loadData()
	{
		$where = "AND usertypeid = 'member'";
		$data = $this->request->get;
		foreach($data as $key =>$val)
		{
			$data[$key] = urldecode($val);	
		}
		$_GET = $data;
		if(trim($data['username']))
		{
			$where .= " AND username like '%".$data['username']."%'";
		}
		if(trim($data['fullname']))
		{
			$where .= " AND fullname like '%".$data['fullname']."%'";
		}
		if(trim($data['phone']))
		{
			$where .= " AND phone like '%".$data['phone']."%'";
		}
		if(trim($data['address']))
		{
			$where .= " AND address like '%".$data['address']."%'";
		}
		if(trim($data['email']))
		{
			$where .= " AND email like '%".$data['email']."%'";
		}
		if(trim($data['status']))
		{
			$where .= " AND status like '".$data['status']."'";
		}
		if(trim($data['assignid']))
		{
			$where .= " AND assignid = '".$data['assignid']."'";
		}
		
		$where .= " Order by fullname";
		$rows = $this->model_core_user->getList($where);
		return $rows;
	}
	public function getList() 
	{
		$this->data['users'] = array();
		$rows = $this->loadData();
		//Page
		$page = $this->request->get['page'];		
		$x=$page;		
		$limit = 20;
		$total = count($rows); 
		// work out the pager values 
		$this->data['pager']  = $this->pager->pageLayoutAjax($total, $limit, $page,"memberlist"); 
		
		$pager  = $this->pager->getPagerData($total, $limit, $page); 
		$offset = $pager->offset; 
		$limit  = $pager->limit; 
		$page   = $pager->page;
		for($i=$offset;$i < $offset + $limit && count($rows[$i])>0;$i++)
		//for($i=0; $i <= count($this->data['users'])-1 ; $i++)
		{
			$this->data['users'][$i] = $rows[$i];
			$this->data['users'][$i]['link_edit'] = $this->url->http('core/member/update&id='.$this->data['users'][$i]['id']);
			$this->data['users'][$i]['text_edit'] = "Edit";
			$this->data['users'][$i]['link_active'] = $this->url->http('core/member/active&id='.$this->data['users'][$i]['id']);
			if($this->data['users'][$i]['status']=='lock')
				$this->data['users'][$i]['text_active'] = "Kích hoạt";
			else
				$this->data['users'][$i]['text_active'] = "Khóa";
			$arr = array($this->data['users'][$i]['id']);
			$this->data['users'][$i]['congno'] = $this->loadModule("core/member","getCongNo",$arr);
			
		}
		$this->data['refres']=$_SERVER['QUERY_STRING'];
		$this->id='content';
		$this->template="core/member_table.tpl";
		
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	
	public function getCongNo($id='',$tungay='',$denngay='')
	{
		if($id=="")
			$id=$this->request->get['khachhangid'];
		if($tungay=="")
			$tungay=$this->request->get['tungay'];
		if($denngay=="")
			$dennngay=$this->request->get['dennngay'];
		
		$this->data['user'] = $this->model_core_user->getId($id);
		//Lay tat ca phieu thu cong no
		$where = " AND makhachhang = 'KH-".$id."' AND loaithuchi = 'thu' AND taikhoanthuchi = 'thuno'";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		
		$this->data['data_phieuthu'] = $this->model_addon_thuchi->getList($where);
		$tongthu = 0;
		foreach($this->data['data_phieuthu'] as $item)
		{
			$tongthu += $item['quidoi'];	
		}
		//Lay tat ca phieu thu vay no
		$where = " AND makhachhang = 'KH-".$id."' AND loaithuchi = 'thu' AND taikhoanthuchi = 'credit'";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		$this->data['data_phieuthuvayno'] = $this->model_addon_thuchi->getList($where);
		$tongvay = 0;
		foreach($this->data['data_phieuthuvayno'] as $item)
		{
			$tongvay += $item['quidoi'];	
		}
		//Lay tat ca phieu chi tra no
		$where = " AND makhachhang = 'KH-".$id."' AND loaithuchi = 'chi' AND taikhoanthuchi = 'paycredit'";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		$this->data['data_phieuchitrano'] = $this->model_addon_thuchi->getList($where);
		$tongtrano = 0;
		foreach($this->data['data_phieuchitrano'] as $item)
		{
			$tongtrano += $item['quidoi'];	
		}
		
		//Lay tat ca phieu ban hang
		$where = " AND loaiphieu in ('PX-PBH','CH-BH') AND khachhangid = '".$id."'";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		$this->data['data_phieubanhang'] = $this->model_quanlykho_phieunhapxuat->getList($where);
		$tongno = 0;
		foreach($this->data['data_phieubanhang'] as $key => $item)
		{
			$where = " AND phieuid = '".$item['id']."'";
			$data_ct = $this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
			$arr = array();
			foreach($data_ct as $ct)
			{
				$arr[] = $ct['soluong']." ".$this->document->productName($ct['mediaid']);
			}
			$this->data['data_phieubanhang'][$key]['detail'] = implode("<br>",$arr);
			$tongno += $item['congno'];	
		}
		//Lay tat ca phieu tra hang
		$where = " AND loaiphieu = 'NK-KHTL' AND khachhangid = '".$id."'";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		$this->data['data_phieutrahang'] = $this->model_quanlykho_phieunhapxuat->getList($where);
		
		$tongnotrahang = 0;
		foreach($this->data['data_phieutrahang'] as $item)
		{
			$where = " AND phieuid = '".$item['id']."'";
			$data_ct = $this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
			$arr = array();
			foreach($data_ct as $ct)
			{
				$arr[] = $ct['soluong']." ".$this->document->productName($ct['mediaid']);
			}
			$this->data['data_phieutrahang'][$key]['detail'] = implode("<br>",$arr);
			$tongnotrahang += $item['congno'];	
		}
		
		$congno = $tongno + $tongtrano - $tongthu - $tongvay - $tongnotrahang;
		
		if($this->request->get['khachhangid'])
		{
			
			$this->data['tongno'] = $tongno;
			$this->data['tongnotrahang'] = $tongnotrahang;
			$this->data['tongtrano'] = $tongtrano;
			$this->data['tongphieuthu'] = $tongthu;
			$this->data['tongvay'] = $tongvay;
			
			$this->data['congno'] = $congno;
			$this->id='content';
			$this->template="core/member_congno.tpl";
			if($_GET['dialog']=='print')
			{
				$this->layout='layout/print';
			}
			$this->render();
		}
		else
		{
			$this->data['output'] = $congno;
			$this->id='content';
			$this->template='common/output.tpl';
			$this->render();
			
		}
	}
	
	private function getForm()
	{
		$this->data['error'] = @$this->error;
		$this->load->model("core/usertype");
		$this->load->model("core/country");
		$this->load->helper('image');
		
		$this->data['DIR_UPLOADPHOTO'] = HTTP_SERVER."index.php?route=common/uploadpreview";
		$this->data['cancel'] = $this->url->https('core/member');
		$id = $this->request->get['id'];
		
		$this->data['user'] = $this->model_core_user->getId($id);
		$this->data['user']['imagethumbnail']=HelperImage::resizePNG($this->data['user']['imagepath'], 200, 200);
    	$this->data['user']['commissions'];
		$this->data['user']['commissions'] = json_decode($this->data['user']['commissions']);
		//print_r($commissions);
		//echo $commissions['fullsize'];
		
		$this->id='content';
		$this->template='core/member_form.tpl';
		//$this->layout=$this->user->getLayout();
		
		$this->render();
	}
	
	public function save()
	{
		$data = $this->request->post;
		
		if($this->validateForm($data))
		{
			
			$data['birthday'] = $this->date->formatViewDate($data['birthday']);
			$data['commissions'] = json_encode($data['commissions']);
			if($data['id']=="")
			{
				$this->model_core_user->insertUser($data);	
			}
			else
			{	
				$this->model_core_user->updateUser($data);	
			}
			
			$this->data['output'] = "true";
		}
		else
		{
			foreach($this->error as $item)
			{
				$this->data['output'] .= $item."<br>";
			}
		}
		
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm()
	{
    	
		if(trim($this->request->post['fullname'])=="")
		{
			$this->error['fullname'] = "Bạn chưa nhập tên";
			
		}
		
		if(trim($this->request->post['email'])!="")
		{
			if ($this->validation->_checkEmail($this->request->post['email']) == false ) 
			{
				$this->error['email'] = "Email invalidate";
			}
		}
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	
	public function commission()
	{
		$id = $this->request->get['id'];
		$this->data['member'] = $this->model_core_user->getId($id);
		
		$this->data['commissionway'] = array();
		$this->model_core_category->getTree("commissionway",$this->data['commissionway']);
		unset($this->data['commissionway'][0]);
		
		$this->id='content';
		$this->template="core/member_commission.tpl";
		$this->layout=$this->user->getLayout();
		if($this->request->get['opendialog']=='true')
		{
			$this->layout="";
			$this->data['dialog'] = true;
			
		}
		$this->render();
	}
	public function thongke()
	{
		$this->load->model("quanlykho/phieunhapxuat");
		$data = $this->request->post;
		$this->data['post'] = $data;
		$tungay = $this->date->formatViewDate($data['tungay']);
		$denngay = $this->date->formatViewDate($data['denngay']);
		$memberid = $data['memberid'];
		
		//$arr = array($memberid,$tungay,$denngay);
		//$this->data['congno'] = $this->loadModule("core/member","getCongNo",$arr);
		
		$this->data['member'] = $this->model_core_user->getId($memberid);
		//Load cac khach hang assignid boi memberid
		$where = " AND assignid = '".$memberid."'";
		$data_member = $this->model_core_user->getList($where);
		$arr_member = $this->string->matrixToArray($data_member,'id');
		//print_r($arr_member);
		$where = " AND loaiphieu = 'PBH'";
		//$where .= " AND khachhangid in ('". implode("','",$arr_member) ."')";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		
		$this->data['data_banhang'] = array();
		foreach($arr_member as $id)
		{
			$data_banhang = $this->model_quanlykho_phieunhapxuat->getList($where." AND khachhangid = ". $id ,0,0," Order by ngaylap");
			$this->data['data_banhang'][$id] = $data_banhang;
		}
		
		if(count($this->data['data_banhang']))
		{
			
			$this->id='content';
			$this->template="core/member_thongke.tpl";
			
			$this->render();
		}
		else
		{
			$this->data['output'] = "Không có dữ liệu phù hợp";
			$this->id='content';
			$this->template="common/output.tpl";
			$this->render();
		}
	}
	public function thongkeSalesProduct()
	{
		$this->load->model("quanlykho/phieunhapxuat");
		$data = $this->request->post;
		$this->data['post'] = $data;
		$tungay = $this->date->formatViewDate($data['tungay']);
		$denngay = $this->date->formatViewDate($data['denngay']);
		$memberid = $data['memberid'];
		
		//$arr = array($memberid,$tungay,$denngay);
		//$this->data['congno'] = $this->loadModule("core/member","getCongNo",$arr);
		
		$this->data['member'] = $this->model_core_user->getId($memberid);
		$this->data['commission'] = json_decode($this->data['member']['commissions']);
		
		
		//Load cac khach hang assignid boi memberid
		$where = " AND assignid = '".$memberid."'";
		$data_member = $this->model_core_user->getList($where);
		$arr_member = $this->string->matrixToArray($data_member,'id');
		//print_r($arr_member);
		$where = " AND loaiphieu = 'PBH'";
		//$where .= " AND khachhangid in ('". implode("','",$arr_member) ."')";
		if($tungay != "")
		{
			$where .= " AND ngaylap > '".$tungay."'";
		}
		if($denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 24:00:00'";
		}
		
		$this->data['data_banhang'] = array();
		foreach($arr_member as $id)
		{
			$data_banhang = $this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where." AND khachhangid = ". $id ,0,0," Order by ngaylap");
			$this->data['data_banhang'][$id] = $data_banhang;
		}
		
		if(count($this->data['data_banhang']))
		{
			
			$this->id='content';
			$this->template="core/member_thongke_salesproduct.tpl";
			
			$this->render();
		}
		else
		{
			$this->data['output'] = "Không có dữ liệu phù hợp";
			$this->id='content';
			$this->template="common/output.tpl";
			$this->render();
		}
	}
	public function getMember()
	{
		$keyword = urldecode($this->request->get['term']);
		$where = "AND usertypeid = 'member'";
		@$arrkey = split(' ', $keyword);
		if($keyword)
		{
			$arr = array();
			foreach($arrkey as $key)
			{
				$arr[] = "fullname like '%".$key."%'";
			}
			$where .= " AND ((". implode(" AND ",$arr). "))";
		}
		$members = $this->model_core_user->getList($where);
		$data = array();
		foreach($members as $member)
		{
			$label = $member['fullname'];
			if($member['phone'])
				$label .= " - ".$member['phone'];
			if($member['address'])
				$label .= " - ".$member['address'];
			$arr = array(
						"id" => $member['id'],
						"label" => $label,
						"value" => $member['fullname'],
						"data" => array(
										"fullname" =>$member['fullname'],
										"phone"=>$member['phone'],
										"address"=>$member['address'])
					);
			$data[] = $arr;
		}
		$this->data['output'] = json_encode($data);
		$this->id="member";
		$this->template="common/output.tpl";
		$this->render();
	}
	
	public function commissionsave()
	{
		$data = $this->request->post;
		if($this->validateHoaHong($data))
		{
			
			$data['ngaytinhhoahong'] = $this->date->formatViewDate($data['ngaytinhhoahong']);
			
			
			$this->model_quanlykho_hoahong->save($data);	
			
			
			$this->data['output'] = "true";
		}
		else
		{
			foreach($this->error as $item)
			{
				$this->data['output'] .= $item."<br>";
			}
		}
		
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
		
	}
	private function validateHoaHong($data)
	{
    	
		if(trim($data['ngaytinhhoahong'])=="")
		{
			$this->error['ngaytinhhoahong'] = "Bạn chưa chọn ngày";
			
		}
		
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	public function getListCommission()
	{
		$memberid = $this->request->get['memberid'];
		$where = " AND memberid = '".$memberid."' ORDER BY `ngaytinhhoahong` ASC ";
		$data_commission = $this->model_quanlykho_hoahong->getList($where);
		foreach($data_commission as $key => $item)
		{
			$data_commission[$key]['ngaytinhhoahong'] = $this->date->formatMySQLDate($item['ngaytinhhoahong']);
			$data_commission[$key]['cachtinhtext'] = $this->document->getCategory($item['cachtinh']);
		}
		$this->data['output'] = json_encode($data_commission);
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	public function delCommission()
	{
		$id = $this->request->get['id'];
		$this->model_quanlykho_hoahong->delete($id);
		$this->data['output'] = "Xóa thành công";
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	//Cac ham xu ly tren form
	public function export()
	{
		require_once DIR_COMPONENT.'PHPExcel/Classes/PHPExcel.php';
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->getProperties()->setCreator("Ho Lan Solutions")
							 ->setLastModifiedBy("Lư Thiết Hồ")
							 ->setTitle("Export data")
							 ->setSubject("Export data")
							 ->setDescription("")
							 ->setKeywords("Ho Lan Solutions")
							 ->setCategory("Product");
		$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'STT')
			->setCellValue('B1', 'TÊN KHÁCH HÀNG')
			->setCellValue('C1', 'SỐ ĐIỆN THOẠI')
            ->setCellValue('D1', 'ĐỊA CHỈ')
			->setCellValue('E1', 'EMAIL')
			;
		$objPHPExcel->getActiveSheet()->getStyle('A1:E1')->getFont()->setBold(true);
		/*$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setWrapText(true);
		$objPHPExcel->getActiveSheet()->setCellValue('A8',"Hello\nWorld");
		$objPHPExcel->getActiveSheet()->getRowDimension(8)->setRowHeight(-1);
		$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setWrapText(true);*/
		
		
		$key = 2;
		$rows = $this->loadData();
		foreach($rows as $i=> $item)
		{
			$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('A'.$key, $i+1)
				->setCellValue('B'.$key, $item['fullname'])
				->setCellValue('C'.$key, '\''.$item['phone'])
				->setCellValue('D'.$key, $item['address'])
				->setCellValue('E'.$key, $item['email'])	
				;
			$key++;
		}
		$objPHPExcel->getActiveSheet()->setTitle('Danh Sach Khach Hang');
		$objPHPExcel->setActiveSheetIndex(0);
		//
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$filename = "DanhSachKhachHang".time().".xls";
		$objWriter->save(DIR_CACHE.$filename);
		$this->data['output'] = HTTP_IMAGE."cache/".$filename;
		
		$this->id='content';
		$this->template='common/output.tpl';
		
		$this->render();
	}
	public function exportTable()
	{
		
		$this->data['users'] = $this->loadData();
		$this->id='content';
		$this->template='core/member_export.tpl';
		$this->layout="layout/print";
		$this->render();
	}
}
?>