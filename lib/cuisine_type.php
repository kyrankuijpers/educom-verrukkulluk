<?php
    class CuisineType {
       
        private $connection;

        public function __construct($connection) {
            $this->connection = $connection;
        }

        public function selectCuisineOrTypeById($cuisine_type_id) {
            $sql = "SELECT * FROM `cuisine_type` WHERE `id` = $cuisine_type_id";

            $result = mysqli_query($this->connection, $sql);
            $cuisine_type = mysqli_fetch_array($result, MYSQLI_ASSOC);

            return $cuisine_type;
        }
    }
?>