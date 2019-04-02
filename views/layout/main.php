
<!DOCTYPE html>
<html>
<head>
  <title>Shopera</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
   
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/fonts/OpenSansCondensed">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/style.css"> <!-- main -->
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/shop.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/star-rate.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/sign_style.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/cart.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/contact.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/message.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/about.css">
  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/detail_style.css">

  <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/fonts/OpenSansCondensed">

  <link rel="icon" href="<?php echo ROOT_PATH;?>assets/images/icons/logo-icon.png"  sizes="20x20">


</head>

<body>
  <header>
    <div class="header-container">
      <div class="site-title">
        <a href="<?php echo ROOT_URL; ?>"><img  src="<?php echo ROOT_PATH;?>assets/images/logo-final.png" alt="logo"></a>
      </div>
      <div class="menu-icon" >
        <img src="<?php echo ROOT_PATH;?>assets/images/icons/menu-icon.png" alt="menu-icon" >
      </div>
      <div class="menu-primary">
        <ul> 
          <li><a href="<?php echo ROOT_URL; ?>home/shop">Categories</a></li>
          <li><a href="<?php echo ROOT_URL; ?>home/about">About</a></li>


           

          <li><a href="<?php echo ROOT_URL; ?>home/contact">Contact us</a>

          </li>
          
        </ul>
      </div> 



       <div class="header-search">
        <!-- <form role="search" method="get" class="search-form" action="page_404.html">
          <input type="search" class="search-field" placeholder="Search..." value="" name="s" title="Search for:" />
          <input type="hidden" name="lang" value="" />
          <input type="submit" class="search-submit" value="Search" />
        </form> -->
        <form class="form-inline">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-light my-2 my-sm-4" type="submit">Search</button>
        </form>
      </div> 

      


      <div class="cart-content">
        <a href="<?php echo ROOT_URL; ?>cart/view">
          <span class="cart-image" id="cart-image"><img src="<?php echo ROOT_PATH;?>assets/images/icons/cart-icon.png" alt="cart-icon"></span>
        </a>
      </div>
      <?php if(isset($_SESSION['user_logged_in'])): ?>
        <div class="sign-content"><a href="<?php echo ROOT_URL; ?>auth/profile/<?php echo $_SESSION['user_data']['id']; ?>"><?php echo $_SESSION['user_data']['fullname']; ?>  </a> <a href="<?php echo ROOT_URL; ?>auth/logout">Logout</a></div>
         
  
      <?php else: ?>
        <div class="sign-content"><a href="<?php echo ROOT_URL; ?>auth/login">Log in </a>
          <p class="register-button">
          <a href="<?php echo ROOT_URL; ?>auth/register"> Register</a></div>
          </p>
      <?php endif ?>
    </div>  
  </header>
      
      <?php require($view); ?>
   
<div class="footer" >
    <div class=" row" style="margin-bottom:3px;">
      <div class="col">
        <h4>Contact</h4>
        <hr>
        
        <a href="mailto:example@mail.com" style="color:green;"><h6><i style="margin-right:5px;" class="fa fa-envelope" aria-hidden="true"></i> ex@mail.com</h6></a>
        <h6> <i style="margin-right:5px;" class="fa fa-phone" aria-hidden="true"></i> +18045678834</h6>
        <h6><i style="margin-right:5px;" class="fa fa-map-marker" aria-hidden="true"></i> 4th Avenue,London</h6>
      
	
      </div>

      <div class="col">
        <h4>News</h4>
        <hr>
        <ul>
          <li><a href="https://store.steampowered.com/about/" style="color:green;">Abous Steam and how to install</a></li>
          <li><a href="https://store.steampowered.com/explore/new/" style="color:green;">Games new</a></li>
          <li><a href="https://en.wikipedia.org/wiki/Copyright_and_video_games" style="color:green;">Copyright and video games</a></li>
        </ul>
      </div>


      <div class="col">
        <h4>Subcribe</h4>
        <hr>
        <p>If you want to be updated regularly on our newest updates, events, and always be on top of things, leave your email and have no worries.</p>
        <form role="search" method="get" class="subscribe-form" action="#">
          <input type="text" class="subscribe-field" placeholder=" Email" value=""  title="Subscribe" />
          <input type="hidden" name="lang" />
          <input type="submit" class="subscribe-submit" value="Subscribe" />
        </form>
      </div>
    </div>
</div>

    <div class="info" style="font-size:12px; background:#000000;color:white;border: none;">
      <p>© 2017 Games Zone. All Rights Reserved</p>
    </div>
    <!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      xfbml            : true,
      version          : 'v3.2'
    });
  };

  (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- Your customer chat code -->
<div class="fb-customerchat"
  attribution=setup_tool
  page_id="641878059586112">
</div>

    <script src="<?php echo ROOT_PATH; ?>assets/js/jquery-3.1.1.min.js">
    <script src="<?php echo ROOT_PATH; ?>assets/js/popper.min.js"></script>
    <script src="<?php echo ROOT_PATH; ?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo ROOT_PATH; ?>assets/js/menu-icon.js" ></script>


</body>
</html>
