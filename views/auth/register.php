<div class="login" style="background:url(<?php echo ROOT_PATH; ?>/assets/images/bg_login.jpg);">
    <div class="loginbox signup">
    <img src="<?php echo ROOT_PATH; ?>assets/images/icons/avatar.jpeg" class="avatar">
      <h1>Sign Up Here</h1>
      <form mothod="POST" action="<?php $_SERVER['PHP_SELF']?>">      
        <input type="text" name="fullname" placeholder="Full Name">      
        <input type="text" name="email" placeholder="Email">       
        <input type="text" name="phone" placeholder="Phone Number">   
        <input type="text" name="address" placeholder="Address">   
        <input type="password" name="password" placeholder="Password">        
        <input type="password" name="password" placeholder="Confirm Password">        
        <input type="submit" name="submit" value="Register">
        <a href="#"> Lost your password?</a><br>
        <a href="#"> Don't have an account?</a>
      </form>
    </div>
</div>