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
$recipe = new Recipe($db->getConnection());

/// VERWERK 
$recipe_id = 0;

$recipe_data = $recipe->selectRecipe($recipe_id);

/// RETURN

echo "<pre>";
var_dump($recipe_data);
echo "</pre>";

?>