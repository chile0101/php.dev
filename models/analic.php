<?php

class AnalicModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM orderitems ');
        $rows = $this->resultSet();
        
        $num_product   =0;
        $num_order = count($rows); 
        foreach($rows as $r){
            $num_product += $r['quantity'];
         
        }
    
		
		return [$rows,$num_order,$num_product];
	}

	

    
}
?>