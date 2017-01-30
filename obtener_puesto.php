<?php
/**
 * Obtiene todas las metas de la base de datos
 */
require 'Puesto.php';

//$n = Puesto::puestosLibres();
//print json_encode($n);
 //print("<br>");
 //$c = (object) $n;
 //print_r($c);
 //print("<br>");
 //print($c->nropuesto);


 //print("<br>");
 //print("holaaa");



if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    // Manejar petición GET
    $datos = Puesto::puestosLibres();

    if ($datos) {
         header("Access-Control-Allow-Origin: *");
         $c = (object) $datos;
         print json_encode($c);
         }
        //print json_encode($datos);
     else {
         header("Access-Control-Allow-Origin: *");
        print json_encode(array(
            "estado" => 2,
            "mensaje" => "Ha ocurrido un error"
        ));
    }
}
