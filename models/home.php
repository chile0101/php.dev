<?php
class HomeModel extends Model{
	public function Index(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
}