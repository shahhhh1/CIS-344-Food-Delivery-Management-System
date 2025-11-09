<?php 
$servername = "localhost";
$username = "";
$password = "rocklee7";
$database = "rush_hour_food_delivery_service_llc";

$conn = new mysqli($servername, $username, $password, $database);

if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);

}
?>