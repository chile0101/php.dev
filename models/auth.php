<?php
class AuthModel extends Model{
	public function register(){
		
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$password = md5($post['password']);

		if($post['register']){
			
			if(	empty($post['fullname']) || empty($post['phone'])		|| 
				empty($post['address'])  || empty($post['password'])	||
				!filter_var($post['email'], FILTER_VALIDATE_EMAIL)		||
				$post['password_confirm'] != $post['password']){
					return ;
			}
			
			// Insert into MySQL
			$this->query('INSERT INTO users (fullname, email, password,address,phone) VALUES(:fullname, :email, :password,:address,:phone)');
			$this->bind(':fullname', $post['fullname']);
			$this->bind(':email', $post['email']);
			$this->bind(':password', $password);
			$this->bind(':address', $post['address']);
			$this->bind(':phone', $post['phone']);
			$this->execute();
			// Verify
			if($this->lastInsertId()){
				// Redirect
				header('Location: '.ROOT_URL.'auth/login');
			}
		}
		return;
	}

	public function login(){
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$password = md5($post['password']);

		if($post['submit']){

			if($post['email']=='' || $post['password']==''){
				return;
			}

			$this->query('SELECT * FROM users WHERE email = :email AND password = :password');
			$this->bind(':email', $post['email']);
			$this->bind(':password', $password);
			
			$row = $this->single();

			if($row){
				$_SESSION['user_logged_in'] = true;
				$_SESSION['user_data'] = array(
					"id"	=> $row['id'],
					"fullname"	=> $row['fullname'],
					"email"	=> $row['email']
				);
				header('Location: '.ROOT_URL);
			} else {
				return "Email or Password is in invalid";
			}
		}
		return;
	}

	public function logout(){
		unset($_SESSION['user_logged_in']);
		unset($_SESSION['user_data']);
		//session_destroy();
		header('Location: '.ROOT_URL);
	}


	public function profile($id){
		
		$this->query('SELECT * FROM users WHERE id = :id');
		$this->bind(':id',$id);
		$user=$this->single();
		
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
			$_SESSION['user_data']['fullname']=$post['fullname'];
			$_SESSION['user_data']['email']=$post['email'];

			header('Location: '.ROOT_URL.'');
		}
		return $user;
	}

	}

