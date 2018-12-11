
<script type="text/javascript">
 function addCart(id){
    var quantity= document.getElementById("quantity").value;
    product={
        'id': id,
        'quantity':quantity
    };
    $.ajax(
        {     
        type:    'post',
        url:     '../../models/addcart.php',
        data:    product,
        dataType: 'json',
        success: function(data) 
        {
        //alert(data);
        }   
        });
}
</script>
<div class="container detail">
  <div class="main row">
    <div class="col-md-6 col-xs-12">
      <div class="row img-detail">
        <img src="<?php echo  ROOT_PATH.$viewmodel['image']; ?>" alt="image product detail">
      </div>
      <div class="row img-detail-small">
        <div class="col-xs-5"><img src="<?php echo  ROOT_PATH.$viewmodel['image']; ?>" alt="image product detail"></div>
        <div class="col-xs-5"><img src="<?php echo  ROOT_PATH.$viewmodel['image']; ?>" alt="image product detail"></div>
      </div>
    </div>

    <div class="col-md-4 col-xs-12">
      <div class="conten-detail">
        <h2 class="fontweight"><?php echo $viewmodel['name']; ?></h2>
        <h2 class="dolla">$<?php echo $viewmodel['price']; ?></h2>
        <div class="ty-tabs"><p>Description</p></div>
        <div class="ty-des"><p><?php echo $viewmodel['description']; ?></p></div>
        <div class="ty-field-group">
          <label class="type-label">CODE:</label>
          <span class="type-item"><?php echo $viewmodel['code']; ?></span>
        </div>
        <div class="ty-field-group">
          <label class="type-label">Availability:</label>
          <span class="ty-in-stock">In Stock</span>
        </div>
        <div class="ty-field-group">
          <label class="type-label">Quantity:</label>
          <input type="number" id="quantity" style="width:30px; text-align: center;" value="1" min="1">
        </div>
        <div class="ty-button">
          <button type="submit" onclick="addCart(<?php echo $viewmodel['id']; ?>);" class="btn btn-primary">
            ADD TO CART
          </button>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <h2>Related products</h2>
  </div>
</div>