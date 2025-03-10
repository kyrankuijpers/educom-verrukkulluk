<?php

class Product {

    private $connection;

    public function __construct($connection) {
    }
  
    public function selectProductByProductId($product_id) {
        $sql = "SELECT * FROM `product` WHERE `id` = $product_id";
        
        $result = mysqli_query($this->connection, $sql);
        $product = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return $product;
    }
}

?>