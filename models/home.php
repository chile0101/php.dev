<?php
class HomeModel extends Model{
	public function Index(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC LIMIT 6');
		$rows = $this->resultSet();
		return $rows;
	}
	public function Shop($id){
		// $this->query('SELECT * FROM products ORDER BY create_at DESC');
		// $rows = $this->resultSet();
		// return $rows;
		if($id==""){
			$this->query('SELECT * FROM products ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}elseif($id=="action"){
			$this->query('SELECT * FROM products WHERE type_product_id= 1 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}elseif($id=="advanture"){
			$this->query('SELECT * FROM products WHERE type_product_id= 2 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}elseif($id=="casual"){
			$this->query('SELECT * FROM products WHERE type_product_id= 3 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}else{
			$this->query('SELECT * FROM products WHERE type_product_id= 4 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}
	}
	public function Contact(){
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		
		if($post['contact_us']){
			
			if($post['email']==""){
				return;
			}
			$this->query('INSERT INTO contact_us (name, email, subject, message) VALUES (:name, :email, :subject,:message)');
			$this->bind(':name', $post['name']);
			$this->bind(':email', $post['email']);
			$this->bind(':subject', $post['subject']);
			$this->bind(':message', $post['message']);

			$this->execute();
			// Verify
			if($this->lastInsertId()){
				header('Location: '.ROOT_URL);
			}
		}
		return;
	}
	public function Detail($id){
		$this->query('
		SELECT p.*,r.stars
		FROM products AS p JOIN ratings AS r
		ON p.id = r.product_id
		WHERE id = :id');
		$this->bind(':id',$id);
		$product=$this->single();


		


		return $product;
	}
	public function About(){
		return;
	}
}