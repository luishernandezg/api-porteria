<?php

require 'Usuario.php';

//$n = Usuario::login("2","2");
//print json_encode($n);
//print "<br>";



if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    
    $body = json_decode(file_get_contents("php://input"), true);

    // Manejar petición GET
    $datos = Usuario::login($_GET["email"],
        $_GET["clave"]);

    if ($datos) {
         header("Access-Control-Allow-Origin: *");
         print json_encode($datos);
    } else {
         header("Access-Control-Allow-Origin: *");
         print json_encode(array("ci" => "0" ));
    }
}

?>