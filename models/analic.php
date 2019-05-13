<?php

class AnalicModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM orderitems ');
        $rows = $this->resultSet();
        
        $num_product   =0;
        $num_order = count($rows); 
        $total_price=0;
        foreach($rows as $r){
            $num_product += $r['quantity'];

            $this->query('SELECT pricenew FROM products WHERE id = :id');
            $this->bind(':id',$r['product_id']);
            $product=$this->single();

            $total_price += $product['pricenew']* $r['quantity']*1;

         
        }

       
    
		
		return [$total_price,$num_order,$num_product];
	}

	

    
}
?>