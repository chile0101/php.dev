
<div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Login</h5>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <form method="post" action="<?php $_SERVER['PHP_SELF']; ?>">
        
        <div class="form-group">
            <label>Email</label>
            <input type="text" name="email" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="text" name="password" class="form-control"/> 
        </div>  
        <input class="btn btn-primary" name="submit" type="submit" value="submit"/>

    </form>
  </div>
</div>