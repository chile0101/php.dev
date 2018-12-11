
<script type="text/javascript">
    function addCart(id){
          //alert(id///.p);
        product={
            'id': id,
            'quantity':1
        };
        $.ajax({     
            type:    'post',
            url:     './models/addcart.php',
            data:    product,
            dataType: 'json',
            //alert(data);
            success: function(data){
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

    <br><br>
    <div class="row">
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

                <p id="addCart" onclick="addCart(<?php echo $product['id']; ?>);" class="add-to-card"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></p>
            </div>
            </li>
            <?php endforeach ?>
        </ul>
    </div>
    <div class="row ty-see-product">
        <a class="btn btn-dark" href="<?php echo ROOT_URL; ?>home/shop">SEE ALL PRODUCTS</a>
    </div>
</div>


