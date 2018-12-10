<?php

class CartModel extends Model{

	public function checkout(){

	}

	public function view(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
}
?>