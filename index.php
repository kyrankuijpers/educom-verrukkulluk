<?php

require_once("lib/database.php");
require_once("lib/product.php");
require_once("lib/user.php");
require_once("lib/cuisine_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");

/// INIT
$db = new Database();
$product = new Product($db->getConnection());
$user = new User($db->getConnection());
$cuisine_type = new CuisineType($db->getConnection());
$ingredient = new Ingredient($db->getConnection(), $product);
$recipe_info = new RecipeInfo($db->getConnection(), $user);
$recipe = new Recipe($db->getConnection(), $ingredient, $recipe_info, $cuisine_type, $user);

/// VERWERK 
$recipe_id = 3;

$recipe_data = $recipe->selectRecipe($recipe_id, $ingredient, $recipe_info, $cuisine_type, $user);

/// RETURN

echo "<pre>";
var_dump($recipe_data);
echo "</pre>";

?>