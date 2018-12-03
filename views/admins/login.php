<?php 
    $email=$password="";
    
    if(isset($_POST['submit'])){
        if(empty($_POST['email'])){
            $emailErr = 'Email is required';
        }else{
            $email=$_POST['email'];
        }
        if(empty($_POST['password'])){
            $passwordErr = 'Password is required';
        }else{
            $password=$_POST['password'];
        }
    }
?>

<div class="container" style="margin-top: 80px;">
    <form class="form-horizontal" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Please Login</h2>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <label class="sr-only" for="email">E-Mail Address</label>
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <input type="text" name="email" class="form-control" id="email" 
                            value="<?php echo $email;?>" placeholder="you@example.com">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                    <span class="text-danger align-middle">
                        <?php if(!empty($emailErr)): ?>
                            <i class="fa fa-close"></i> <?php echo $emailErr; ?>
                        <?php endif ?>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="sr-only" for="password">Password</label>
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <input type="password" name="password" class="form-control" id="password"
                            value="<?php echo $password;?>" placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                    <span class="text-danger align-middle">
                        <?php if(!empty($passwordErr)): ?>
                            <i class="fa fa-close"></i> <?php echo $passwordErr; ?>  
                        <?php endif ?>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="padding-top: .35rem">
                <div class="form-check mb-2 mr-sm-2 mb-sm-0">
                    <label class="form-check-label">
                        <input class="form-check-input" name="remember"
                                type="checkbox" >
                        <span style="padding-bottom: .15rem">Remember me</span>
                    </label>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 1rem">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <input class="btn btn-success" name="submit" type="submit" value=" Login "/>
                <a class="btn btn-link" href="/password/reset">Forgot Your Password?</a>
            </div>
        </div>
    </form>
</div>

