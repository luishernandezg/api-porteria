<?php
/**
 * Insertar una nuevo usuario en la base de datos
 */

require 'Automovil.php';
$n = Automovil::deleteAutomovil("20504717","1245");
print json_encode($n);
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Decodificando formato Json
    
    $body = json_decode(file_get_contents("php://input"), true);


    // Insertar Usuario
    $retorno = Automovil::deleteAutomovil(
        $body['ciusuario'],
        $body['matricula']
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