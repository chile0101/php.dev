<?php

class Users extends Controller{

    
    protected function Index(){
        $this->lock_path_admin();
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->Index());
    }
    protected function new(){
        $this->lock_path_admin();
        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->new());
    }
    protected function show(){
        $this->lock_path_admin();

        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->show($this->id));
    }
    protected function edit(){
        $this->lock_path_admin();

        $viewmodel = new UserModel();
        $this->ReturnView($viewmodel->edit($this->id));
    }
    protected function delete(){
        $this->lock_path_admin();
        $viewmodel= new UserModel();
        $this->ReturnView($viewmodel->delete($this->id));
    }

}

?>