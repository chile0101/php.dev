

<div class="card mb-3">
  
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <form method="post" action="<?php $_SERVER['PHP_SELF']; ?>">
        <div class="form-group">
            <label>Share title </label>
            <input type="text" name="title" class="form-control"/> 
        </div>
        <div class="form-group">
            <label>Body </label>
            <textarea name="body" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label>Link </label>
            <input type="text" name="link" class="form-control"/> 
        </div>  
        <input class="btn btn-primary" name="submit" type="submit" value="submit"/>
        <a class="btn btn-danger" href="<?php echo ROOT_PATH; ?>shares">Cancel </a>
    </form>
  </div>
</div>