<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <title>Shopera</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/user.css">
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/font-awesome-4.7.0/css/font-awesome.min.css">
   
    
</head>
<body>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Databoard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="<?php echo ROOT_URL; ?>users">Users </a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Products</a></li>
                </ul>

                <?php if(isset($_SESSION['admin_logged_in'])): ?>
                <ul class="navbar-nav navbar-right ">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo $_SESSION['admin_data']['email']; ?>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Your Profile</a>
                            <a class="dropdown-item" href="#">Setting</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<?php echo ROOT_URL ?>admin/authadmin/logout">Logout</a>
                        </div>
                    </li>
                </ul>
                <?php endif ?>
            </div>
        </nav>
    </div>

    
    <div class="container">
        
        <div class="row">
            <?php Messages::display(); ?>
            <?php require($view); ?>
        </div>
    </div>


    <script src="<?php echo ROOT_PATH; ?>assets/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<?php echo ROOT_PATH; ?>assets/js/popper.min.js"></script>
    <script src="<?php echo ROOT_PATH; ?>assets/js/bootstrap.min.js"></script>
 
</body>
</html>