<?php 
    // if(!empty($_POST['id'])){
        session_start();
        unset($_SESSION['cart'][$_POST['id']]);
    // }
    echo json_decode();
?>