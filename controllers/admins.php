<?php

class Admins extends Controller{

    protected function login(){
        $viewmodel = new AdminModel();
        $this->ReturnView($viewmodel->login(),"admin");
    }
    protected function logout(){
        $viewmodel = new AdminModel();
        $this->ReturnView($viewmodel->logout(),"admin");
    }
   
}

?>