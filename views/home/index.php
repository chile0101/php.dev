
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
        url:     './models/addcart.php',
        data:    product,
        dataType: 'json',
        //alert(data);
        success: function(data) 
        {
        //alert(data);
        }   
        });
}

</script>
<div class="container">
    <div class="row">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                <img class="d-block w-100" src="assets/images/slides/slide1.png" alt="First slide">
                </div>
                <div class="carousel-item">
                <img class="d-block w-100" src="assets/images/slides/slide2.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                <img class="d-block w-100" src="assets/images/slides/slide3.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

        <h1 class="page-title">Shop</h1>
        <div class="shop-page">
        <p class="result-count">Showing 1-12 of 24 results</p>
        <form class="ordering" method="get">
            <select name="orderby" class="orderby">
            <option value="menu_order" selected='selected'>Default sorting</option>
            <option value="popularity">Sort by popularity</option>
            <option value="rating">Sort by average rating</option>
            <option value="date">Sort by newness</option>
            <option value="price">Sort by price: low to high</option>
            <option value="price-desc">Sort by price: high to low</option>
            </select>
        </form>
        <ul class="products">
        
        <?php foreach ($viewmodel as $product) : ?>
            <li class="item">
            <a href="<?php echo ROOT_URL; ?>home/detail/<?php echo $product['id']; ?>">
                <div class="item-image">
                <img width="230" height="230" src="<?php echo $product['image'];?> " alt="product">
                <span class="price">
                    <span class="amount"><?php echo $product['price']; ?> $</span>
                </span>
                </div>
            </a>
            <h3><?php echo $product['name']; ?></h3> 
            <div class="product-info">
                <form class="star-rate">
                <div class="stars">
                    <input type="radio" name="star" class="star-1" id="star-1" />
                    <label class="star-1" for="star-1">1</label>
                    <input type="radio" name="star" class="star-2" id="star-2" />
                    <label class="star-2" for="star-2">2</label>
                    <input type="radio" name="star" class="star-3" id="star-3" />
                    <label class="star-3" for="star-3">3</label>
                    <input type="radio" name="star" class="star-4" id="star-4" />
                    <label class="star-4" for="star-4">4</label>
                    <input type="radio" name="star" class="star-5" id="star-5" />
                    <label class="star-5" for="star-5">5</label>
                    <span></span>
                </div>
                </form>

                <p id="addCart" onclick="addCart(<?php echo $product['id']; ?>);" class="add-to-card"><img src="assets/images/icons/cart-icon.png" width="30" height="30"></p>
            </div>
            </li>
        <?php endforeach ?>
            
        </ul>
        </div>
        <div class="paging">
        <ul>
            <li>Prev</li>
            <li><a href="<?php echo ROOT_URL; ?>">1</a></li>
            <li><a href="<?php echo ROOT_URL; ?>?page=2">2</a></li>
            <li>3</li>
            <li>Next</li>
        </ul>
        </div>

</div>

