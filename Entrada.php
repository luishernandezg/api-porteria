<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Entrada{

    function __construct(){
    }
  /**
     * Insertar una nuevo usuario
     *
     * @param $matriculaauto          cedurla del usuario
     * @param $nropuesto          correo electronico
     * @param $fechain          nombre del ususrio
     * @param $horain        apellido del usuario
     * @return PDOStatement
     */
    public static function insert($matriculaauto,$nropuesto) {
        $comando="CALL insertEntrada(?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $matriculaauto,
                $nropuesto
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
