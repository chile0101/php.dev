<div>
 
  <br>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">ID</th>
        
        <th scope="col">Status</th>
        <th scope="col">Create at</th>
        <th scope="col">Update at</th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($viewmodel as $bill) : ?>
      <tr>
        <th scope="row"><?php echo $bill['id']; ?></th>
       
        <td><?php if($bill['status'] == 1) {echo 'TO DO';}elseif($bill['status']==0){echo 'DONE';}else{echo 'DOING';}?></td>
      <td><?php echo $bill['create_at']; ?></td>
        <td><?php echo $bill['update_at']; ?></td>
        
        <td> <a  class="btn btn-success" href="<?php echo 'bills/'.$bill["id"]; ?>">Show</a> </td>
        <td><a  class="btn btn-warning" href="<?php echo 'bills/'.$bill["id"].'/edit'; ?>">Edit</a></td>
        <td><a  class="btn btn-danger" href="<?php echo 'bills/'.$bill["id"].'/delete'; ?>">Delete</a></td>
      </tr>
      <?php endforeach ?>
    </tbody>
  </table>
</div>