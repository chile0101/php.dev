


<div id="contact" class="container">
  <div id="contact-content" class="contact-content row">
    <div class="col-sm-12 col-md-12 col-lg-12"  >
      <div id="content">
        <h3 class="entry-title">CONTACT US</h3>
        <div class="entry-content">
          <div class="content-map" >
            <iframe src="https://www.google.com/maps/embed?pb=!1m12!1m8!1m3!1d2482.4258980362797!2d-0.15843499999999994!3d51.52374779999999!3m2!1i1024!2i768!4f13.1!2m1!1s221B+Baker+St.+London+NW1+6XE!5e0!3m2!1sen!2slv!4v1426078634355" frameborder="0" class="iframe-ggmap"></iframe>
          </div>

          <div class="row">
            <div class="col-md-5">
              <h3 class="contact-us underline">CONTACT INFO</h3>
              <p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><br>
              <p class="contact-info">
                <span class="glyphicon glyphicon-home">  Shopera 221B Baker London</span>
              </p>
              <p class="contact-info">
                <span class="glyphicon glyphicon-earphone">  Call: 0934928881</span>
              </p>
              <p class="contact-info">
                <span class="glyphicon glyphicon-envelope">  Email: shopera@gmail.com</span>
              </p>
            </div>
            <div class="col-md-6">
              <h3 class="contact-us underline">SEND US AN EMAIL</h3>
              <div class="form-send-mail">
                <form method = "POST"  action="<?php $_SERVER['PHP_SELF'] ?>">
                  <label >Your Name (required)</label>
                  <input type="text" id="name" name="yourname" placeholder="Your name..">

                  <label style="margin-right:20px;">Your Email (required)</label><small class= "text-danger"><?php echo $emailErr; ?></small>
                  <input type="text" id="email" name="email" placeholder="Your email..">
                  
                  <label >Subject</label>
                  <input type="text"  name="subject">

                  <label>Your Message</label>
                  <textarea name="message" placeholder="Write something.." style="height:200px"></textarea>

                  <input type="submit" name="contact_us" value="Send">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
