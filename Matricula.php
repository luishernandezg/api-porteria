<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Matricula{

    function __construct(){
    }
  /**
     * Insertar una nuevo usuario
     *
     * @param $ciusuario          cedurla del usuario
     * @param $matriculaauto          correo electronico
     * @param $parentesco         nombre del ususrio
     * @return PDOStatement
     */
    public static function insert($ciusuario,$matriculaauto,$parentesco) {
        $comando="CALL insertMatricula(?,?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $ciusuario,
                $matriculaauto,               
                $parentesco
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
