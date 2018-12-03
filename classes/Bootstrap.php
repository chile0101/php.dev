<?php
class Bootstrap{
	private $role;
	private $controller;
	private $action;
	private $id;
	
	public function __construct($request){
	
		if($request['param1']=='admin'){
			$this->role='admin';
			if($request['param2']==""){
				$this->controller='authadmin';
				$this->action='login';
			}else{
				$this->controller=$request['param2'];
				if($request['param3']==""){
					$this->action="index";
				}elseif( filter_var($request['param3'], FILTER_VALIDATE_INT) === false ) {
					$this->action=$request['param3'];
				}else{
					$this->id=$request['param3'];
					if($request['param4']==""){
						$this->action="show";
					}else{
						$this->action="edit";
					}
				}
			}
		}else{
			$this->role="user";
			if($request['param1']==""){
				$this->controller="home";
			}else{
				$this->controller=$request['param1'];
			}

			if($request['param2']==""){
				$this->action="index";
			}else{
				$this->action=$request['param2'];
			}

			// $this->id=$request['param3'];
		}

		echo "controller".$this->controller."<br>";
		echo "action".$this->action."<br>";
		echo "id".$this->id;
		
	}
	public function createController(){
		// Check Class
		if(class_exists($this->controller)){
			$parents = class_parents($this->controller);
			// Check Extend
			if(in_array("Controller", $parents)){
				if(method_exists($this->controller, $this->action)){
					return new $this->controller($this->role,$this->action, $this->id);
				} else {
					// Method Does Not Exist
					echo '<h1>Method does not exist</h1>';
					return;
				}
			} else {
				// Base Controller Does Not Exist
				echo '<h1>Base controller not found</h1>';
				return;
			}
		} else {
			// Controller Class Does Not Exist
			echo '<h1>Controller class does not exist</h1>';
			return;
		}
	}
}