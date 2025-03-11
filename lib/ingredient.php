<?php

class Ingredient {

    private $connection;
    private $product;

    public function __construct($connection, $product) {

        $this->connection = $connection;
        $this->product = $product;
        
    }

    public function selectIngredient($recipe_id) {
        $ingredient_and_product = [];
        
        $sql = "SELECT * FROM `ingredient` WHERE `recipe_id` = $recipe_id;";

        $result = mysqli_query($this->connection, $sql);
        
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                  
            $product_id = $row['product_id'];
            $product = $this->getProduct($product_id);
            
            $ingredient_and_product = [...$row, ...$product];
        }
        
        return $ingredient_and_product;
    }

    private function getProduct($product_id) {

        return $this->product->selectProduct($product_id);

    }
}

?>