
<?php 
     $fullname=$email=$phone=$address=$password="";
    $fullnameErr=$emailErr=$phoneErr=$addressErr=$passwordErr=$passwordcfErr="";

    if(isset($_POST['submit'])){

        if(empty($_POST['fullname'])){
            $fullnameErr="Full name is required";
        }else{
            $fullname=$_POST['fullname'];
        }

        if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $emailErr="Email format is not valid";
        }else{
            $email=$_POST['email'];
        }
        
        if(empty($_POST['phone'])){
            $phoneErr="Phone number is required";
        }else{
            $phone=$_POST['phone'];
        }
      
        if(empty($_POST['address'])){
            $addressErr="Address is required";
        }else{
            $address=$_POST['address'];
        }
        
        if(empty($_POST['password'])){
            $passwordErr="Password is required";
        }else{
            $password=$_POST['password'];
        }
        
        if($_POST['password'] != $_POST['password_confirm']){
            $passwordcfErr="Password confirm not match";
        }
        
    }

?>


<div class="form-register">
    <form class="form-horizontal" id="form_user_register" name="form_user_register" action="<?php echo ROOT_URL; ?>admin/users/new" method="POST">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h2>New User</h2>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>Full Name</label>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                        <input type="text" name="fullname" class="form-control" 
                            value="<?php echo $fullname; ?>" placeholder="John Doe">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <small><?php echo $fullnameErr?></small>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>E-Mail Address</label>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <input type="text" name="email" class="form-control" 
                            value="<?php echo $email; ?>" placeholder="you@example.com">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">                   
                            <small><?php echo $emailErr?></small>           
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>Phone Number</label>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-phone" aria-hidden="true"></i></div>
                        <input type="text" name="phone" class="form-control" 
                            value="<?php echo $phone; ?>" placeholder="0169">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <small><?php echo $phoneErr?></small>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>Address</label>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                        <input type="text" name="address" class="form-control" 
                            value="<?php echo $address; ?>" placeholder="Ho Chi Minh City">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                        <small><?php echo $addressErr?></small>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>Password</label>
            </div>
            <div class="col-md-8">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <input type="password" name="password" class="form-control"
                            value="<?php echo $password; ?>"  placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <small><?php echo $passwordErr?></small>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label for="password">Confirm Password</label>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem">
                            <i class="fa fa-repeat"></i>
                        </div>
                        <input type="password" name="password_confirm" class="form-control"
                                id="password-confirm" placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <small><?php echo $passwordcfErr?></small>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <input class="btn btn-success" name="submit" type="submit" value=" Register "/>
            </div>
        </div>
    </form>

</div>

