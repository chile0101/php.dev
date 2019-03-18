<?php

class CartModel extends Model{

	public function checkout(){


		if(!empty($_SESSION['cart'])){
	
			foreach ($_SESSION['cart'] as $key =>$value){
				// $this->query('SELECT * FROM products WHERE id=:id');
				// $this->bind(':id',$key);
				// $product=$this->single(); //Get product obj
		
				$this->query("INSERT INTO orders (user_id,product_id,quantity,status) VALUES (:user_id,:product_id,:quantity,:status)");
				$this->bind(':user_id',$_SESSION['user_data']['id']);
				$this->bind(':product_id',$key );
				$this->bind(':quantity',$value );
				$this->bind(':status',1);   // 1-> Chua xu ly
 
				$this->execute();
				if($this->lastInsertId()){
					//echo 'success';
					require 'Send_Mail.php';
					$to = "anphawolf@gmail.com";
					$subject = "Test Mail Subject";
					$body ="
					<html>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

					<body>
					<a href="https://store.steampowered.com/account/newaccountverification?stoken=a1278144ef4ba366df309f5c2a39e42ac2342d37d24428b5ab6fd2836bf185b7f5424b68dd4c81293ad8d16934c57695&creationid=5082360689227967975" style="border-radius: 2px; padding: 1px; display: block; text-decoration: none; color: #D2E885; background: #799905; background: -webkit-linear-gradient( top, #799905 5%, #536904 95%);background: linear-gradient( to bottom, #799905 5%, #536904 95%);text-shadow: -1px -1px 0px rgba( 0, 0, 0, 0.1 );" >

					</body>
					</html>
					"; 
					// HTML  tags




					
					Send_Mail($to,$subject,$body);
					die('die');
				}else{
					echo 'err';
				}
				
			}
				
			}
		unset($_SESSION['cart']);
		return;

	}

	public function view(){
		//$this->query('SELECT * FROM products ORDER BY create_at DESC');
		//$rows = $this->resultSet();
		$products=array();
		$total=0;
		if(!empty($_SESSION['cart'])){
			$i=0;
			foreach ($_SESSION['cart'] as $key =>$value){
				$this->query('SELECT * FROM products WHERE id=:id');
				$this->bind(':id',$key);
				$product=$this->single();
			
				//echo $value * $product['pricenew'];
				
				$product['quantity'] = $value;
				//echo $product['quantity'];
				$product['total_product']  = $product['quantity'] * $product['pricenew'];
			//	echo  $value * $product['pricenew'];
		//	print_r($product);
				$total+= $product['total_product'];
				$products[$i]=$product;
				$i++;
			}
		}
		return [$products,$total];
	}
}
?>