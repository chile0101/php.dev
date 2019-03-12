<?php 
session_start();
require('../classes/Messages.php');  

if(!empty($_POST['id'])){
   
    if(!empty($_SESSION['cart'])){
        if(in_array($_POST['id'],array_keys($_SESSION['cart']))){
            foreach ($_SESSION['cart'] as $key => $value){
                if($_POST['id'] == $key){
                    $_SESSION['cart'][$key] += $_POST['quantity'];
                }
            }
        }else{
            $_SESSION['cart'][$_POST['id']] = $_POST['quantity'];
        }
    }else{
        $_SESSION['cart']=array(
            $_POST['id']=>$_POST['quantity']
        );


    }
   //Messages::setMsg('chiel','error');
}

echo json_decode(1);

?>