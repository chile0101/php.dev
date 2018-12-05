<?php
    $error="";
    if(isset($_POST['submit'])){
        if(empty($_POST['email']) || empty($_POST['password'])){
            $error="Please fill in all required fields";
        }
    }
    if(!empty($viewmodel)){
        $error=$viewmodel;
    }
?>

<div class="login" style="background:url(<?php echo ROOT_PATH; ?>/assets/images/bg_login.jpg);">
    <div class="loginbox signin">
        <img src="<?php echo ROOT_PATH; ?>assets/images/icons/avatar.jpeg" class="avatar">
        <h1>Sign In Here</h1>
        <small class="text-danger">* <?php echo $error; ?></small>
        <div >
            <form method="POST" action="<?php $_SERVER['PHP_SELF'] ?>">
                
                <p>Email</p>
                <input type="text" name="email" placeholder="Enter email">
                <p>Password</p>
                <input type="password" name="password" placeholder="Enter Password">
                <input type="submit" name="submit" value="Login">
                <a href="#">Lost your password?</a><br>
                <a href="#">Don't have an account?</a>
            </form>
        </div>
    </div>
</div>