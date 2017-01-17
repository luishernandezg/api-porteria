<?php
/**
 * Insertar una nuevo usuario en la base de datos
 */

require 'Usuario.php';
//Usuario::hola();
//print "holaaaaaaaaa";
//$n = Usuario::insert("lala","lala","lala","lala","lala","lala","lala");

//print "n= es igual a <br>";
//print "holaaaaaaaaa";
//print $n;
//print "holaaaaaaaaa";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Decodificando formato Json
    
    $body = json_decode(file_get_contents("php://input"), true);


    // Insertar Usuario
    $retorno = Usuario::insert(
        $body['cedula'],
        $body['nroexp'],
        $body['nombre'],
        $body['apellido'],      
        $body['correo'],
        $body['telefono'],
        $body['clave']
    );

    if ($retorno) {
        // Código de éxito
        header("Access-Control-Allow-Origin: *");
        print json_encode(
            array(
                'estado' => '1',
                'contenido' => 'Creación exitosa')
        );
    } else {
        // Código de falla
        //header que permite el envio del json
        header("Access-Control-Allow-Origin: *");
        print json_encode(
            array(
                'estado' => '2',
                'contenido' => 'Creación fallida')
        );
    }
    
}

?>
