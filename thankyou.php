<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $name = htmlspecialchars($_POST['name']);
  $address = htmlspecialchars($_POST['address']);
  $payment = htmlspecialchars($_POST['payment']);
  $total = htmlspecialchars($_POST['total']);
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Thank You</title>
</head>
<body>
  <h1>Thank You, <?php echo $name; ?>!</h1>
  <p>Your order of $<?php echo $total; ?> will be delivered to <?php echo $address; ?>.</p>
  <p>Payment Method: <?php echo ucfirst($payment); ?></p>
  <a href="menu.php">Return to Menu</a>
  <script>localStorage.clear();</script>
</body>
</html>
