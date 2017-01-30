<?php


require 'Database.php';



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

    public static function login($email,$clave)
    {
       $comando="CALL login2(?,?)";
        
    try{ $sentencia = Database::getInstance()->getDb()->prepare($comando);
            // Ejecutar sentencia preparada
            $sentencia->execute(array($email,$clave));
            // Capturar primera fila del resultado
            $row = $sentencia->fetch(PDO::FETCH_ASSOC);
            return $row;
    } catch (Exception $e) {
        return -1;
        }

    }



    public static function hola(){
        print "hola mundo";
    }
}
?>
