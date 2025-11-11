<?php
include("db_connect.php");

$message = " ";


if (isset($_POST['Register'])) {
  $name = trim($_POST['name']);
  $address  = trim($_POST['address']);
  $phone  = trim($_POST['phone']);
  $email = trim($_POST['email']);

  if ($name === "" || $address === ""|| $phone === ""|| $email === "") {
    $msg = "Please fill in all fields.";
  } else {
    $name = mysqli_real_escape_string($conn, $name);
    $address  = mysqli_real_escape_string($conn, $address);
    $phone  = mysqli_real_escape_string($conn, $phone);
    $email  = mysqli_real_escape_string($conn, $email);

    $sql = "INSERT INTO customers(name, email, phone, address ) VALUES ('$name','$email' ,'$address','$phone')";
    if (mysqli_query($conn, $sql)) {
      $msg = "Saved.";
      
    } else {
      $msg = "Error: " . mysqli_error($conn);
    }
  }
}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login</title>
  </head>
  <body>
    
    <form action="" method="post">
      <label for="name"> Name:</label>
      <input type="text" id="name" name="name" required>
      <br><br>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      <br><br>
      <label for="address">Address:</label>
      <input type="text" id="address" name="address" required>
      <br><br>
      <label for="phone">Phone number:</label>
      <input type="number" id="phone" name="phone" required>
      <br><br>
     
</form>

<form action="home.php" method="post">
      <button type="submit" name="Register">Register</button>
</form>
  </body>
</html>
