<?php
abstract class Controller{
	protected $id;
	protected $action;
	protected $role;
	public function __construct($role,$action, $id){
		$this->role=$role;
		$this->action = $action;
		$this->id = $id;
	}

	public function executeAction(){
		return $this->{$this->action}();
	}

	protected function returnView($viewmodel){

		if($this->role=='admin'){
			$view='views/admins/'. strtolower(get_class($this)) . '/' . $this->action . '.php';
			require('views/layout/main_admin.php');
		}else{
			$view = './views/'. strtolower(get_class($this)). '/' . $this->action. '.php';
			require('views/layout/main.php');
		}
	}
	protected function lock_path_admin(){
        if(!isset($_SESSION['admin_logged_in'])){
            header('Location: '. ROOT_URL_ADMIN);
        }
	}
	protected function lock_path_user(){
        if(!isset($_SESSION['user_logged_in'])){
            header('Location: '. ROOT_URL);
        }
    }
}