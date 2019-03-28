<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<?php 

    $fullnameErr=$emailErr=$phoneErr=$addressErr=$passwordErr=$passwordcfErr="";
    
    if(isset($_POST['submit'])){

        if(empty($_POST['fullname'])){
            $fullnameErr="Full name is ";
        }

        if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $emailErr="Email format is not valid";
        }
        
        if(empty($_POST['phone'])){
            $phoneErr="Phone number is ";
        }
      
        if(empty($_POST['address'])){
            $addressErr="Address is ";
        }
    }

?>
 <div class="edit" style="padding-top: 50px;
    padding-bottom: 50px;">

   <form class="form-horizontal" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>">
    <div class="form-group row">
       <div class="col-md-3">
       </div>
            <label class="col-md-1 label-control">Full name<span
              class="text-danger"></span></label>
            <div class="col-md-3">
              <input type="text"  name="fullname"   class="form-control" value="<?php echo $viewmodel['fullname']; ?>"
                >
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
     <div class="form-group row">
      <div class="col-md-3">
       </div>
            <label class="col-md-1 label-control">Phone<span
              class="text-danger"></span></label>
            <div class="col-md-3">
              <input type="number" name="phone"   class="form-control" value="<?php echo $viewmodel['phone']; ?>"
                
                >
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
     <div class="form-group row">
      <div class="col-md-3">
       </div>
            <label class="col-md-1 label-control">Email<span
              class="text-danger"></span></label>
            <div class="col-md-3">
              <input type="text" name="email"  class="form-control"  value="<?php echo $viewmodel['email']; ?>"
                
                >
            </div>
             <div class="col-md-2">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <?php if(!empty($emailErr)): ?>
                                <i class="fa fa-close"> <?php echo $emailErr ; ?></i>
                            <?php endif ?>
                        </span>
                </div>
            </div>
    </div>
     <div class="form-group row">
      <div class="col-md-3">
       </div> 
            <label class="col-md-1 label-control">Address<span
              class="text-danger"></span></label>
            <div class="col-md-3">
              <input type="text" name="address"   class="form-control" value="<?php echo $viewmodel['address']; ?>"
               
                >
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
    <div class="form-group row">
      <div class="col-md-3">
       </div>
      <label class="col-md-1 label-control"></label>
            <div class="col-md-1">
              <input class="btn btn-success" name="submit" type="submit" value=" Update User "/>
            </div>
           
    </div>
   
    </form>
 </div>
