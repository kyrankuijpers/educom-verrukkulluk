<?php

require_once("lib/database.php");
require_once("lib/product.php");

/// INIT
$db = new Database();
$product = new Product($db->getConnection());


/// VERWERK 
//$data = $product->selectProduct(8);

/// RETURN
var_dump("<pre>",  $db, "</pre>");