<?php

require_once '../modelo/modelo_Ikasleak.php';
$id = $_GET['value'];
//$datos = json_decode($datos);
//$id = $datos->id;
$cont = new modelo_ikasleak();
$cont->borrarIkasleak($id);
