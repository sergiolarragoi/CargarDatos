<?php

require_once("../modelo/modelo_Ikasleak.php");
$cont = new modelo_ikasleak();
$datos = $cont->get_ikasleak();

$ikasleak = json_encode($datos);
print $ikasleak;
