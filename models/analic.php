<?php

class AnalicModel extends Model{

	public function Index(){
		$this->query('SELECT * FROM orderitems ORDER BY create_at DESC');
        $rows = $this->resultSet();
        
        $num_product   =0;
        $num_order = count($rows); 
        foreach($row as $r){
            $num_product += $r['quantity'];
         
        }
		
		
		return [$rows,$num_order,$num_product];
	}

	

    
}
?>