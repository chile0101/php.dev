<div>
 
  <br>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">Total Order</th>
        
        <th scope="col">Total Products</th>
        
        <th scope="col">Total Price ($)</th>

        <th scope="col">Total Price (VND)</th>

        <th scope="col">Date</th>

     
      </tr>
    </thead>
    <tbody>
     
      <tr>
       
       
        <td><a  class="btn btn-success" href=""><?php echo $viewmodel[1]; ?></a></td>
        <td><a  class="btn btn-success" href=""><?php echo $viewmodel[2]; ?></td>
        <td><a  class="btn btn-success" href="">$&nbsp; <?php echo $viewmodel[0]; ?></td>
        <td><a  class="btn btn-success" href=""><?php echo  round($viewmodel[0]*1.0*23346, 0);   ; ?> &nbsp;VND</td>
        <td> <a  class="btn btn-success" href=""><?php

           date_default_timezone_set('Asia/Ho_Chi_Minh');
           echo date("Y/m/d H:i:s") ;   
        
        ?></a> </td>
       
      </tr>
    
    </tbody>
  </table>
</div>