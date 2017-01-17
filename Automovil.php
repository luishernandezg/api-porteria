<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Automovil{

    function __construct(){
    }
  /**
     * Insertar una nuevo usuario
     *
     * @param $matriculaauto          cedurla del usuario
     * @param $modelo         correo electronico
     * @param $ano          nombre del ususrio
     * @param $color        apellido del usuario
     * @return PDOStatement
     */
    public static function insert($matriculaauto,$modelo,$ano,$color) {
        $comando="CALL insertAutomovil(?,?,?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $matriculaauto,
                $modelo,
                $ano,
                $color
            )
        );
    } catch (Exception $e) {
        return 0;
        }


    }


    public static function hola(){
        print "hola mundo";
    }
}
?>
