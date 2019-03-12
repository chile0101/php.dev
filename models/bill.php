<?php

class BillModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM orders ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
	// public function new(){


	// 	$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
	// 	$password = md5($post['password']);
	// 	if($post['submit']){
	// 		if(	empty($post['fullname']) || empty($post['phone'])		|| 
	// 			empty($post['address'])  || empty($post['password'])	||
	// 			!filter_var($post['email'], FILTER_VALIDATE_EMAIL)		||
	// 			$post['password_confirm'] != $post['password']){
	// 				return ;
	// 		}
	// 		// Insert into MySQL
	// 		$this->query('INSERT INTO users (fullname, email, phone, address,password) VALUES(:fullname, :email, :phone, :address,:password)');
	// 		$this->bind(':fullname', $post['fullname']);
	// 		$this->bind(':email', $post['email']);
	// 		$this->bind(':phone', $post['phone']);
	// 		$this->bind(':address', $post['address']);
	// 		$this->bind(':password', $password);

	// 		$this->execute();
	// 		// Verify
	// 		if($this->lastInsertId()){
	// 			header('Location: '.ROOT_URL.'admin/users');
	// 		}
	// 	}
	// 	return;
	// }

	public function show($id){
		$this->query('SELECT * FROM orders WHERE id = :id');
		$this->bind(':id',$id);
		$bill=$this->single();

		$this->query('SELECT * FROM users WHERE id = :id');
		$this->bind(':id',$bill['user_id']);
		$user=$this->single();

		$this->query('SELECT * FROM products WHERE id = :id');
		$this->bind(':id',$bill['product_id']);
		$product=$this->single();

		return [$bill,$user,$product];

	}
	public function edit($id){

		$bill = $this->show($id);
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		
		if($post['submit']){

			$this->query('	UPDATE orders 
							SET status=:status ,update_at=:update_at
							WHERE id = :id' );

			$this->bind(':id',$id);
			$this->bind(':status', $post['status']);
			$this->bind(':update_at',date ("Y-m-d H:i:s"));

			$this->execute();
			header('Location: '.ROOT_URL.'admin/bills');
		}
		return $bill;
	}

	public function delete($id){
		
			$this->query('DELETE FROM orders WHERE id = :id');
			$this->bind(':id', $id);
			$this->execute();
			header('Location: '.ROOT_URL.'admin/bills');
	}

    
}
?>