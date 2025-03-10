<?php

class RecipeInfo {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selectRecipeInfo($recipe_id, $record_type) {
        
        $sql = "SELECT * FROM `recipe_info` WHERE `recipe_id` = $recipe_id AND `record_type` = '$record_type'";
        $result = mysqli_query($this->connection, $sql);
        
        $recipe_info = [];
        
        // If we get comments we also need to know user names and profile images.
        if($record_type == 'C') {
            $user = new User($this->connection);
            $user_id = '';   
        }

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            if($record_type == 'C'){
                $user_id = $row['user_id'];                
                $user_info = $user->selectUserByUserId($user_id);

                $row['user_name'] = $user_info['user_name'];
                $row['user_img'] = $user_info['img'];
                
                $user_id = '';
            }            
            $recipe_info[] = $row;
        }
        return $recipe_info;
    }

    public function addFavorite($recipe_id, $user_id) {
        $sql = "INSERT INTO `recipe_info` (`record_type`, `recipe_id`, `user_id`) VALUES ('F', $recipe_id, $user_id);";

        $result = mysqli_query($this->connection, $sql);

        return $result;
    }

    public function deleteFavorite($recipe_id, $user_id) {
        $sql = "DELETE FROM `recipe_info` WHERE `recipe_id` = $recipe_id AND `user_id` = $user_id;";

        $result = mysqli_query($this->connection, $sql);

        return $result;
    }
}

?>