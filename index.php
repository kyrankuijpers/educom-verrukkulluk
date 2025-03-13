<?php

require_once("lib/database.php");
require_once("lib/product.php");
require_once("lib/user.php");
require_once("lib/cuisine_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");
require_once("lib/grocerylist.php");

/// INIT
$db = new Database();
$recipe = new Recipe($db->getConnection());
$grocerylist = new GroceryList($db->getConnection());

/// VERWERK 

///// HARDCODED FOR TESTING /////
$recipe_id = 1;
$user_id = 2;
///// HARDCODED FOR TESTING /////

$grocerylist->addGroceries($recipe_id, $user_id);



/// RETURN

echo "<pre>";
//var_dump($data);
echo "</pre>";

?>