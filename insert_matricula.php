<?php
/**
 * Insertar una nuevo usuario en la base de datos
 */

require 'Matricula.php';
//Usuario::hola();
//print "holaaaaaaaaa";
$n = Matricula::insert("lala","lala","c");
print($n);
//print "n= es igual a <br>";
//print "holaaaaaaaaa";
//print $n;
//print "holaaaaaaaaa";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Decodificando formato Json
    
    $body = json_decode(file_get_contents("php://input"), true);


    // Insertar Usuario
    $retorno = Matricula::insert(
        $body['ciusuario'],
        $body['matriculaauto'],
        $body['parentesco']
    );

    if ($retorno) {
        // Código de éxito
           //setea el response status
        http_response_code(201);
        header("Access-Control-Allow-Origin: *");
        print json_encode(
            array(
                'estado' => '1',
                'contenido' => 'Creación exitosa')
        );
    } else {
        // Código de falla
        //header que permite el envio del json
           //setea el response status
        http_response_code(202);
        header("Access-Control-Allow-Origin: *");
        print json_encode(
            array(
                'estado' => '2',
                'contenido' => 'Creación fallida')
        );
    }
    
}

?>