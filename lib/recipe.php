<?php

class Recipe {

    private $connection;
    private $user;
    private $product;
    private $ingredient;
    private $recipe_info;
    private $cuisine_type;
    
    public function __construct($connection) {
    
        $this->connection = $connection;
        $this->user = new User($this->connection);
        $this->product = new Product($this->connection);
        $this->ingredient = new Ingredient($this->connection, $this->product);
        $this->recipe_info = new RecipeInfo($this->connection, $this->user);
        $this->cuisine_type = new CuisineType($this->connection);

    }

    public function selectRecipe($recipe_id = 0) {

        $recipes = [];
        $recipe = [];
        $cuisine_id = '';
        $type_id = '';
        $user_id = '';
        
        $sql = "SELECT * FROM `recipe`";
    
        if($recipe_id !== 0) {
            $sql .= " WHERE `id` = $recipe_id;";
        }

        $result = mysqli_query($this->connection, $sql);

        while($recipe = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
  
            $recipe = [];
            
            $recipe_id = $recipe['id'];
            $cuisine_id = $recipe['cuisine_id'];
            $type_id = $recipe['type_id'];
            $user_id = '4'; // HARDCODED FOR TESTING     

            $cuisine = $this->cuisine_type->selectCuisineType($cuisine_id); 
            $type = $this->cuisine_type->selectCuisineType($type_id);
            
            $recipe['cuisine'] = $cuisine['descr'];
            $recipe['type'] = $type['descr'];
            
            $recipe['ingredients'] = $this->ingredient->selectIngredient($recipe_id);
            $recipe['favorites'] = $this->recipe_info->selectRecipeInfo($recipe_id, 'F');
            $recipe['ratings'] = $this->recipe_info->selectRecipeInfo($recipe_id, 'R');
            $recipe['comments'] = $this->recipe_info->selectRecipeInfo($recipe_id, 'C');
            $recipe['instructions'] = $this->recipe_info->selectRecipeInfo($recipe_id, 'I');
            $recipe['current_user'] = $this->user->selectUser($user_id);

            $recipe['price'] = $this->calculatePrice($recipe);
            $recipe['kcal'] = $this->calculateKcal($recipe);
            $recipe['avg_rating'] = $this->calculateRating($recipe);
            $recipe['fav'] = $this->determineFavorite($recipe);

            unset($recipe['ratings']);
            unset($recipe['favorites']);

            $recipes[] = $recipe;

        }
        
        return $recipes;

    }

    private function getUser($user_id) {

        return $this->user->selectUser($user_id);

    }

    private function getCuisine($cuisine_id) {

        return $this->cuisine_type->selectCuisineType($cuisine_id);

    }

    private function getType($type_id) {

        return $this->cuisine_type->selectCuisineType($type_id);

    }

    private function getIngredients($recipe_id) {

        return $this->ingredient->selectIngredient($recipe_id);

    }

    private function getRecipeInfo($recipe_info, $record_type) {
        
        return $this->recipe_info->selectRecipeInfo($recipe_id, $record_type);

    }

    private function calculatePrice($recipe) {

        $recipe_price = 0;

        $ingredients = $recipe['ingredients'];

        foreach($ingredients as $ingredient) {
            
            $ingredient_amount = floatval($ingredient['amount']);
            $product_content = floatval($ingredient['content']);
            $product_price = intval($ingredient['price']); // in cents
            $products_needed = 0;
            $ingredient_price = 0;

            if((is_numeric($product_content)) && ($product_content !== 0)) {
                $products_needed = ceil($ingredient_amount / $product_content);
            }

            $ingredient_price = $products_needed * $product_price;
            $recipe_price = $recipe_price + $ingredient_price;

        }

        return $recipe_price;

    }

    private function calculateKcal($recipe) {

        $recipe_kcal = 0;

        $ingredients = $recipe['ingredients'];

        foreach($ingredients as $ingredient) {

            $ingredient_amount = floatval($ingredient['amount']);
            $product_content = floatval($ingredient['content']);
            $product_kcal = intval($ingredient['kcal']);
            
            $products_needed = 0;
            $ingredient_kcal = 0;

            if((is_numeric($product_content)) && ($product_content !== 0)) {
                $products_needed = ceil($ingredient_amount / $product_content);
            }
            
            $ingredient_kcal = $products_needed * $product_kcal;
            $recipe_kcal = $recipe_kcal + $ingredient_kcal;

        }

        return $recipe_kcal;

    }

    private function calculateRating($recipe) {

        $average_rating = 0;
        $total_stars = 0;

        $ratings = $recipe['ratings'];
        $count = count($recipe['ratings']);

        foreach($ratings as $rating) {
            
            $total_stars = $total_stars + floatval($rating['info_numeric']);
            
        }

        if($count > 0) {
            
            $average_rating = $total_stars / $count;

        }

        return $average_rating;

    }

    private function determineFavorite($recipe) {

        $recipe_is_favorite = false;

        $favorites = $recipe['favorites'];
        $current_user_id = $recipe['current_user']['id'];

        foreach($favorites as $favorite) {

            if($current_user_id === $favorite['user_id']) {
                
                $recipe_is_favorite = true;
                break;
            } 
        }

        return $recipe_is_favorite;
    }


}

?>