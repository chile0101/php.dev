

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
       
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Old Price</label>
     <div class="col-sm-6">
       <input type="number" name="priceold"  min="1" max="1000" style="width:100px ;margin-right:5px;" value=""> $
     </div>
     <div class="col-sm-3">
      
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">New Price</label>
     <div class="col-sm-6">
       <input type="number" name="pricenew"  min="1" max="1000" style="width:100px ;margin-right:5px;" value=""> $
     </div>
     <div class="col-sm-3">
      
     </div>
   </div>


   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Code</label>
     <div class="col-sm-6">
       <input type="text" class="form-control" style="width:100px;" name="code" value="">
       
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Description</label>
     <div class="col-sm-6">
       <textarea rows="5" cols="50" class="form-control" name="description" ></textarea>
       
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Link Origin</label>
     <div class="col-sm-6">
     <input type="text" class="form-control"  name="link_origin" value="">
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Date Release</label>
     <div class="col-sm-6">
     <input type="text" class="form-control"  name="date_release" value="">
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Developer</label>
     <div class="col-sm-6">
     <input type="text" class="form-control"  name="developer" value="">
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Link Trailer</label>
     <div class="col-sm-6">
     <input type="text" class="form-control"  name="link_trailer" value="">
     </div>
     <div class="col-sm-3">
    
     </div>
   </div>


   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Link Image</label>
     <div class="col-sm-6">
      <input type="text" class="form-control"  name="image" id="image" >
      
     </div>

     <div class="col-sm-3">
    
     </div>
   </div>

   <div class="form-group row">
     <label class="col-sm-3 col-form-label text-right">Type Product</label>
     <div class="col-sm-6">
     <select class="custom-select my-1 mr-sm-2" name="type_product_id" style="width:100px;">
           <option value="1">Action</option>
           <option value="2">Advanture</option>
           <option value="3">Casual</option>
           <option value="4">Indie</option>
       
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