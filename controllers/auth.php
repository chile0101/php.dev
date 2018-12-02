<?php

class Auth extends Controller{
    protected function register(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->register(),true);
    }
    protected function login(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->login(),true);
    }
    protected function logout(){
        $viewmodel = new AuthModel();
        $this->ReturnView($viewmodel->logout(),true);
    }
}

?>