<?php

class CartModel extends Model{

	public function checkout(){

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
				$product['quantity']=$value;
				$product['total_price']=$value*$product['price'];
				$total+=$product['total_price'];
				$products[$i]=$product;
				$i++;
			}
		}
		return [$products,$total];
	}
}
?>