<?php
$conn = mysqli_connect("localhost","root","Rocklee7!","rush_hour_food_delivery_service_llc");
$sql  = "INSERT INTO <your_table_name_here> (name, location) VALUES ('$username', '$address')";

$msg = "";

if (isset($_POST['Login'])) {
  $username = trim($_POST['username']);
  $address  = trim($_POST['address']);

  if ($username === "" || $address === "") {
    $msg = "Please fill in all fields.";
  } else {
    $username = mysqli_real_escape_string($conn, $username);
    $address  = mysqli_real_escape_string($conn, $address);

    $sql = "INSERT INTO restaurants(name, location) VALUES ('$username', '$address')";
    if (mysqli_query($conn, $sql)) {
      $msg = "Restaurant saved.";
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
    <?php if ($msg !== "") { echo "<p>$msg</p>"; } ?>
    <form action="" method="post">
      <label for="username">Restaurant Name:</label>
      <input type="text" id="username" name="username" required>
      <br><br>
      <label for="address">Location:</label>
      <input type="text" id="address" name="address" required>
      <br><br>
      <button type="submit" name="Login">Save</button>
    </form>
  </body>
</html>


