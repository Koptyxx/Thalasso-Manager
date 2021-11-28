<?php
    session_start();
    include("connexion.php");
    $rescha = $cnx->prepare('INSERT INTO reservation(idcli, idchambre, arrivee, depart) VALUES(:idcli, :nb, :date1, :date2)');
    $rescha->execute(array(':idcli'=>$_SESSION["login"], ':nb'=>$_SESSION['nbchambre'], ':date1'=>$_SESSION['venue'], ':date2'=>$_SESSION['depart']));
?>