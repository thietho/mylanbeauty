<?php
class ControllerCommonApi extends Controller
{
	public function getAlias()
	{
		$title = urldecode($this->request->get['title']);
		//$title = strtolower($title);
		$alias = $this->string->chuyenvekodau(trim($title));
		//$alias = $this->string->removeKtdatbiet(htmlspecialchars_decode( $alias));
		$alias = strtolower(str_replace(" ",'-',$alias));
		$this->load->model('core/media');
		$media = $this->model_core_media->getByAlias($alias);
		$index = 0;
		$temp = $alias;
		//print_r($media);
		while(count($media)>0)
		{
			$index++;
			$temp = $alias.'-'.$index;
			$media = $this->model_core_media->getByAlias($temp);
			
		}	
		$this->data['output'] = $temp;
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
}
?>