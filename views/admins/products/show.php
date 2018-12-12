<div class="container">
    <div class="row" style="margin-top:25px;">
        <div class="col-lg-4">
            <div class="card mx-auto" style="width: 18rem;">
                <img class="card-img-top" src="<?php echo  ROOT_PATH.$viewmodel['image']; ?>" alt="Card image cap">
                <div class="card-body">
                    <p class="card-text"></p>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
        <table class="table">
            <tbody>
                <tr>
                    <th scope="row">ID</th>
                    <td><?php echo $viewmodel['id']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Name</th>
                    <td><?php echo $viewmodel['name']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Code</th>
                    <td><?php echo $viewmodel['code']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Price</th>
                    <td><?php echo $viewmodel['price']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Type Gender</th>
                    <td><?php if($viewmodel['type_gender_id']==1){ echo 'Man'; }else{echo 'Woman';}
                    ?>
                    </td>
                </tr>
                <tr>
                    <th scope="row">Create at</th>
                    <td><?php echo $viewmodel['create_at']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Update at</th>
                    <td><?php echo $viewmodel['update_at']; ?></td>
                </tr>
                <tr>
                    <th scope="row">Description</th>
                    <td><?php echo $viewmodel['description']; ?></td>
                </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col-6">
                <a class="btn btn-success float-right" href="<?php echo ROOT_URL_ADMIN; ?>products/<?php echo $viewmodel['id']; ?>/edit">Update</a>
            </div>

           <div class="col-6">
                <a class="btn btn-danger" href="<?php echo ROOT_URL_ADMIN; ?>products">Back</a>
            </div>
        </div>
        
        
        </div>
    </div>
</div>