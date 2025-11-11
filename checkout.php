<?php
$total = 0;
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Checkout</title>
</head>
<body>
  <h1>Checkout Page</h1>
  <p id="summary"></p>

  <form action="thankyou.php" method="post">
    <label for="name">Full Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label for="address">Delivery Address:</label><br>
    <input type="text" name="address" required><br><br>

    <label for="payment">Payment Method:</label><br>
    <select name="payment" required>
      <option value="credit">Credit Card</option>
      <option value="cash">Cash on Delivery</option>
    </select><br><br>

    <input type="hidden" id="total" name="total" value="0">
    <button type="submit">Confirm Order</button>
  </form>

  <script>
    const total = localStorage.getItem('cartTotal');
    document.getElementById('summary').textContent = "Your total is $" + total;
    document.getElementById('total').value = total;
  </script>
</body>
</html>
