<?php
$user = 'sghamri';
$pass = 'Samy77100';

try{
    $cnx = new PDO('pgsql:host=sqletud.u-pem.fr; dbname=sghamri_db', $user, $pass);
}
catch(PDOException $e){
    echo "Erreur de connexion";
    echo "Erreur: " . $e;
}
?>