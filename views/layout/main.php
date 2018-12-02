<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Shopera</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/bootstrap.css">
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/style.css">
   
</head>
<body>
   
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Carousel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"> <a class="nav-link" href="<?php echo ROOT_URL ?>">Home </a></li>
                <li class="nav-item"> <a class="nav-link" href="<?php echo ROOT_URL ?>shares">Shares </a></li>
            </ul>
            <ul class="navbar-nav navbar-right">
                <?php if(isset($_SESSION['is_logged_in'])): ?>
                    <li class="nav-item"> <a class="nav-link" href="">Welcom <?php echo $_SESSION['user_data']['name']; ?> </a></li>
                    <li class="nav-item"> <a class="nav-link" href="<?php echo ROOT_URL ?>users/logout">Logout </a></li>
                <?php else: ?>
                    <li class="nav-item"> <a class="nav-link" href="<?php echo ROOT_URL ?>users/login">Login </a></li>
                    <li class="nav-item"> <a class="nav-link" href="<?php echo ROOT_URL ?>users/register">Register </a></li>
                <?php endif ?>
            </ul>
        </div>
    </nav>
    <br>
    <div class="container">
        <div class="row">
        <?php Messages::display(); ?>
        </div>
        <div class="row">
            <?php require($view); ?>
        </div>

    </div>

</body>
</html>