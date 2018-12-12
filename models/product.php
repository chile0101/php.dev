<?php

class ProductModel extends Model{

	public function Index($id){
		if($id==""){
			$this->query('SELECT * FROM products ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}elseif($id=="man"){
			$this->query('SELECT * FROM products WHERE type_gender_id= 1 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}elseif($id=="woman"){
			$this->query('SELECT * FROM products WHERE type_gender_id= 2 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}else{
			echo "search";
		}
		
	}
	public function new(){

		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
	
		if($post['submit']){
			
			// validation
			if(empty($post['name']) || empty($post['price']) || empty($post['code']) || empty($_FILES['image'])){
				return;
			}

			$uploads_dir = 'assets/images/products/';

			if($post['type_gender_id']==1){
				$img_url = $uploads_dir .'man/'. basename($_FILES['image']['name']);
				if(move_uploaded_file($_FILES['image']['tmp_name'],$img_url )){
					echo 'ok';
				}else{
					die('Image not upload');
				}
								
			}else{
				$img_url =  $uploads_dir. "woman/" . $post['image'];		
				move_uploaded_file ($post['image'] , $uploads_dir."woman" );				

			}	
			
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
				
			if(empty($_POST['name']) || empty($_POST['price']) || empty($_POST['code']) || empty($_POST['image'])){
				return;
			}

			if($post['type_gender_id']==1){
				$img_url = ROOT_URL .'assets/images/products/man/'. $post['image'];				
			}else{
				$img_url = ROOT_URL .'/assets/images/products/woman/'. $post['image'];				
			}

			$this->query('INSERT INTO products (name, price, code, description,image,type_gender_id) VALUES(:name, :price, :code, :description,:image,:type_gender_id)');
			$this->bind(':name', $post['name']);
			$this->bind(':price', $post['price']);
			$this->bind(':code', $post['code']);
			$this->bind(':description', $post['description']);
			$this->bind(':image', $img_url);
			$this->bind(':type_gender_id', $post['type_gender_id']);

			$this->execute();
			header('Location: '.ROOT_URL.'admin/products');
		}
		return $product;
	}

	public function delete($id){
			$this->query('SELECT * FROM products WHERE id = :id');
			$this->bind(':id',$id);
			$product=$this->single();
			unlink($product['image']);
		
			$this->query('DELETE FROM products WHERE id = :id');
			$this->bind(':id', $id);
			$this->execute();

			header('Location: '.ROOT_URL.'admin/products');
	}
    
}
?>