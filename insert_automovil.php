<?php
/**
 * Insertar una nuevo usuario en la base de datos
 */

require 'Automovil.php';
//Usuario::hola();
//print "holaaaaaaaaa";
//$n = Automovil::insert("llolo","lolo",6325,"lolo");
//print($n);

//print "n= es igual a <br>";
//print "holaaaaaaaaa";
//print $n;
//print "holaaaaaaaaa";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Decodificando formato Json
    
    $body = json_decode(file_get_contents("php://input"), true);


    // Insertar Usuario
    $retorno = Automovil::insert(
        $body['matricula'],
        $body['modelo'],
        $body['ano'],
        $body['color']
    );

    if ($retorno) {
        // Código de éxito
        header("Access-Control-Allow-Origin: *");
                   //setea el response status
        http_response_code(201);
        print json_encode(
            array(
                'estado' => '1',
                'contenido' => 'Creación exitosa')
        );
    } else {
        // Código de falla
        //header que permite el envio del json
        header("Access-Control-Allow-Origin: *");
                   //setea el response status
        http_response_code(202);
        print json_encode(
            array(
                'estado' => '2',
                'contenido' => 'Creación fallida')
        );
    }
    
}

?>