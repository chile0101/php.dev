<div>
  <a href="<?php echo ROOT_PATH ?>users/new" class="btn btn-primary btn-addUser">Add User</a>
  <br>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Email</th>
        <th scope="col">Full name</th>
        <th scope="col">Phone</th>
        <th scope="col">Address</th>
        <th scope="col">Create at</th>
        <th scope="col">Update at</th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($viewmodel as $user) : ?>
      <tr>
        <th scope="row"><?php echo $user['id']; ?></th>
        <td><?php echo $user['email']; ?></td>
        <td><?php echo $user['fullname']; ?></td>
        <td><?php echo $user['phone']; ?></td>
        <td><?php echo $user['address']; ?></td>
        <td><?php echo $user['create_at']; ?></td>
        <td><?php echo $user['update_at']; ?></td>
        <td><?php  ?><button class="btn btn-success">View</button></td>
        <td><?php  ?><button class="btn btn-warning">Edit</button></td>
        <td><?php  ?><button class="btn btn-danger">Detele</button></td>
      </tr>
      <?php endforeach ?>
    </tbody>
  </table>
</div>