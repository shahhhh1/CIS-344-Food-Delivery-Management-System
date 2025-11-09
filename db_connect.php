<?php 
$db_server = "localhost";
$db_user = "root";
$password = "Whatever your password is";
$db_name = "rush_hour_food_delivery_service_llc";
$conn ="";

$conn = new mysqli($db_server, $db_user, $password, $db_name);

if($conn)
{
    echo "You are connected";
}
    else{
        echo "Can't connect";
    }
?>
