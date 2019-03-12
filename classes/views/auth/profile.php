<?php 

    $fullnameErr=$emailErr=$phoneErr=$addressErr=$passwordErr=$passwordcfErr="";
    
    if(isset($_POST['submit'])){

        if(empty($_POST['fullname'])){
            $fullnameErr="Full name is required";
        }

        if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $emailErr="Email format is not valid";
        }
        
        if(empty($_POST['phone'])){
            $phoneErr="Phone number is required";
        }
      
        if(empty($_POST['address'])){
            $addressErr="Address is required";
        }
    }

?>

<div class="form-register container" style="margin:50px auto;">
    <form class="form-horizontal" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>">
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
                            value="<?php echo $viewmodel['fullname']; ?>" placeholder="John Doe">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <?php if(!empty($fullnameErr)): ?>
                                <i class="fa fa-close"> <?php echo $fullnameErr ; ?></i>
                            <?php endif ?>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>E-Mail Address</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <input type="text" name="email" class="form-control" 
                            value="<?php echo $viewmodel['email']; ?>" placeholder="you@example.com">
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">                   
                            <?php if(!empty($emailErr)): ?>
                                <i class="fa fa-close"> <?php echo $emailErr ; ?></i>
                            <?php endif ?>                         
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
                            value="<?php echo $viewmodel['phone']; ?>" placeholder="0169">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <?php if(!empty($phoneErr)): ?>
                                <i class="fa fa-close"> <?php echo $phoneErr ; ?></i>
                            <?php endif ?>
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
                            value="<?php echo $viewmodel['address']; ?>" placeholder="Ho Chi Minh City">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <?php if(!empty($addressErr)): ?>
                                <i class="fa fa-close"> <?php echo $addressErr ; ?></i>
                            <?php endif ?>
                        </span>
                </div>
            </div>
        </div>
        <!-- <div class="row">
            <div class="col-md-2 field-label-responsive">
                <label>Password</label>
            </div>
            <div class="col-md-8">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <input type="password" name="password" class="form-control"
                            value=""  placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                                <i class="fa fa-close"> </i>
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
                            
                                <i class="fa fa-close"> </i>
        
                        </span>
                </div>
            </div>
        </div> -->
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <!-- <button type="submit" class="btn btn-success" name="submit"><i class="fa fa-user-plus"></i> Register</button> -->
                <input class="btn btn-dark" name="submit" type="submit" value=" Update User "/>
            </div>
        </div>
    </form>
</div>