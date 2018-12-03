<?php

class Users extends Controller{

    protected function Index(){
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->Index());
    }
    protected function new(){
        // if(!isset($_SESSION['admin_logged_in'])){
        //     header('Location: '.ROOT_URL.'shares');
        // }
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->new());
    }
    protected function show(){
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->show($this->id));
    }
    protected function edit(){
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->edit($this->id));
    }
    protected function delete(){
        $viewmodel= new UserModel();
        $this->ReturnView($viewmodel->delete($this->id));
    }

}

?>