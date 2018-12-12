<?php

class Home extends Controller{
    protected function Index(){
        $viewmodel = new HomeModel();
        $this->ReturnView($viewmodel->Index());
    }
    protected function shop(){
        $viewmodel = new HomeModel();
        $this->ReturnView($viewmodel->Shop());
    }
    protected function contact(){
        $viewmodel = new HomeModel();
        $this->ReturnView($viewmodel->Contact());
    }
    protected function detail(){
    	$viewmodel = new HomeModel();
    	$this->ReturnView($viewmodel->Detail($this->id));
    }
    protected function about(){
        $viewmodel = new HomeModel();
        $this->ReturnView($viewmodel->About());
    }
}

?>