<?php

class Bills extends Controller{

    
    protected function Index(){
        $this->lock_path_admin();
        $viewmodel = new BillModel();
        $this->ReturnView($viewmodel->Index());
    }
    protected function show(){
        $this->lock_path_admin();

        $viewmodel = new BillModel();
        $this->ReturnView($viewmodel->show($this->id));
    }
    protected function edit(){
        $this->lock_path_admin();

        $viewmodel = new BillModel();
        $this->ReturnView($viewmodel->edit($this->id));
    }
    protected function delete(){
        $this->lock_path_admin();
        $viewmodel= new BillModel();
        $this->ReturnView($viewmodel->delete($this->id));
    }

}

?>