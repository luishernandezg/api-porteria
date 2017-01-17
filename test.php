<?php
/**
 * Insertar una nuevo usuario en la base de datos
 */
$body = json_decode(file_get_contents("php://input"), true);


class Mensaje{

   var $estado;
   var $contenido;

  function __construct($estado,$contenido){
      $this->estado = $estado;
      $this->contenido = $contenido;
    }
   
}
$mensaje[0] = new Mensaje("0","correcto");
$mensaje[1] = new Mensaje("1","correcto");
$mensaje[2] = new Mensaje("2","hola");

	header("Access-Control-Allow-Origin: *");
	print json_encode($mensaje);

?>

            
    
    


