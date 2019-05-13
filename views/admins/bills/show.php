<?php 
  $order=$viewmodel[0];
  $user =$viewmodel[1];
  $orderitem = $viewmodel[2]
  $product=$viewmodel[3];

  print_r($orderitem);

?>
<div class="row">
  <div class='col'>
    <table class="table">
        <tbody>
            <tr>
                <th scope="row">ID</th>
                <td><?php echo $order['id']; ?></td>
            </tr>
            <tr>
                <th scope="row">Full name</th>
                <td><?php echo $user['fullname']; ?></td>
            </tr>
            <tr>
                <th scope="row">Email</th>
                <td><?php echo $user['email']; ?></td>
            </tr>
            <tr>
                <th scope="row">Address</th>
                <td><?php echo $user['address']; ?></td>
            </tr>
            <tr>
                <th scope="row">Phone</th>
                <td><?php echo $user['phone']; ?></td>
            </tr>
            <tr>
                <th scope="row">Name Product</th>
                <td><?php echo $product['name']; ?></td>
            </tr>
            <tr>
                <th scope="row">Code </th>
                <td><?php echo $product['code']; ?></td>
            </tr>

            <tr>
                <th scope="row">Price product </th>
                <td><?php echo $product['pricenew']; ?></td>
            </tr>

            <tr>
                <th scope="row">Status</th>
                <td></td>
            </tr>

            <tr>
                <th scope="row">Create at</th>
                <td><?php echo $order['create_at']; ?></td>
            </tr>
            <tr>
                <th scope="row">Update at</th>
                <td><?php echo $order['update_at']; ?></td>
            </tr>
        </tbody>
    </table>
</div>