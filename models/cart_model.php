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
					$to = "chilevan74@gmail.com";
					$subject = "Test Mail Subject";
					$body = "Hi<br/>Test Mail<br/>Amazon SES"; // HTML  tags
					Send_Mail($to,$subject,$body);
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