<?php

require_once("lib/database.php");
require_once("lib/product.php");
require_once("lib/user.php");
require_once("lib/cuisine_type.php");

/// INIT
$db = new Database();
$product = new Product($db->getConnection());
$user = new User($db->getConnection());
$cuisine_type = new CuisineType($db->getConnection());

/// VERWERK 
$data = $cuisine_type->selectCuisineOrTypeById(3);

/// RETURN

/*
echo "<pre>";
var_dump($data);
echo "</pre>";
*/

?>