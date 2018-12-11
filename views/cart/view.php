<script type="text/javascript">
 function deleteItem(id){
     //alert('chile');
	 product={
        'id': id
    };
    $.ajax(
        {     
        type:    'post',
        url:     '../models/deleteItem.php',
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
		<h3 class="ty-cart">Cart</h3>
	</div>
	<hr>
	<?php if (true) : ?>
		<div class="row form-content">
			<form class="list-cart-content col-md-11">
				<table class="table cart">
					<thead class="thead-light">
						<th scope="col"></th>
						<th scope="col">Image</th>
					    <th scope="col">Name</th>
					    <th scope="col">Quantity</th>
					    <th scope="col">Price</th>
					</thead>
					<tbody>
						<?php foreach ($viewmodel[0] as $product) : ?>
							<tr>
								<td class="product-remove"><a href="" onclick="deleteItem(<?php echo $product['id'] ; ?>)"  class="remove">x</a></td>
		      					<td><img width="100" height="100" src="<?php echo ROOT_PATH.$product['image'];?> " alt="product"></td>
						      	<td><?php echo $product['name'];?></td>
						      	<td><?php echo $product['quantity'] ?></td>
						      	<td><?php echo $product['total_price'];?>$	</td>
							</tr>
					     <?php endforeach ?>
					     <tr>
					     	<td colspan="6" class="actions">
						     	<div class="coupon">
						     		<input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code">
						     		<button type="submit" class="btn btn-outline-secondary" name="apply_coupon">Apply coupon</button>
					     			<button type="submit" class="btn btn-primary" name="update_cart">Update cart</button>
						     	</div>
					     	</td>
					     </tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="cart-totals">
			<div class="row"><h4>Cart totals</h4></div>
			<div class="row">
				<table class="table">
					<tbody>
						<tr>
							<th>Total</th>
							<td data-title="Total">
								<strong><span class="woocommerce-Price-amount amount"><?php echo $viewmodel[1] ?> $</span></strong>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row"><a href="<?php echo ROOT_URL; ?>cart/checkout" class="btn btn-primary">PROCEED TO CHECKOUT</a></div>
		</div>
	<?php else : ?>
		<div class="ty-ret-to-shop">
			<p>Your cart is currently empty.</p><br>
			<a class="btn btn-dark" href="<?php echo ROOT_URL; ?>home/shop">RETURN TO SHOP</a>
		</div>
	<?php endif ?>
</div>