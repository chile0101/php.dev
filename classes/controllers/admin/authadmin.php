<?php

class Authadmin extends Controller{

    protected function login(){
        $viewmodel = new AuthAdminModel();
        $this->ReturnView($viewmodel->login());
    }
    protected function logout(){
        $viewmodel = new AuthAdminModel();
        $this->ReturnView($viewmodel->logout());
    }
   
}

?>