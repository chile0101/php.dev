<?php 
    $fullname=$email=$phone=$address=$password="";
    $fullnameErr=$emailErr=$phoneErr=$addressErr=$passwordErr=$passwordcfErr="";

    if(isset($_POST['register'])){

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



<div class="register" style="background:url(<?php echo ROOT_PATH; ?>/assets/images/slides/banner1.jpg);">
    <div class="loginbox signup">
    <img src="<?php echo ROOT_PATH; ?>assets/images/icons/avatar.jpeg" class="avatar">
      <h1>Register Here</h1>
      <form method="POST" action="<?php $_SERVER['PHP_SELF'] ?>">
        <input type="text" name="fullname" placeholder="Full Name" value="<?php echo $fullname; ?>">    
          <small class="text-danger"><?php echo $fullnameErr; ?></small>          
        <input type="text" name="email" placeholder="Email" value="<?php echo $email; ?>">       
          <small class="text-danger"><?php echo $emailErr; ?></small>
        <input type="text" name="phone" placeholder="Phone Number" value="<?php echo $phone; ?>"> 
          <small class="text-danger"><?php echo $phoneErr; ?></small>  
        <input type="text" name="address" placeholder="Address" value="<?php echo $address; ?>">   
          <small class="text-danger"><?php echo $addressErr; ?></small>
        <input type="password" name="password" placeholder="Password" value="<?php echo $password; ?>">
          <small class="text-danger"><?php echo $passwordErr; ?></small>        
        <input type="password" name="password_confirm" placeholder="Confirm Password">   
          <small class="text-danger"><?php echo $passwordcfErr; ?></small>     
        <input type="submit" name="register" value="Register">
        <a href="#"> Lost your password?</a><br>
        <a href="#"> Don't have an account?</a>
      </form>
    </div>
</div>
