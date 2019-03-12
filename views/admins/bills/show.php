<?php 
  $bill=$viewmodel[0];
  $user =$viewmodel[1];
  $product=$viewmodel[2];

?>
<div class="row">
  <div class='col'>
    <table class="table">
        <tbody>
            <tr>
                <th scope="row">ID</th>
                <td><?php echo $bill['id']; ?></td>
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
                <td><?php if($bill['status'] == 1) {echo 'TO DO';}elseif($bill['status']==0){echo 'DONE';}else{echo 'DOING';}?></td>
            </tr>

            <tr>
                <th scope="row">Create at</th>
                <td><?php echo $bill['create_at']; ?></td>
            </tr>
            <tr>
                <th scope="row">Update at</th>
                <td><?php echo $bill['update_at']; ?></td>
            </tr>
        </tbody>
    </table>
</div>