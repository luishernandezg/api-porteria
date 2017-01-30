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
     * @param $fechain          nombre del ususrio
     * @param $horain        apellido del usuario
     * @return PDOStatement si tiene exito, 0 en caso de error
     */
    public static function getEntrada()
    {
       $comando="CALL getEntrada()";
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{  
            $sentencia->execute();
            return $sentencia->fetchAll(PDO::FETCH_ASSOC);
        
        } catch (Exception $e) {
        return 0;
        }


    }




    public static function hola(){
        print "hola mundo";
    }
}
?>
