<?php

require_once '../conector/conector.php';

class modelo_ikasleak {

    private $link;
    private $respuesta;

    public function __construct() {
        $this->link = Conectar::conexion();
        $this->respuesta = array();
    }

    public function get_ikasleak() {
        $sql = "CALL sp_mostrarIkasleak()";
        $consulta = $this->link->query($sql);
        while ($row = mysqli_fetch_array($consulta, MYSQLI_ASSOC)) {
            $this->respuesta[] = $row;
        }
        $consulta->free_result();
        $this->link->close();
        return $this->respuesta;
    }

    public function insertarIkasleak($nombre, $apellido, $apellido2, $ciclo, $curso) {
        $sql= "CALL sp_insertarIkasleak('$nombre','$apellido','$apellido2','$ciclo','$curso')";
        $consulta = $this->link->query($sql);
        $row = mysqli_fetch_array($consulta, MYSQLI_ASSOC);
        $this->id =$row['id'];
        $consulta->free_result();
        $this->link->close();
        return $this->respuesta;
                
    }
    
    public function borrarIkasleak($id) {
        $this->link->query("CALL sp_borrarIkasleak('$id')");
    }
    
    public function modificarIkasleak($id,$nombre,$apellido, $apellido2, $ciclo, $curso) {
        $this->link->query("CALL sp_modificarIkasleak('$id','$nombre','$apellido','$apellido2','$ciclo','$curso')");
        
    }

}
