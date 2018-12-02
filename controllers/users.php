<?php

class Users extends Controller{

    protected function Index(){
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->Index(),"admin");
    }
    protected function new(){
        // if(!isset($_SESSION['admin_logged_in'])){
        //     header('Location: '.ROOT_URL.'shares');
        // }
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->new(),"admin");
    }
    // protected function show(){
    //     $viewmodel = new UserModel();
    //     $this->ReturnView($viewmodel->Index(),true);
    // }
    // protected function edit(){
    //     $viewmodel = new UserModel();
    //     $this->ReturnView($viewmodel->Index(),true);
    // }

}

?>