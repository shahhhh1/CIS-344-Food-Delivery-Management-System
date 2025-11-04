<!DOCTYPE html>
<html>
<head>
  <title>Menu</title>
  <link rel="stylesheet" href="menu.css">
</head>

<body>
  <h1>Menu</h1>

  <div class="crusty_crab" data-price="5.99">
    <p>Crabby Patty</p>
    <p>Restaurant: Crusty Crabs</p>
    <p>Price: $5.99</p>
    <img src="https://i.ytimg.com/vi/k5e1HPeusiA/hqdefault.jpg" alt="Crabby Patty" width="300" height="250">
    <br><br>
    <button>Add to Cart</button>
  </div>

  <div class="ramen" data-price="8.99">
    <p>Ramen</p>
    <p>Restaurant: Ichiraku Ramen</p>
    <p>Price: $8.99</p>
    <img src="https://a.storyblok.com/f/178900/638x358/399291d251/8ad71330b958165e3b735054f4ff20211498090822_full.jpg" alt="Ramen" width="300" height="250">
    <br><br>
    <button>Add to Cart</button>
  </div>

  <div class="pizza" data-price="10.99">
    <p>Pizza</p>
    <p>Restaurant: Luigi's Pizzaria</p>
    <p>Price: $10.99</p>
    <img src="https://www.foodandwine.com/thmb/iJw7N_NfcPpd-EB8rpYbzrkSFIM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/tomato-mozzarella-pizza-FT-RECIPE0725-e7244e979c504188a049623668c15b2e.jpg" alt="Pizza" width="300" height="250">
    <br><br>
    <button>Add to Cart</button>
  </div>

  <br>
  <h2 id="total">Total: $0.00</h2>
  <button id="checkout">Checkout</button>
  <br><br>

  <a href="home.php">Return to home</a>

  <script>
    let total = 0;
    const totalDisplay = document.getElementById('total');
    const checkoutButton = document.getElementById('checkout');

    document.querySelectorAll('button').forEach(button => {
      if (button.id !== 'checkout') {
        button.addEventListener('click', () => {
          const price = parseFloat(button.parentElement.dataset.price);
          total += price;
          totalDisplay.textContent = `Total: $${total.toFixed(2)}`;
        });
      }
    });

    checkoutButton.addEventListener('click', () => {
      if (total === 0) {
        alert('Your cart is empty!');
      } else {
        alert(`Thank you for your purchase! Your total is $${total.toFixed(2)}.`);
        total = 0;
        totalDisplay.textContent = 'Total: $0.00';
      }
    });
  </script>
</body>
</html>
