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
$grocerylist = new GroceryList($db->getConnection());
$recipe_info = new RecipeInfo($db->getConnection());

$recipe_id = isset($_GET['recipe_id']) ? $_GET['recipe_id'] : "";
$action = isset($_GET['action']) ? $_GET['action'] : "homepage";
$grocerylist_id = isset($_GET['grocerylist_id']) ? $_GET['grocerylist_id'] : "";
$searchstring = isset($_GET['searchstring']) ? $_GET['searchstring'] : "";

// HARDCODED FOR TESTING //
$user_id = 1;
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

    case "rating": {

        $data = [];
        $rating = $_GET["rating"];

        $new_average = $recipe_info->addRatingAndReturnAverage($recipe_id, $rating);
        $data['new_average'] = $new_average;
        echo json_encode($data);

        break;
    }

    case "grocerylist": {

        $data = $grocerylist->selectGroceryList($user_id);
        $template = "grocerylist.html.twig";
        $title = "boodschappenlijst";
        break;
    }

    case "delete_product_from_grocerylist": {

        $grocerylist->deleteProductFromGroceryList($grocerylist_id);
        $result = $grocerylist->selectGroceryList($user_id);
        
        echo json_encode($result);

        break;
    }

    case "delete_grocerylist": {

        $result = $grocerylist->deleteGroceryList($user_id);
        break;
    }

    case "add_to_cart": {

        $result = $grocerylist->addGroceries($recipe_id, $user_id);
        break;
    }

    case "search": {

        $recipes = $recipe->selectRecipe();
        $hint = "";

        foreach($recipes as $option) {

            $title = $option['title'];
            $recipe_id = $option['id'];
            
            if(stristr($title, $searchstring)) {

                if ($hint == "") {

                    $hint="<a href='?action=detail&recipe_id=$recipe_id' target='_blank'>$title</a>";

                } else {
                    
                    $hint = $hint . "<br /><a href=''?action=detail&recipe_id=$recipe_id' target='_blank'>$title</a>";
                }
            }
        }
        echo $hint;
        break;
    }

    case "add_favorite": {

        $recipe_info->addFavorite($recipe_id, $user_id);
        break;

    }

    case "delete_favorite": {
    
        $recipe_info->deleteFavorite($recipe_id, $user_id);
        break;

    }
}

if(($action === "homepage") || ($action === "detail") || ($action === "grocerylist")) {

    $template = $twig->load($template);

    // Show page
    echo $template->render(["title" => $title, "data" => $data]);

}












?>