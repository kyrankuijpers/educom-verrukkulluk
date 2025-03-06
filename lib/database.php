<?php 

define("USER", "root");
define("PASSWORD", "");
define("DATABASE", "ver");
define("HOST", "localhost");

class Database {

    private $connection;

    public function __construct() {
       $this->connection = mysqli_connect(HOST,                                          
                                          USER, 
                                          PASSWORD,
                                          DATABASE);
    }

    public function getConnection() {
        return($this->connection);
    }

}

?>