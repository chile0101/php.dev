<?php

class UserModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM users ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
	public function new(){


		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		$password = md5($post['password']);
		if($post['submit']){
			if(	empty($post['fullname']) || empty($post['phone'])		|| 
				empty($post['address'])  || empty($post['password'])	||
				!filter_var($post['email'], FILTER_VALIDATE_EMAIL)		||
				$post['password_confirm'] != $post['password']){
					return ;
			}
			// Insert into MySQL
			$this->query('INSERT INTO users (fullname, email, phone, address,password) VALUES(:fullname, :email, :phone, :address,:password)');
			$this->bind(':fullname', $post['fullname']);
			$this->bind(':email', $post['email']);
			$this->bind(':phone', $post['phone']);
			$this->bind(':address', $post['address']);
			$this->bind(':password', $password);

			$this->execute();
			// Verify
			if($this->lastInsertId()){
				header('Location: '.ROOT_URL.'admin/users');
			}
		}
		return;
	}

	public function show($id){
		$this->query('SELECT * FROM users WHERE id = :id');
		$this->bind(':id',$id);
		$user=$this->single();
		return $user;

	}
	public function edit($id){

		$user = $this->show($id);
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		
		if($post['submit']){

			if(	empty($post['fullname']) || empty($post['phone']) || empty($post['address'])  || 
				!filter_var($post['email'], FILTER_VALIDATE_EMAIL)){
					return ;
			}
			$this->query('	UPDATE users 
							SET fullname = :fullname, email = :email, phone=:phone, address=:address
							WHERE id = :id' );

			$this->bind(':id',$id);
			$this->bind(':fullname', $post['fullname']);
			$this->bind(':email', $post['email']);
			$this->bind(':phone', $post['phone']);
			$this->bind(':address', $post['address']);

			$this->execute();
			header('Location: '.ROOT_URL.'admin/users');
		}
		return $user;
	}

	public function delete($id){
		
			$this->query('DELETE FROM users WHERE id = :id');
			$this->bind(':id', $id);
			$this->execute();
			header('Location: '.ROOT_URL.'admin/users');
	}

    
}
?>