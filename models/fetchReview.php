


<!-- // $this->query('SELECT * FROM reviews WHERE product_id = :product_id');
		$this->query('
		SELECT r.*
		FROM products AS p, reviews AS r
		ON p.id = r.product_id 
		WHERE id = :id
		');
		$this->bind(':product_id',$product['id']);
		$reviews = $this->single();
	

		// product,tongstars, reivew=array(username,stars,content,create_at,...) -->
