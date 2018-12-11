<?php
class HomeModel extends Model{
	public function Index(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC');
		$rows = $this->resultSet();
		// $_SESSION['cart']=true;
		// $_SESSION['cart_data']=array(
		// 	'id'='',

		// );
		return $rows;
	}
}