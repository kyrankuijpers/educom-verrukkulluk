<?php

class Product {

    private $connection;

    public $product_id;
    public $name;
    public $descr;
    public $price;
    public $unit;
    public $content;
    public $img;

    public function __construct($connection, $product_id = null, $name = '', $descr = '', $price = 0, $unit = '', $content = 0.0, $img = '') {
        $this->connection = $connection;
        $this->product_id = $product_id;
        $this->name = $name;
        $this->descr = $descr;
        $this->price = $price;
        $this->unit = $unit;
        $this->content = $content;
        $this->img = $img;
    }
  
    public function selectProductByProductId($product_id) {
        $sql = "SELECT * FROM `product` WHERE `id` = $product_id";
        
        $result = mysqli_query($this->connection, $sql);
        $product = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($product);
    }
}

?>