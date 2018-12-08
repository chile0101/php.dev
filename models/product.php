<?php

class ProductModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM products ORDER BY create_at DESC');
		$rows = $this->resultSet();
		return $rows;
	}
	public function new(){

		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		if($post['submit']){
			
			if(empty($_POST['name']) || empty($_POST['price']) || empty($_POST['code']) || empty($_POST['image'])){
				return;
			}

			
			
			
			if($post['type_gender_id']==1){
				$img_url = ROOT_URL .'assets/images/products/man/'. $post['image'];				
			}else{
				$img_url = ROOT_URL .'/assets/images/products/woman/'. $post['image'];				
			}
			echo $post['name'];
			echo $post['price'];
			echo $post['code'];
			echo $post['description'];
			echo  $img_url;
			echo $post['type_gender_id'];
			
			$this->query('INSERT INTO products (name, price, code, description,image,type_gender_id) VALUES(:name, :price, :code, :description,:image,:type_gender_id)');
			$this->bind(':name', $post['name']);
			$this->bind(':price', $post['price']);
			$this->bind(':code', $post['code']);
			$this->bind(':description', $post['description']);
			$this->bind(':image', $img_url);
			$this->bind(':type_gender_id', $post['type_gender_id']);
			
			$this->execute();
			// Verify
			if($this->lastInsertId()){
				header('Location: '.ROOT_URL.'admin/products');
			}else{
				echo 'wtf';	
			}
		}
		return;
	}

	public function show($id){
		$this->query('SELECT * FROM products WHERE id = :id');
		$this->bind(':id',$id);
		$product=$this->single();
		return $product;

	}
	public function edit($id){

		$product = $this->show($id);
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		
		if($post['submit']){
				
			if(	empty($post['fullname']) || empty($post['phone']) || empty($post['address'])  || 
				!filter_var($post['email'], FILTER_VALIDATE_EMAIL)){
					return ;
			}
			$this->query('	UPDATE products 
							SET fullname = :fullname, email = :email, phone=:phone, address=:address
							WHERE id = :id' );

			$this->bind(':id',$id);
			$this->bind(':fullname', $post['fullname']);
			$this->bind(':email', $post['email']);
			$this->bind(':phone', $post['phone']);
			$this->bind(':address', $post['address']);

			$this->execute();
			header('Location: '.ROOT_URL.'admin/products');
		}
		return $product;
	}

	public function delete($id){
		
			$this->query('DELETE FROM products WHERE id = :id');
			$this->bind(':id', $id);
			$this->execute();
			header('Location: '.ROOT_URL.'admin/products');
	}

    
}
?>