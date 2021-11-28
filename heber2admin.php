<?php
$idchambre = $_POST["idC"];
$situation = $_POST["situ"];
$typechambre = $_POST["TypeC"];
include("connexion.php");
$chambre = $cnx->prepare('INSERT INTO hebergement(idchambre,situation, typechambre) VALUES(:idc, :situa, :typec)');
$chambre->execute(array(':idc'=>$_POST["idC"], ':situa'=>$_POST["situ"], ':typec'=>$_POST["TypeC"]));
header("Location:premierepageadmin.php");
?>