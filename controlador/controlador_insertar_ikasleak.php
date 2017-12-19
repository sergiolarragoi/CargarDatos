<?php

require_once '../modelo/modelo_Ikasleak.php';
$datos = $_GET['value'];
$datos = json_decode($datos);
$nombre = $datos->nombre;
$apellido = $datos->apellido1;
$apellido2 = $datos->apellido2;
$ciclo = $datos->ciclo;
$curso = $datos->curso;
$cont = new modelo_ikasleak();
$cont->insertarIkasleak($nombre, $apellido, $apellido2, $ciclo, $curso);
$sacar_id=$cont->id;
print ($sacar_id);
