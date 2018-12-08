<div>
  <a href="<?php echo ROOT_URL_ADMIN ?>products/new" class="btn btn-primary btn-addUser">Add Product</a>
  <br>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Code</th>
        <th scope="col">Price</th>
        <th scope="col">Create at</th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($viewmodel as $product) : ?>
      <tr>
        <th scope="row"><?php echo $product['id']; ?></th>
        <td><?php echo $product['name']; ?></td>
        <td><?php echo $product['code']; ?></td>
        <td><?php echo $product['price']; ?></td>
        <td><?php echo $product['create_at']; ?></td>

        
        <td> <a  class="btn btn-success" href="<?php echo 'products/'.$product["id"]; ?>">Show</a> </td>
        <td><a  class="btn btn-warning" href="<?php echo 'products/'.$product["id"].'/edit'; ?>">Edit</a></td>
        <td><a  class="btn btn-danger" href="<?php echo 'products/'.$product["id"].'/delete'; ?>">Delete</a></td>
      </tr>
      <?php endforeach ?>
    </tbody>
  </table>
</div>