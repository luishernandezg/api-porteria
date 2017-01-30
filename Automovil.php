<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Automovil{

    function __construct(){
    }
  /**
     * Insertar una nuevo automovil
     *
     * @param  $matricula       string        
     * @param  $modelo          string
     * @param  $ano             int          
     * @param  $color           string
     * @return Retorna 0 en caso de error
     */
    public static function insert($matricula,$modelo,$ano,$color) {
        $comando="CALL insertAutomovil(?,?,?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $matricula,
                $modelo,
                $ano,
                $color
            )
        );
    } catch (Exception $e) {
        return 0;
        }


    }

// Funcion delete: esta funcion se encarga de borrar el auto del usuario que se encuentra en el sistema
    public static function deleteAutomovil($ciusuario,$matricula) {
        $comando="CALL deleteAutomovil(?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $ciusuario,
                $matricula,
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
