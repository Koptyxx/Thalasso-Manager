<?php
	session_start();
	$_SESSION['login']=$_POST['id'];
 if(isset($_POST["connexion"])){
    $identifiant = $_POST["id"];
    $mdp = $_POST["mdp"];
    include("connexion.php");
    $client = $cnx->query("SELECT idcli, motdepasse FROM client;");
    if($identifiant == NULL or $mdp == NULL){
      header("Location: accueil.php");
    }
    if($identifiant == "admin" and $mdp == "admin"){
      header("Location:premierepageadmin.php");
      exit;
    }
    foreach($client as $cli){
		if($cli['idcli'] == $identifiant and $cli['motdepasse'] == $mdp){
			header("Location:premierepage.php");
			exit;
		}   
		else{
			continue;		
		}
    }
    header("Location:accueil.php");
 }
  else if(isset($_POST["inscription"])){
    include("formulaire_inscription.php");
  }
 ?>
