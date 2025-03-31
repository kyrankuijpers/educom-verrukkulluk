<?php

class GroceryList {
   
    private $connection;
    private $ingredient;

    public function __construct($connection) {

        $this->connection = $connection;
        $this->ingredient = new Ingredient($this->connection);

    }

    public function selectGroceryList($user_id) {
        
        $sql = "SELECT * FROM `grocerylist` WHERE `user_id` = $user_id;";
        $result = mysqli_query($this->connection, $sql);
        
        $grocery_list = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            $grocery_list[] = $row;

        }

        return $grocery_list;
    }

    public function deleteGroceryList($user_id) {

        $sql = "DELETE FROM `grocerylist` WHERE `user_id` = $user_id;";

        $result = mysqli_query($this->connection, $sql);
    }

    public function deleteProductFromGroceryList($grocerylist_id) {

        $sql = "DELETE FROM `grocerylist` WHERE `id` = $grocerylist_id;";

        $result = mysqli_query($this->connection, $sql);

    }

    public function addGroceries($recipe_id, $user_id) {

        $product_id = 0;
        $old_amount = 0;
        $ingredients = $this->ingredient->selectIngredient($recipe_id);

        foreach($ingredients as $ingredient) {

            $product_id = $ingredient['product_id'];
            $name = $ingredient['name'];
            $descr = $ingredient['descr'];
            $price = $ingredient['price'];
            $unit = $ingredient['unit'];
            $content = $ingredient['content'];
            $kcal = $ingredient['kcal'];
            $img = $ingredient['img'];
            $new_amount = $ingredient['amount'];

            $old_amount = $this->productInGroceryList($product_id, $user_id);

            if($old_amount > 0) {

                $total_amount = $old_amount + $new_amount;
                $qty = ceil(($total_amount / $content)); 

                $sql = "UPDATE `grocerylist` SET `amount_needed` = $total_amount, `qty` = $qty WHERE `user_id` = $user_id AND `product_id` = $product_id;";

            } else {
                
                $qty = ceil(($new_amount / $content)); 

                $sql = "INSERT INTO `grocerylist` (`user_id`, `product_id`, `name`, `descr`, `price`, `unit`, `content`,  `kcal`, `img`, `amount_needed`, `qty`) 
                VALUES ($user_id, $product_id, '$name', '$descr', $price, '$unit', $content, $kcal, '$img', $new_amount, $qty);";
                
            }
            
            $result = mysqli_query($this->connection, $sql);
            
            $product_id = 0;
            $old_amount = 0;
        } 
    }

    public function changeQty($grocerylist_id, $qty) {

        $sql = "UPDATE `grocerylist` SET `qty` = $qty WHERE `id` = '$grocerylist_id';";

        $result = mysqli_query($this->connection, $sql);

    }

    private function productInGroceryList($product_id, $user_id) {

        $old_amount = 0;

        $grocery_list = $this->selectGroceryList($user_id);
        
        foreach($grocery_list as $product) {
            
            if($product_id === $product['product_id']) {

                $old_amount = $product['amount_needed'];
                
                return $old_amount;
            }
        }
        return $old_amount;
    }
}

?>