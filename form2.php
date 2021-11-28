<?php
  $identifiant = $_POST["id"];
  $mdp = $_POST["mdp"];
  $mdp2 = $_POST["mdp2"];
  $tel = $_POST["tel"];
  if($mdp != $mdp2 or $identifiant == NULL or $mdp == NULL or $mdp2 == NULL or $tel == NULL){
    header("Location: formulaire_inscription.php");
  }
  else{
    include("connexion.php");
    $verif = $cnx->prepare('INSERT INTO client(idcli,motdepasse,numtel) VALUES(:identifiant, :mdp, :numtel)');
    $verif->execute(array(':identifiant'=>$_POST["id"], ':mdp'=>$_POST["mdp"], ':numtel'=>$_POST['tel']));
    include("premierepage.php");
  }
?>