<?php

class BillModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM orders ORDER BY create_at DESC');
		$rows = $this->resultSet();
		
		
			

		return $rows;
	}

	public function show($id){
		$this->query('SELECT * FROM orders WHERE id = :id');
		$this->bind(':id',$id);
		$order=$this->single();

		$this->query('SELECT fullname,email,address,phone FROM users WHERE id = :id');
		$this->bind(':id',$order['user_id']);
		$user=$this->single();

		$this->query('SELECT * FROM orderitems WHERE order_id = :order_id');
		$this->bind(':order_id',$order['id']);
		$orderitems = $this->resultSet();

		print_r($orderitems);

		$product = array();

		foreach ($orderitems as $key => $item ){
			$this->query('SELECT * FROM products WHERE id = :id');
			$this->bind(':id',$item['product_id']);
			$product[$key] = $this->single();
		}

		

		return [$order,$user,$orderitems,$product];

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