<?php
abstract class Controller{
	protected $request;
	protected $action;

	public function __construct($action, $request){
		$this->action = $action;
		$this->request = $request;
	}

	public function executeAction(){
		return $this->{$this->action}();
	}

	protected function returnView($viewmodel,$error, $fullview){
		$view = 'views/'. get_class($this). '/' . $this->action. '.php';
		if($fullview=="user"){
			require('views/layout/main.php');
		}elseif($fullview=="admin"){
			require("views/layout/main_admin.php");
		} else {
			echo "require view";
			//require($view);
		}
	}
}