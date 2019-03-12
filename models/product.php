<?php

class ProductModel extends Model{

	public function Index($id){
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
		}elseif($id=="indie"){
			$this->query('SELECT * FROM products WHERE type_product_id= 4 ORDER BY create_at DESC');
			$rows = $this->resultSet();
			return $rows;
		}

		else{
			echo "search";
		}
		
	}
	public function new(){

		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
	
		if($post['submit']){
			
			// validation
			// if(empty($post['name']) || empty($post['price']) || empty($post['code']) || empty($_FILES['image'])){
			// 	return;
			// }
		
	
		$this->query('INSERT INTO products (name, priceold,pricenew, code, description,link_origin,date_release,developer,link_trailer,image,type_product_id) VALUES(:name, :priceold,:pricenew, :code, :description,:link_origin,:date_release,:developer,:link_trailer,:image,:type_product_id)');
			$this->bind(':name', $post['name']);
			$this->bind(':priceold', $post['priceold']);
			$this->bind(':pricenew', $post['pricenew']);
			$this->bind(':code', $post['code']);
			$this->bind(':description', $post['description']);
			$this->bind(':link_origin',$post['link_origin']);
			$this->bind(':date_release',$post['date_release']);
			$this->bind(':developer',$post['developer']);
			$this->bind(':link_trailer',$post['link_trailer']);
			$this->bind(':image', $post['image']);
			$this->bind(':type_product_id', $post['type_product_id']);
			
			$this->execute();
			// Verify
			if($this->lastInsertId()){
				header('Location: '.ROOT_URL.'admin/products');
			}else{
				die('err');
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
		
			$this->query('	UPDATE products 
							SET name = :name, priceold = :priceold, pricenew=:pricenew, code=:code,description=:description,link_origin=:link_origin,date_release=:date_release,developer=:developer,link_trailer=:link_trailer,image=:image,type_product_id=:type_product_id,update_at=:update_at
							WHERE id = :id' );
		$this->bind(':id',$id);
		$this->bind(':name', $post['name']);
		$this->bind(':priceold', $post['priceold']);
		$this->bind(':pricenew', $post['pricenew']);
		$this->bind(':code', $post['code']);
		$this->bind(':description', $post['description']);
		$this->bind(':link_origin',$post['link_origin']);
		$this->bind(':date_release',$post['date_release']);
		$this->bind(':developer',$post['developer']);
		$this->bind(':link_trailer',$post['link_trailer']);
		$this->bind(':image', $post['image']);
		$this->bind(':type_product_id', $post['type_product_id']);
		$this->bind(':update_at',date ("Y-m-d H:i:s"));

		$this->execute();
			header('Location: '.ROOT_URL.'admin/products');
		}else{
			//die('err');
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