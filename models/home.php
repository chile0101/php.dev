<?php
class HomeModel extends Model{
	public function Index(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
	public function Contact(){
		return;
	}
	public function Detail($id){
		$this->query('SELECT * FROM products WHERE id = :id');
		$this->bind(':id',$id);
		$product=$this->single();
		return $product;
	}
}