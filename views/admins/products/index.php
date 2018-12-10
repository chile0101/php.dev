<div class="container">
  <div class="row">
    <div class="col-6">
      <a href="<?php echo ROOT_URL_ADMIN ?>products/new" class="btn btn-primary btn-addUser">Add Product</a>
    </div>
    <div class="col-6">
      <div class="dropdown float-right" style="margin-top:20px;">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Type Gender
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" href="<?php echo ROOT_URL_ADMIN ?>products">All Products</a>
          <a class="dropdown-item" href="<?php echo ROOT_URL_ADMIN ?>products/man">Man</a>
          <a class="dropdown-item" href="<?php echo ROOT_URL_ADMIN ?>products/woman">Woman</a>
        </div>
        </div>
      </div>
  </div>
  
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

        <td> <a  class="btn btn-success" href="<?php echo ROOT_URL_ADMIN.'products/'.$product["id"]; ?>">Show</a> </td>
        <td><a  class="btn btn-warning" href="<?php echo ROOT_URL_ADMIN.'products/'.$product["id"].'/edit'; ?>">Edit</a></td>
        <td><a  class="btn btn-danger" href="<?php echo ROOT_URL_ADMIN.'products/'.$product["id"].'/delete'; ?>">Delete</a></td>
      </tr>
      <?php endforeach ?>
    </tbody>
  </table>
</div>