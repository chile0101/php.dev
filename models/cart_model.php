<?php

class CartModel extends Model{
	public function sentMail($to,$subject,$body){
		$mail = new PHPMailer\PHPMailer\PHPMailer();
	
		$mail->IsSMTP(); // enable SMTP
		$mail->SMTPDebug = 0; // debugging: 1 = errors and messages, 2 = messages only
		$mail->SMTPAuth = true; // authentication enabled
		$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
		$mail->Host = "smtp.gmail.com";
		$mail->Port = 465; // or 587
		$mail->IsHTML(true);
		$mail->Username = "anphawolf@gmail.com";
		$mail->Password = "anphawolf@%)$1997";
		$mail->SetFrom("anphawolf@gmail.com","HTC Store");
		
		$mail->Subject = $subject;
		$mail->Body = $body;
		$mail->AddAddress($to);

		if(!$mail->Send()) {
			echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
			//echo "Message has been sent";
			return true;
		}
	}

	public function generateCode(){
		$code = array("2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z");
	
		$RndCode = "";
		for($x=0;$x<5;$x++){
		$z = rand(0,31);
		$RndCode .= $code[$z];
		}
		$RndCode .="-";

		for($x=0;$x<5;$x++){
		$z = rand(0,31);
		$RndCode .= $code[$z];
		}
		$RndCode .="-";
		for($x=0;$x<3;$x++){
		$z = rand(0,31);
		$RndCode .= $code[$z];
		}

		return $RndCode;
	}

	public function checkout(){
		
		if(!empty($_SESSION['cart'])){
			
			$this -> query('INSERT INTO orders(user_id) VALUES (:user_id)');
			$this ->bind(':user_id',$_SESSION['user_data']['id']);
		
			$this->execute();
			$order_id = $this->lastInsertId();
			echo $order_id;
			

			foreach ($_SESSION['cart'] as $key =>$value){

				$this->query('SELECT * FROM products WHERE id=:id');
				$this->bind(':id',$key);
				$product=$this->single(); //Get product obj

				$this->query('INSERT INTO orderitems(order_id,product_id,quantity) VALUES (:order_id,:product_id,:quatity)');
				$this->bind(':order_id',$order_id);
				$this->bind(':product_id',$key);
				$this->bind(':quantity',$value);
				$this->execute();  		// Luu vao database
			
				$this->execute();
				if($this->lastInsertId()){
					$to = $_SESSION['user_data']['email'];
					$subject = $product['name']." Steam Code"; 
					
					$body ="
					<html>
						<head>
							<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
							<title></title>
							<style media=\"all\" type=\"text/css\">
								td, p, h1, h3, a {
									font-family: Helvetica, Arial, sans-serif;
								}
							</style>

						</head>
						<body bgcolor=\"\" LINK=\"#6d93b8\" ALINK=\"#9DB7D0\" VLINK=\"#6d93b8\" TEXT=\"#d7d7d7\" style=\"font-family: Helvetica, Arial, sans-serif; font-size: 14px; color: #d7d7d7;\">
						<table style=\"width: 538px; background-color: #393836;\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\">
							<tr>
								<td style=\" height: 65px; background-color: #000000; border-bottom: 1px solid #4d4b48;\">
									<img src=\"https://steamstore-a.akamaihd.net/public/shared/images/header/globalheader_logo.png\" height=\"44\" border=\"0\" >
								</td>
							</tr>
							<tr>
								<td bgcolor=\"#17212e\">
									<table width=\"470\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px;\">
						
										<tr>
											<td style=\"padding-top: 32px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">
												Hello ".$_SESSION['user_data']['fullname'].",					</td>
										</tr>
										<tr>
											<td style=\"padding-top: 10px; padding-bottom: 30px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif;\">
												This is Steam code for ".$product['name']." !					</td>
										</tr>
											";

									for($x=0;$x<$value;$x++){
										$body.="
										<tr>
										<td style=\"padding: 16px; background-color:#121a25;\">
											<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">
												<tr>
																						<td style=\"background: #799905;height: 32px;text-align: center\" align=\"center\" >
															<a  style=\"border-radius: 2px; padding: 1px; display: block; text-decoration: none; color: #D2E885; background: #799905; background: -webkit-linear-gradient( top, #799905 5%, #536904 95%);background: linear-gradient( to bottom, #799905 5%, #536904 95%);text-shadow: -1px -1px 0px rgba( 0, 0, 0, 0.1 );\" >
															<span style=\"border-radius: 2px; display: block; padding: 0; font-size: 20px; line-height: 32px; \">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$this->generateCode()."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</span>
															</a>
														</td>
																				</tr>
											</table>
										</td>
									</tr>
										
										";
									}
										
									$body .="
									
									<tr>
										<td style=\"padding-top: 16px; font-size: 12px; line-height: 17px; color: #6d7880;\">
										Thank you for your order.					</td>
											</tr>
											</table>
									</td>
							</tr>
							<tr style=\"background-color: #000000;\">
								<td style=\"padding: 12px 24px;\">
									<table cellpadding=\"0\" cellspacing=\"0\">
										<tr>
											<td width=\"92\">
												<img src=\"https://steamstore-a.akamaihd.net/public/images/logo_valve_footer.jpg\" width=\"92\" height=\"26\" alt=\"Valve&reg;\">
											</td>
											<td style=\" font-size: 11px; color: #595959; padding-left: 12px;\">
												© Valve Corporation.  PO Box 1688 Bellevue, WA 98009.<br>
												All rights reserved. All trademarks are property of their respective owners in the US and other countries.					</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
						</body>
						
					</html>
									";										
					$this->sentMail($to,$subject,$body);
					
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