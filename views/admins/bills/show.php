<?php 
  $order=$viewmodel[0];
  $user =$viewmodel[1];
  $orderitems = $viewmodel[2];
  $products =$viewmodel[3];

  //print_r($orderitem);

?>


<div class="container">
    <div class="row">
        <div class="col-12">
    		<div class="invoice-title" style="margin-top: 20px;">
    			<h2>Order # <?php echo $order['id']; ?></h2>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					<?php echo $user['fullname']; ?><br>
    					<?php echo $user['email'] ;?><br>
    					<?php echo $user['phone'] ;?><br>
    					<?php echo $user['address'] ;?>
    				</address>
    			</div>
    			<div class="col-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
    					Jane Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					Visa ending **** 4242<br>
    					<?php echo $user['email'] ;?>
    				</address>
    			</div>
    			<div class="col-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					<?php echo $order['create_at'] ;?><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<?php foreach($products as $value=>$p): ?>
                                    <tr>
                                        <td><?php echo $p['name'];?> </td>
                                        <td class="text-center">$<?php echo $p['pricenew']; ?></td>
                                        <td class="text-center"><?php echo $orderitems[$value]['quantity']; ?></td>
                                        <td class="text-right">$<?php 
                                            $total = 1*$p['pricenew']*$orderitems[$value]['quantity']; 
                                            echo $total; ?></td>
                                    </tr>
                                <?php endforeach ?>


    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right">$670.99</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right">$15</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">$685.99</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>