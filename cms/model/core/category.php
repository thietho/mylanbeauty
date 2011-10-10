<?php
class ModelCoreCategory extends Model
{ 
	private $root = "category";
	function __construct() 
	{
		
		$data = $this->getItem($this->root);
		if(count($data)==0)
		{
			$data['catelogyid'] = $this->root;
			$data['catelogyname'] = "Category";
			$data['parent'] = "";
			$data['position'] = 0;
			$this->insert($data);
		}
   	}
	
	public function getItem($catelogyid, $where="")
	{
		$query = $this->db->query("Select `catelogy`.* 
									from `catelogy` 
									where catelogyid ='".$catelogyid."' ".$where);
		return $query->row;
	}
	
	public function getList($where="", $from=0, $to=0,$order = " Order by position")
	{
		
		$sql = "Select `catelogy`.* 
									from `catelogy` 
									where 1=1 " . $where . $order;
		if($to > 0)
		{
			$sql .= " Limit ".$from.",".$to;
		}
		
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getChild($catelogyid,$order = " Order by position")
	{
		$where = " AND parent = '".$catelogyid."'";
		return $this->getList($where);
	}
	
	protected function getnextid($prefix)
	{
		$id=$this->db->getNextIdVarChar("catelogy","catelogyid",$prefix);
		return $id;
	}
	
	public function nextposition($parent)
	{
		$sql = "Select max(position) as max From catelogy where parent='".$parent."'";
		$query = $this->db->query($sql);
		return $query->rows[0]['max'] +1 ;
	}
	
	public function insert($data)
	{
		$catelogyid= $this->db->escape(@$data['catelogyid']);
		$catelogyname=$this->db->escape(@$data['catelogyname']);
		$parent=$this->db->escape(@$data['parent']);
		$position= (int)@$this->nextposition($parent);
		
		
		
		$field=array(
						'catelogyid',
						'catelogyname',
						'parent',
						'position'
					);
		$value=array(
						$catelogyid,
						$catelogyname,
						$parent,
						$position
					);
		$this->db->insertData("catelogy",$field,$value);
		
		return $catelogyid;
	}
	
	public function update($data)
	{
		$catelogyid= $this->db->escape(@$data['catelogyid']);
		$catelogyname=$this->db->escape(@$data['catelogyname']);
		$parent=$this->db->escape(@$data['parent']);
		
		
		
		
		$field=array(
						'catelogyid',
						'catelogyname',
						'parent'
					);
		$value=array(
						$catelogyid,
						$catelogyname,
						$parent
					);
		
		$where="catelogyid = '".$catelogyid."'";
		$this->db->updateData("catelogy",$field,$value,$where);
		
		
		
		return true;
	}
	
	public function updateposition($data)
	{
		$catelogyid= $this->db->escape(@$data['catelogyid']);
		$position= (int)@$data['position'];
		
		$field=array(
						
						'position'
					);
		$value=array(
		
						$position
					);
		
		$where="catelogyid = '".$catelogyid."'";
		$this->db->updateData("catelogy",$field,$value,$where);
		
		
		
		return true;
	}
	
	public function save($data)
	{
		$item = $this->getItem($data['catelogyid']);
		if(count($item) == 0)
		{
			$this->insert($data);
		}
		else
		{
			$this->update($data);
		}
	}
	
	public function delete($catelogyid)
	{
		$data = $this->getChild($catelogyid);
		if(count($data)==0)
		{
			$where="catelogyid = '".$catelogyid."'";
			$this->db->deleteData("catelogy",$where);
			
		}
	}
	
	public function deletedatas($data)
	{
		if(count($data)>0)
		{
			foreach($data as $item)	
				$this->delete($item);
		}
	}
	
	//Tree
	function getTree($id, &$data, $level=-1, $path="", $parentpath="")
	{
		$arr=$this->getItem($id);
		
		$rows = $this->getChild($id);
		
		$arr['countchild'] = count(rows);
		
		if($arr['parent'] != "") 
			$parentpath .= "-".$arr['parent'];
		
		if($id!="" )
		{
			$level += 1;
			$path .= "-".$id;
			
			$arr['level'] = $level;
			$arr['path'] = $path;
			$arr['parentpath'] = $parentpath;
			
			array_push($data,$arr);
		}
		
		
		if(count($rows))
			foreach($rows as $row)
			{
				$this->getTree($row['catelogyid'], $data, $level, $path, $parentpath);
			}
	}
	
	public function getDanhMucPhanLoai()
	{
		$data = array();
		$this->getTree($this->root,$data);
		foreach($data as $key =>$item)
		{
			$data[$key]['parentpath'] = str_replace("-".$this->root,"",$data[$key]['parentpath']);
			$data[$key]['path'] = str_replace("-".$this->root,"",$data[$key]['path']);
		}
		return $data;
	}
}
?>