<?php
class AuthModel extends Model{
	public function register(){
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$password = md5($post['password']);

		if($post['submit']){
			if($post['fullname'] == '' || $post['email'] == '' || $post['password'] == ''){
				return;
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
		session_destroy();
		header('Location: '.ROOT_URL);
	}
}