
<!DOCTYPE html>
<html>
<head>
  <title>HTC Store</title>
  <meta name="description" content="Shop game bản quyền lớn và uy tín nhất Việt Nam. Bán game bản quyền giá rẻ, uy tín, nhanh chóng. Steam wallet, Steam code, CD Key Steam, CSGO , Game ...">
  <meta name="keywords" content="game,steam,game steam,game gia re, game mien phi,pubg,game ban quyen,steam code,gta5">
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
  <!-- Global site tag (gtag.js) - Google Analytics -->


  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-139231957-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-139231957-1');
  </script>

  <style>
    #result-search{
      display:none;
      position: absolute;

      width:275px;
      z-index:9999;
    }
    #result-search ul {
     
      list-style-type: none;
      padding: 0;
      margin: 0;
     
    }
    #result-search ul li {
     
      border-radius:4px;
     
    }
    #result-search ul li a {
     
      border: 1px solid #ddd; /* Add a border to all links */
      margin-top: -1px; /* Prevent double borders */
      background-color: #f6f6f6; /* Grey background color */
      padding: 12px; /* Add some padding */
      text-decoration: none; /* Remove default text underline */
      font-size: 18px; /* Increase the font-size */
      color: black; /* Add a black text color */
      display: block; /* Make it into a block element to fill the whole list */
    }
    .result-search ul li a:hover:not(.header) {
      background-color: #eee; /* Add a hover effect to all links, except for headers */
    }
  </style>

  <script>
    function myFunction() {
      // Declare variables
      var div,input, filter, ul, li, a, i, txtValue;
      div=document.getElementById("result-search");
      input = document.getElementById('myInput');
      filter = input.value.toUpperCase();
      ul = document.getElementById("myUL");
      li = ul.getElementsByTagName('li');

      var count=0;
      for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        
        if(filter == ""){
          div.style.display="none";
        } else if (txtValue.toUpperCase().indexOf(filter) > -1 && count < 5)  {
         
          div.style.display="inline";
          li[i].style.display = "inline";
          count+=1;
          
          
        } else {
          //div.style.display="inline";
          li[i].style.display = "none";
        }
       
      }
    }

  </script>


</head>

<body>
  <header>
    <div class="header-container">

      <div class="site-title">
        <a href="<?php echo ROOT_URL; ?>"><img  src="<?php echo ROOT_PATH;?>assets/images/logowhite.png" alt="logo"></a>
      </div>

      <div class="menu-icon" >
        <img src="<?php echo ROOT_PATH;?>assets/images/icons/menu-icon.png" alt="menu-icon" >
      </div>

      <div class="menu-primary">
        <ul> 
          <li><a href="<?php echo ROOT_URL; ?>home/shop">Categories</a></li>
          <li><a href="<?php echo ROOT_URL; ?>home/about">About</a></li>
          <li><a href="<?php echo ROOT_URL; ?>home/contact">Contact us</a></li>
        </ul>
      </div> 

       <div class="header-search">

        <form  class="form-inline" id="live-search" action="" method="post" autocomplete="off">
          <input autocomplete="false" name="hidden" type="text" style="display:none;">
          <input style="width:80%;margin-top:20px" class="form-control mr-sm-2" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
          <!-- <input  type="text" placeholder="Search" aria-label="Search"> -->
          <!-- <button class="btn btn-outline-light my-2 my-sm-4" type="submit">Search</button> -->
        </form>

        <div id="result-search">
          <ul id="myUL">
            <li><a href="http://www.chilecse.com/home/detail/1">Grand Theft Auto V</a></li>
            <li><a href="http://www.chilecse.com/home/detail/2">Devil May Cry 5</a></li>

            <li><a href="http://www.chilecse.com/home/detail/3">Tom Clancy The Devision</a></li>
            <li><a href="http://www.chilecse.com/home/detail/4">Watch Dogs 2</a></li>

            <li><a href="http://www.chilecse.com/home/detail/5">Outlast 2</a></li>
            <li><a href="http://www.chilecse.com/home/detail/6">Resident Evil 7</a></li>
            <li><a href="http://www.chilecse.com/home/detail/7">Resident Evil 2 Remake</a></li>
            <li><a href="http://www.chilecse.com/home/detail/8">Little Nightmares</a></li>
            <li><a href="http://www.chilecse.com/home/detail/9">Rocket League</a></li>
            <li><a href="http://www.chilecse.com/home/detail/10">WWE 2K18</a></li>
            <li><a href="http://www.chilecse.com/home/detail/11">Beat Saber</a></li>
            <li><a href="http://www.chilecse.com/home/detail/12">NBA 2k17</a></li>
            <li><a href="http://www.chilecse.com/home/detail/13">WRC 7 FIA World Rally Championship</a></li>
            <li><a href="http://www.chilecse.com/home/detail/14">The Elder Scrolls V: Skyrim</a></li>
            <li><a href="http://www.chilecse.com/home/detail/15">The Witcher 3: Wild Hunt</a></li>
            <li><a href="http://www.chilecse.com/home/detail/16">Sekiro: Shadows Die Twice</a></li>

            <li><a href="http://www.chilecse.com/home/detail/17">Dark Souls 3</a></li>
            <li><a href="http://www.chilecse.com/home/detail/18">Diablo</a></li>

          </ul>
        </div>
     

      </div> 

      <div class="cart-content">
        <a href="<?php echo ROOT_URL; ?>cart/view">
          <span class="cart-image" id="cart-image"><img src="<?php echo ROOT_PATH;?>assets/images/icons/cart-icon.png" alt="cart-icon"></span>
        </a>
      </div>
      
      <?php if(isset($_SESSION['user_logged_in'])): ?>

        <div class="sign-content" ><a href="<?php echo ROOT_URL; ?>auth/profile/<?php echo $_SESSION['user_data']['id']; ?>"><?php echo $_SESSION['user_data']['fullname']; ?>  </a> <a href="<?php echo ROOT_URL; ?>auth/logout">Logout</a>
        </div>
        
      <?php else: ?>
        <div class="sign-content" style="display:inline-flex;height: 30px;">
          <a href="<?php echo ROOT_URL; ?>auth/login" >Log in </a>
          <p class="register-button btn-outline-success" style="margin-top:-2px;margin-left:10px;">
          <a href="<?php echo ROOT_URL; ?>auth/register"> Register</a>
          </p>
         
        </div>  
      <?php endif ?>
      
    </div>  
  </header>
      
      <?php require($view); ?>
      
 
   
<div class="footer" >
    <div class=" row" style="margin-bottom:3px;">
      <div class="col">
        <h4>Contact</h4>
        <hr>
        
        <a href="mailto:example@mail.com" style="color:green;"><h6><i style="margin-right:5px;" class="fa fa-envelope" aria-hidden="true"></i> anphawolf@mail.com</h6></a>
        <h6> <i style="margin-right:5px;" class="fa fa-phone" aria-hidden="true"></i> +84395669219</h6>
        <h6><i style="margin-right:5px;" class="fa fa-map-marker" aria-hidden="true"></i>HTC Store</h6>
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

<script type="text/javascript" src="<?php echo ROOT_PATH;?>assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<?php echo ROOT_PATH;?>assets/js/popper.min.js"></script>
<script type="text/javascript" src="<?php echo ROOT_PATH;?>assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo ROOT_PATH;?>assets/js/menu-icon.js" ></script>

</body>
</html>
