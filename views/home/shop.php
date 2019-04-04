 

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
        url:     '../models/addcart.php',
        data:    product,
        dataType: 'json',
        
        success: function(data) 
        {   
            //alert(data);
            var mess = document.getElementById("alert");
            
           // mess.setAttribute("class", "alert alert-success");
            mess.classList.add("messagess");
            var p = document.createElement("p");
            p.setAttribute("id", "p_element");
            var t = document.createTextNode("Added products to cart");
            p.appendChild(t);
            mess.appendChild(p);
            setTimeout(function(){ 
                var element = document.getElementById("p_element");
                element.parentNode.removeChild(element);
                mess.classList.remove("messagess");
                
                 },2000);
                 
            
        }   
        });
    }
</script>
<div id="alert">
</div>

<div class="container">
    <div class="row" style="margin-top:20px; color:white;">
        <div class="col">
            <h1>Shop</h1>
            <p class="result-count">Showing 1-12 of 24 results</p>
            <br><br>
        </div>
       
        <div class="col">
    
            <div class="dropdown float-right" style="margin-top:20px;">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Type Product
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" style="width:70%" href="<?php echo ROOT_URL?>home/shop">All Products</a>
            <a class="dropdown-item" style="width:70%" href="<?php echo ROOT_URL ?>home/shop/action">Action</a>
            <a class="dropdown-item" style="width:70%" href="<?php echo ROOT_URL ?>home/shop/advanture">Advanture</a>
            <a class="dropdown-item" style="width:70%" href="<?php echo ROOT_URL ?>home/shop/casual">Casual</a>
            <a class="dropdown-item" style="width:70%" href="<?php echo ROOT_URL ?>home/shop/indie">Indie</a>
            </div>
        </div>
    </div>
    
    <div class="row">
    <ul class="products" >

    <?php foreach ($viewmodel as $product) : ?>
        <li class="item">
        <a href="<?php echo ROOT_URL; ?>home/detail/<?php echo $product['id']; ?>">
            <div class="item-image">
            <img width="230" height="230" src="<?php echo $product['image'] ?>" alt="product">
            <span class="price" >
                <span class="amount" style="background-color:green;"><?php echo $product['pricenew']; ?> $</span>
            </span>
            </div>
        </a>
        <h3 ><?php echo $product['name']; ?></h3> 
        <div class="product-info">
            <form class="star-rate"> 
            <div class="stars">
                <input type="radio" name="star" class="star-1" id="star-1" />
                <label class="star-1" for="star-1">1</label>
                <input type="radio" name="star" class="star-2" id="star-2" />
                <label class="star-2" for="star-2">2</label>
                <input type="radio" name="star" class="
                " id="star-3" />
                <label class="star-3" for="star-3">3</label>
                <input type="radio" name="star" class="star-4" id="star-4" />
                <label class="star-4" for="star-4">4</label>
                <input type="radio" name="star" class="star-5" id="star-5" />
                <label class="star-5" for="star-5">5</label>
                <span></span>
            </div>
            </form>

            <p id="addCart" onclick="addCart(<?php echo $product['id']; ?>);" class="add-to-card">
                <i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>
                <!-- <img src="php.dev/assets/images/icons/cart-icon.png"> -->
            </p>
        </div>
        </li>
    <?php endforeach ?>
        
    </ul>
    </div>
    </div>
    
</div>