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
					$mail = new PHPMailer(true);
					try {
						//Server settings
						$mail->SMTPDebug = 2;                                       // Enable verbose debug output
						$mail->isSMTP();                                            // Set mailer to use SMTP
						$mail->Host       = 'tls://smtp.gmail.com';  // Specify main and backup SMTP servers
						$mail->SMTPAuth   = true;                                   // Enable SMTP authentication
						$mail->Username   = 'anphawolf@gmail.com';                     // SMTP username
						$mail->Password   = 'anphawolf@%)$1997';                               // SMTP password
						$mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
						$mail->Port       = 587;                                    // TCP port to connect to
					
						//Recipients
						$mail->setFrom('anphawolf@gmail.com', 'HTCstore');
						//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
						$mail->addAddress('levanchi74@gmail.com');               // Name is optional
						//$mail->addReplyTo('info@example.com', 'Information');
					
					
						// Attachments
						//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
						//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
					
						// Content
						$mail->isHTML(true);                                  // Set email format to HTML
						$mail->Subject = 'Here is the subject';
						$mail->Body    = 'This is the HTML message body <b>in bold!</b>';
						$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
					
						$mail->send();
						echo 'Message has been sent';
					} catch (Exception $e) {
						echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
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