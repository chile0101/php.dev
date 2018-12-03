<?php
class AdminModel extends Model{
	
	public function login(){
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		if($post['submit']){

			if(empty($post['email']) || empty($post['password'] )){
				return;
			}
			$this->query('SELECT * FROM admins WHERE email = :email AND password = :password');
			$this->bind(':email', $post['email']);
			$this->bind(':password', $post['password']);
			
			$row = $this->single();

			if($row){
				$_SESSION['admin_logged_in'] = true;
				$_SESSION['admin_data'] = array(
					"id"	=> $row['id'],
					"email"	=> $row['email']
				);
				header('Location: '.ROOT_URL.'users'); 
			}else {
				Messages::setMsg('Email or Password invalid', 'error');
			}
			return;
		}
	}

	public function logout(){
		unset($_SESSION['admin_logged_in']);
		unset($_SESSION['admin_data']);
		session_destroy();
		header('Location: '.ROOT_URL.'admins/login');
	}
}