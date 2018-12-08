<?php
$name = $price = $code  =$image= "";
$nameErr = $priceErr = $codeErr = $imageErr = "" ;
if(isset($_POST['submit'])){

  if(empty($_POST['name'])){
    $nameErr="Missing a field name";
  }else{
    $name=$_POST['name'];
  }

  if(empty($_POST['price'])){
    $priceError="Missing a field price";
  }else{
    $price=$_POST['price'];
  }

  if(empty($_POST['code'])){
    $codeErr="Missing a field code";
  }else{
    $code=$_POST['code'];
  }

  if(empty($_POST['image'])){
    $imageErr="Missing a field image";
  }else{
    $image=$_POST['image'];
  }

}

?>

<div class="container">
 
  <form method="POST" action="<?php $_SERVER['PHP_SELF'] ?>">
    <div class="form-group row" style="margin-top:20px;">
      <div class="col-sm-3"></div>
      <div class="col-sm-6 text-center"><h2>New Product</h2></div>
      <div class="col-sm-3"></div>
    </div>
    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Name</label>
      <div class="col-sm-6">
        <input type="text" name="name" class="form-control" value="">
        
      </div>
      <div class="col-sm-3">
        <p class="text-danger"><?php echo $nameErr; ?></p>
      </div>
    </div>

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Price</label>
      <div class="col-sm-6">
        <input type="number" name="price"  min="1" max="1000" style="width:100px ;margin-right:5px; "> $
      </div>
      <div class="col-sm-3">
       
      </div>
    </div>


    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Code</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" name="code">
        
      </div>
      <div class="col-sm-3">
      <p  class="text-danger"><?php echo  $codeErr; ?></p>
      </div>
    </div>


    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Description</label>
      <div class="col-sm-6">
        <textarea  class="form-control" name="description" ></textarea>
        
      </div>
      <div class="col-sm-3">
     
      </div>
    </div>

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Image</label>
      <div class="col-sm-6">
        <input type="file" class="form-control-file" name="image">  
      </div>
      <div class="col-sm-3">
      <p  class="text-danger"><?php echo $imageErr; ?></p>
      </div>
    </div>

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">Type Gender</label>
      <div class="col-sm-6">
      <select class="custom-select my-1 mr-sm-2" name="type_gender_id" style="width:100px;">
        <option value="1">Man</option>
        <option value="2">Women</option>
        
      </select>
      </div>
      <div class="col-sm-3">
      
      </div>
    </div>
    <br>
    <div class="row">
            <div class="col-sm-3"></div>
            <div class="mx-auto">
                <input class="btn btn-success" name="submit" type="submit" value="Create"/>
            </div>
            <div class="col-sm-3"></div>
    </div>
   

  </form>
</div>