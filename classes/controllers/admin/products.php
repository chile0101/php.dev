<?php

class Products extends Controller{

    
    protected function Index(){
        $this->lock_path_admin();
        $viewmodel = new ProductModel();
        $this->ReturnView($viewmodel->Index($this->id));
    }
    protected function new(){
        $this->lock_path_admin();
        $viewmodel = new ProductModel();
        $this->ReturnView($viewmodel->new());
    }
    protected function show(){
        $this->lock_path_admin();

        $viewmodel = new ProductModel();
        $this->ReturnView($viewmodel->show($this->id));
    }
    protected function edit(){
        $this->lock_path_admin();

        $viewmodel = new ProductModel();
        $this->ReturnView($viewmodel->edit($this->id));
    }
    protected function delete(){
        $this->lock_path_admin();
        $viewmodel= new ProductModel();
        $this->ReturnView($viewmodel->delete($this->id));
    }

}

?>