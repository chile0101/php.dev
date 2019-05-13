<?php

session_start();

require('config.php');


////////////////////

//require('mailer/Send_Mail.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require('PHPMailer/src/Exception.php');
require('PHPMailer/src/PHPMailer.php');
require('PHPMailer/src/SMTP.php');
//////

require('classes/Bootstrap.php');  
require('classes/Controller.php');  
require('classes/Model.php');  
require('classes/Messages.php');

require('controllers/admin/authadmin.php');
require('controllers/admin/users.php');
require('controllers/admin/products.php');
require('controllers/admin/bills.php');
require('controllers/admin/analics.php');

require('controllers/auth.php');
require('controllers/home.php');
require('controllers/cart_controller.php');
// require('controllers/addcart.php');


require('models/authadmin.php');
require('models/auth.php');
require('models/home.php');
require('models/cart_model.php');
require('models/bill.php');
require('models/analic.php');




require('models/user.php');
require('models/product.php');






$bootstrap = new Bootstrap($_GET);
$controller = $bootstrap->createController();
if($controller){
	$controller->executeAction();
}