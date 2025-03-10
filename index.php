<?php

require_once("lib/database.php");
require_once("lib/product.php");
require_once("lib/user.php");
require_once("lib/cuisine_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");

/// INIT
$db = new Database();
$product = new Product($db->getConnection());
$user = new User($db->getConnection());
$cuisine_type = new CuisineType($db->getConnection());
$ingredient = new Ingredient($db->getConnection(), $product);
$recipe_info = new RecipeInfo($db->getConnection(), $user);

/// VERWERK 
$recipe_id = 3;
$user_id = 4;

$data = $recipe_info->selectRecipeInfo($recipe_id, "R");

/// RETURN

echo "<pre>";
var_dump($data);
echo "</pre>";

?>