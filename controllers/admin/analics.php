<?php

class Analics extends Controller{

    
    protected function Index(){
        $this->lock_path_admin();
        $viewmodel = new AnalicModel();
        $this->ReturnView($viewmodel->Index());
    }
}

?>