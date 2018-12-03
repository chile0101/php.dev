<?php

session_start();

require('config.php');

require('classes/Bootstrap.php');  
require('classes/Controller.php');  
require('classes/Model.php');  
require('classes/Messages.php');

require('controllers/admin/authadmin.php');
require('controllers/admin/users.php');
require('controllers/auth.php');
require('controllers/home.php');

require('models/authadmin.php');
require('models/auth.php');
require('models/home.php');

require('models/user.php');




$bootstrap = new Bootstrap($_GET);
$controller = $bootstrap->createController();
if($controller){
	$controller->executeAction();
}