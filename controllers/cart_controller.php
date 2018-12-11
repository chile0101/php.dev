<?php

class Cart extends Controller{
	protected function checkout(){
		$viewmodel = new CartModel();
		$this->ReturnView($viewmodel->checkout());
	}
	protected function view(){
		$viewmodel = new CartModel();
		//echo $viewmodel->view();
		$this->ReturnView($viewmodel->view());
	}
}
?>