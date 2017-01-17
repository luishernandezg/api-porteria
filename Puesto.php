<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Puesto{

    function __construct(){
    }




      /**
     * Retorna en la fila especificada de la tabla 'meta'
     *
     * @param $idMeta Identificador del registro
     * @return array Datos del registro
     */
   public static function obtenerPuesto()
    {
       $comando="CALL puestosLibres()";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{  
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_ASSOC);
        
        } catch (Exception $e) {
        return 0;
        }


    }

}
?>
