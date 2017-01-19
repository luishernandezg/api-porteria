<?php


require 'Database.php';


//print Database::getInstance()->getDb()->errorCode();

class Usuario{

    function __construct(){
    }
  /**
     * Insertar un nuevo usuario
     *
     * @param $cedula          string
     * @param $nroexp          string
     * @param $nombre          string
     * @param $apellido        string
     * @param $correo          string
     * @param $telefono        string
     * @param $clave           string
     * @return Retorna 0 en caso de error
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
