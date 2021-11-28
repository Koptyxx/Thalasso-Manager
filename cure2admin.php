<?php
$idcure = $_POST["idcure"];
$nomcure = $_POST["nomcure"];
$description = $_POST["descure"];
$codepresta = $_POST["codecure"];
include("connexion.php");
$presta = $cnx->prepare('INSERT INTO prestation(codepresta,nompresta) VALUES(:code, :nom)');
$cure = $cnx->prepare('INSERT INTO cure(idcure, nomcure, description, codepresta) VALUES(:id, :nam, :descri, :code)');
$presta->execute(array(':code'=>$_POST["codecure"], ':nom'=>$_POST["nomcure"]));
$cure->execute(array(':id'=>$_POST["idcure"], ':nam'=>$_POST["nomcure"], ':descri'=>$_POST["descure"], ':code'=>$_POST["codecure"]));
header("Location:premierepageadmin.php");
?>