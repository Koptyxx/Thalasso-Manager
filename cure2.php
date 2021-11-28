<!DOCTYPE html>
<html>
<head>
  <title>Cure</title>
  <link rel="stylesheet" href="premiere.css">
</head>

<body>

<ul class="navbar">
  <li><a href="premierepage.php">Home page</a>
  <li><a href="cure.php">Cure</a>
  <li><a href="weekend.php">Week-end</a>
  <li><a href="hebergement.php">Hebergement</a>
  <li><a href = "accueil.php">Deconnexion</a>
</ul>

<center><h1>Description de votre cure :</h1></center>
<?php
    $Nomcure = $_POST["champ"];
    $Datevenue = $_POST["Dvenue"];
    include("connexion.php");
    $results = $cnx->prepare("SELECT description FROM cure WHERE nomcure = :nom");
    $results->execute(array(':nom'=>$Nomcure));
    $results2 = $cnx->prepare("SELECT libelleso FROM cure NATURAL JOIN contient NATURAL JOIN soins WHERE nomcure = :libelle");
    $results2->execute(array(':libelle'=>$Nomcure));
    $results3 = $cnx->prepare("SELECT tarifp FROM cure NATURAL JOIN tarifprestation NATURAL JOIN periode WHERE debut<= :date AND :date <=fin AND :nom = nomcure");
    $results3->execute(array(':date'=>$Datevenue, ':nom'=>$Nomcure));
    foreach($results as $res){
    echo "<h3>Description de la cure ".$Nomcure." :</h3> ".$res['description']."";}
    echo "<h3>Votre cure est composée des soins suivants :</h3>";
    echo "<ol>";
    foreach($results2 as $res){
      echo "<li>".$res['libelleso']."</li>";
    }
    echo "</ol>";
    foreach($results3 as $res){
    	echo "<h3>Prix : ".$res['tarifp']." €</h3>";}
?>
</body>
</html>