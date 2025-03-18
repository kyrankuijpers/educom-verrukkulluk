<?php

require_once("./vendor/autoload.php"); // ./ means rel to current dir

// Load twig
$loader = new \Twig\Loader\FilesystemLoader("./templates");
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

// Get data

require_once("lib/database.php");
require_once("lib/product.php");
require_once("lib/user.php");
require_once("lib/cuisine_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");
require_once("lib/grocerylist.php");

$db = new Database();
$recipe = new Recipe($db->getConnection());

$recipe_id = isset($_GET['recipe_id']) ? $_GET['recipe_id'] : "";
$action = isset($_GET['action']) ? $_GET['action'] : "homepage";

// HARDCODED FOR TESTING //
$user_id = 2;
// HARDCODED FOR TESTING //

// Select template depending on transaction
switch($action) {

    case "homepage": {
        $data = $recipe->selectRecipe();
        $template = "homepage.html.twig";
        $title = "home";
        break;    
    }

    case "detail": {

        $data = $recipe->selectRecipe($recipe_id)[0];
        $template = "detail.html.twig";
        $title = "detailpagina";
        break;
    }

}

$template = $twig->load($template);

// Show page
echo $template->render(["title" => $title, "data" => $data]);











?>