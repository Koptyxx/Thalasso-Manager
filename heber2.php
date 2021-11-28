<?php 
session_start();
$dvenue = $_POST['Dvenue'];
$ddepart = $_POST['Ddépart'];
$_SESSION['venue']= $dvenue;
$_SESSION['depart']=$ddepart;
include("connexion.php");
$nbchambre = $cnx->prepare("SELECT idchambre,tarifh FROM tarifhebergement NATURAL JOIN periode NATURAL JOIN hebergement WHERE :date>debut AND :date < fin AND :vue = situation AND :type = typechambre;");
$nbchambre->execute(array(':date'=>$_POST['Dvenue'], ':vue'=>$_POST['Vue'], ':type'=>$_POST['TypeC']));
$_SESSION['nbchambre'] = $nbchambre; 
?>
<!DOCTYPE html>
<html>
<head>
  <title>Nos propositions</title>
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


<center><h1>Voici nos proposition(s) :</h1>
<?php 
    $typechambre = $_POST['TypeC'];
    $vue = $_POST['Vue'];
    $DateVenue = $_POST['Dvenue'];
    $DateDepart = $_POST['Ddépart'];
    if($DateVenue > $DateDepart or $DateVenue == NULL){
        header("Location:Hebergement.php");
    }
    $results = $cnx->prepare("SELECT idchambre,tarifh FROM tarifhebergement NATURAL JOIN periode NATURAL JOIN hebergement WHERE :date>debut AND :date < fin AND :vue = situation AND :type = typechambre;");
    $results->execute(array(':date'=>$DateVenue, ':vue'=>$vue, ':type'=>$typechambre));
    foreach($results as $res){?>
    <form method='post' action='reservation.php'>
	 	<?php echo "<h3>La chambre numéro ".$res['idchambre']." possède les caractéristiques souahitées à un prix de ".$res['tarifh']." € par nuit</h3>";?>
	 	<input type="submit" name="valider" value="Reserver"/>
	 	</form>  
    <?php } ?>

	
	
	

</center>



</body>
</html>