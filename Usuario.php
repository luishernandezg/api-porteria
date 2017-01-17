<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Usuario{

    function __construct(){
    }
  /**
     * Insertar una nuevo usuario
     *
     * @param $cedula          cedurla del usuario
     * @param $nroexp          correo electronico
     * @param $nombre          nombre del ususrio
     * @param $apellido        apellido del usuario
     * @param $telefono        telf del usuario
     * @param $correo          correo electronico
     * @param $clave           correo electronico
     * @return PDOStatement
     */
    public static function insert($cedula,$nroexp,$nombre,$apellido,$correo,$telefono,$clave) {
        $comando="CALL insertUsuario(?,?,?,?,?,?,?)";
        // Preparar la sentencia reemplaza los (?) por datos del array
        $sentencia = Database::getInstance()->getDb()->prepare($comando);
        
    try{ return $sentencia->execute(
            array(
                $cedula,
                $nroexp,
                $nombre,
                $apellido,
                $correo,
                $telefono,                
                $clave
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
