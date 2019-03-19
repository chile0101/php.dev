<?php

class CartModel extends Model{

	public function checkout(){

		if(!empty($_SESSION['cart'])){
	
			foreach ($_SESSION['cart'] as $key =>$value){
				 $this->query('SELECT * FROM products WHERE id=:id');
				 $this->bind(':id',$key);
				 $product=$this->single(); //Get product obj
		
				$this->query("INSERT INTO orders (user_id,product_id,quantity,status) VALUES (:user_id,:product_id,:quantity,:status)");
				$this->bind(':user_id',$_SESSION['user_data']['id']);
				$this->bind(':product_id',$key );
				$this->bind(':quantity',$value );
				$this->bind(':status',0);   // 1-> Chua xu ly
 
				$this->execute();
				if($this->lastInsertId()){
					//echo 'success';
					//require('Send_Mail.php');
					$mail = new PHPMailer\PHPMailer\PHPMailer();
					//$mail = new PHPMailer(); // create a new object
					$mail->IsSMTP(); // enable SMTP
					$mail->SMTPDebug = 1; // debugging: 1 = errors and messages, 2 = messages only
					$mail->SMTPAuth = true; // authentication enabled
					$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
					$mail->Host = "smtp.gmail.com";
					$mail->Port = 465; // or 587
					$mail->IsHTML(true);
					$mail->Username = "anphawolf@gmail.com";
					$mail->Password = "anphawolf@%)$1997";
					$mail->SetFrom("anphawolf@gmail.com");
					$mail->Subject = "Test";
					$mail->Body = "hello";
					$mail->AddAddress("chilevan74@gmail.com");

					if(!$mail->Send()) {
						echo "Mailer Error: " . $mail->ErrorInfo;
					} else {
						echo "Message has been sent";
					}
					
					//sleep(3);
					//die('die');
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