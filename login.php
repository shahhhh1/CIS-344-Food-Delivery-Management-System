 <?php
  $conn = mysqli_connect("localhost","root","Rocklee7!","rush_hour_food_delivery_service_llc");
  
  if(isset($_POST['Login']))
  {
    $username = $_POST ['username'];
    $address = $_POST ['address'];

   

    $sql = "INSERT INTO restaurants(name, location) VALUES ('$username', '$address')";

    $data = mysqli_query($conn,$sql);
  }

  ?>

<!DOCTYPE html>
 
   <head>
      
       <title>Login</title>
   </head>
   <body>
       <form action="" method="post">
           <label for="username">Username:</label>
           <input type="text" id="username" name="username" required>
           <br>
           <br>
           
           <label for="address">address:</label>
           <input type="address" id="address" name="address" required>
           <br>
           <br>
           <button type="submit" name = "Login">Login</button>
       </form>
   </body>
   </html>
