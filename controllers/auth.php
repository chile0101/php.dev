<?php

class Auth extends Controller{
    protected function register(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->register());
    }
    protected function login(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->login());
    }
    protected function logout(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->logout());
    }
}

?>