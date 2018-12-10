<div class="container">
	<div class="row form-content">
		<form class="list-cart-content col-md-11">
			<table class="table cart">
				<thead class="thead-light">
					<th scope="col">#</th>
					<th scope="col">Image</th>
				    <th scope="col">Name</th>
				    <th scope="col">Quantity</th>
				    <th scope="col">Price</th>
				</thead>
				<tbody>
					<?php foreach ($viewmodel as $product) : ?>
						<tr>
							<td class="product-remove"><a href="" class="remove">x</a></td>
	      					<td><img width="100" height="100" src="<?php echo $product['image'];?> " alt="product"></td>
					      	<td><?php echo $product['name'];?></td>
					      	<td><input type="number" name="quantity" style="width:30px; text-align: center;" placeholder="1"></td>
					      	<td><?php echo $product['price'];?>$	</td>
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
						<th>Subtotal</th>
						<td data-title="Subtotal">
							<span class="woocommerce-Price-amount amount">$</span>
						</td>
					</tr>
					<tr>
						<th>Total</th>
						<td data-title="Total">
							<strong><span class="woocommerce-Price-amount amount">$</span></strong>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row"><a href="<?php echo ROOT_URL; ?>cart/checkout" class="btn btn-primary">PROCEED TO CHECKOUT</a></div>
	</div>
</div>