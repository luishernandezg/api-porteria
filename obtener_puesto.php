<?php
/**
 * Obtiene todas las metas de la base de datos
 */
require 'Puesto.php';

//$n = Puesto::obtenerPuesto();
//print json_encode($n);



if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    // Manejar petición GET
    $datos = Puesto::obtenerPuesto();

    if ($datos) {
         header("Access-Control-Allow-Origin: *");
        print json_encode($datos);
    } else {
         header("Access-Control-Allow-Origin: *");
        print json_encode(array(
            "estado" => 2,
            "mensaje" => "Ha ocurrido un error"
        ));
    }
}
