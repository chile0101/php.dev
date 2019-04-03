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
					
				}elseif($request['param3']=="action"){
					$this->action="index";
					$this->id="action";
				}elseif($request['param3']=="advanture"){
					$this->action="index";
					$this->id="advanture";
				}elseif($request['param3']=="casual"){
					$this->action="index";
					$this->id="casual";
				}elseif($request['param3']=="indie"){
					$this->action="index";
					$this->id="indie";
				}
				elseif($request['param3']=="search"){
					$this->action="index";
					$this->id="search";
				}
				elseif( filter_var($request['param3'], FILTER_VALIDATE_INT) === false ) {
					$this->action=$request['param3'];
				}else{
					$this->id=$request['param3'];
					if($request['param4']==""){
						$this->action="show";
					}else{
						$this->action=$request['param4'];
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
			}elseif($request['param2']=="shop"){
				$this->action="shop";
				if($request['param3']=="all"){
					$this->id="all";
				}elseif($request['param3']=="action"){
					// $this->action="index";
					$this->id="action";
				}elseif($request['param3']=="advanture"){
					// $this->action="index";
					$this->id="advanture";
				}elseif($request['param3']=="casual"){
					// $this->action="index";
					$this->id="casual";
				}elseif($request['param3']=="indie"){
					// $this->action="index";
					$this->id="indie";
				}else{

				}

			}else{
				$this->action=$request['param2'];
			}

			






			 $this->id=$request['param3'];
		}
		echo "param1".$request['param1']."<br>";
		echo "param2".$request['param2']."<br>";
		echo "param3".$request['param3']."<br>";

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