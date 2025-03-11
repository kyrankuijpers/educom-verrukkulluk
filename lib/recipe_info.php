<?php

class RecipeInfo {

    private $connection;
    private $user;

    public function __construct($connection, $user) {
       
        $this->connection = $connection;
        $this->user = $user;
    }

    public function selectRecipeInfo($recipe_id, $record_type) {
        
        $sql = "SELECT * FROM `recipe_info` WHERE `recipe_id` = $recipe_id AND `record_type` = '$record_type';";
        $result = mysqli_query($this->connection, $sql);
        
        $recipe_info = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            if($record_type == 'C') {                
                $user_id = '';
                $user_info = [];
                
                $user_id = $row['user_id'];                
                $user_info = $this->getUser($user_id);

                $recipe_info[] = [...$row, ...$user_info];
            }
            else {
                $recipe_info[] = $row;
            }        
        }
        return $recipe_info;
    }

    private function getUser($user_id) {
        return $this->user->selectUser($user_id);
    }

    public function addFavorite($recipe_id, $user_id) {
        $this->deleteFavorite($recipe_id, $user_id);

        $sql = "INSERT INTO `recipe_info` (`record_type`, `recipe_id`, `user_id`) VALUES ('F', $recipe_id, $user_id);";

        $result = mysqli_query($this->connection, $sql);

        return $result;
    }

    public function deleteFavorite($recipe_id, $user_id) {
        $sql = "DELETE FROM `recipe_info` WHERE `record_type` = 'F' AND `recipe_id` = $recipe_id AND `user_id` = $user_id;";

        $result = mysqli_query($this->connection, $sql);

        return $result;
    }

}

?>