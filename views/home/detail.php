
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
</head>
<script type="text/javascript">

 function addCart(id){
      //alert(id///.p);
    product={
        'id': id,
        'quantity':1
    };

    $.ajax(
        {     
        type:    'post',
        url:     '../../models/addcart.php',
        data:    product,
        dataType: 'json',
        
        success: function(data) 
        {   
            var mess = document.getElementById("alert")
            var p = document.createElement("p");
            var text = document.createTextNode("Added products to cart");
            p.appendChild(text);
            mess.appendChild(p);
            mess.classList.add("messagess");
            
            setTimeout(function(){ 
            
                while (mess.hasChildNodes()) {
                    mess.removeChild(mess.firstChild);
                }
                mess.className = mess.className.replace(/\bmessagess\b/g, "");
                
            },1000);
                 
            
        }   
        });
    }

    // function fetchReview(productId){
    
    // $.ajax(
    //     {     
    //     type:    'post',
    //     url:     '../../models/fetchReview.php',
    //     data:    productId,
    //     dataType: 'json',
        
    //     success: function(data) 
    //     {   
           
            
    //     }   
    //     });
    // }




</script>

<div id = "alert"></div>

<div class="container detail">
  <div class="main row" ;">
    <div class="col">
      <div class="img-detail">
        <img src="<?php echo $viewmodel['image']; ?>" alt="image product detail">
      </div>
     
    
        <div class="item-price" style="text-align:center">
                $ <?php echo $viewmodel['pricenew'] ?>
        </div>
       
      
    </div>
    <div class="col">
      <div class="info-product" style="color:white;">
        <h3><?php echo $viewmodel['name']; ?></h3>
        <p style="color:#007BFF; font-size:16px;"><?php echo $viewmodel['description']; ?>
        </p><br>
        <label >Release date:</label> <?php echo $viewmodel['date_release']; ?> <br>
          <label style="margin-right:45px;">Developer:</label> <a href="" style="color:#007BFF;"><?php echo $viewmodel['developer']; ?></a>
          <a href="<?php echo $viewmodel['link_origin']; ?>" style="color:#007BFF;"> Original link product</a><br>
         <label> Popular user-defined tags for this product: </label><br>
         <div style="margin-bottom:25px;">
          <button type="button" class="btn btn-primary btn-sm" style="height:">Early Access</button>
          <button type="button" class="btn btn-secondary btn-sm">Action</button>
          <button type="button" class="btn btn-primary btn-sm">Free to play</button>
          <button type="button" class="btn btn-secondary btn-sm">Advanture</button>
          </div>
      
            <label class="type-label" style="color:white;">Quantity:</label>
            <input type="number" id="quantity" style="width:28px; text-align: center;height:10px" value="1" min="1">
            <button class="btn btn-primary" type="submit" onclick="addCart(<?php echo $viewmodel['id']; ?>);" class="btn btn-danger">
                  ADD TO CART
            </button>

        </div>



  </div>
  

  </div>

    <div class="tab"6.5>
      <button class="tab-links" onclick="openCity(event, 'London')">ABOUT THIS GAME</button>
      <button class="tablinks" onclick="openCity(event, 'Paris')">SYSTEM REQUIREMENTS</button>
      <button class="tablinks" onclick="openCity(event, 'Tokyo')">ALL REVIEWS</button>
    </div>

    <div id="London" class="tabcontent" style="padding-bottom:50px;color:green;"> 
      
      <p>Join Human Rocket Person on the adventure of a lifetime as he tries to save the universe. Jump your way through different levels on your incredible pogo stick. Fly with special abilities and master the awkward controls.
      </p>
      
      
      <object width="420" height="315"
        data="<?php echo 'https://www.youtube.com/embed/'.$viewmodel['link_trailer'] ?>">
      </object>
      
      
      <img src="https://steamcdn-a.akamaihd.net/steam/apps/965340/extras/FeaturesText.png?t=1542813376">
      <ul style="padding-left:20px;">
        <li style="color:green;">Pogo jumping</li>
        <li style="color:green;">Platforming</li>
        <li style="color:green;">Junk physics</li>
        <li style="color:green;">Lots of ass juice</li>
      </ul>
      <img src="https://steamcdn-a.akamaihd.net/steam/apps/965340/extras/DevNoteText.png?t=1542813376">
      <p>This game is incredibly hard, due to the intentional awkward controls and the level design. By the end of the game, you will hate us, the developers. It’s one of those games where you die a lot but in a funny way. We put a great effort into making a unique game full of surprises and weird moments. We hope the fun will overweigh the frustration, and that you will be happy that you overcame the struggles of playing it.</p>
    </div>

    <div id="Paris" class="tabcontent" style="padding-bottom:50px;">
      <p style="font-weight:bold">Minimum:</p>
      <ul style="padding-left:20px;">
        <li>OS: Windows 7, Windows 8.1, Windows 10 - 64 Bit</li>
        <li>Processor: 2.0 GHz</li>
        <li>Memory: 2 GB RAM</li>
        <li>Graphics: Intel HD 4000, GeForce 8800, ATI 1950 or better<li>
        <li>DirectX: Version 9.0</li>
        <li>Storage: 320 MB available space</li>
        <li>Sound Card: DirectX9.0 compatible sound card</li>
      </ul>
    </div>

    <div id="Tokyo" class="tabcontent" style="padding-bottom:50px;">
      <!-- <p>There are no reviews for this product.</p><br> -->
      

      <h4>Write Review</h4><br>

      
      <form>
      
      *Content <br>
      <textarea rows="4" cols="50"> </textarea><br>
      Note: Not support HTML! <br><br>

      Voted: <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>


      </form>
      <br>
      <button  type="button" class="btn btn-danger float-right" style="margin-right:20px">Continue</button>
    </div>

<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>

</div>