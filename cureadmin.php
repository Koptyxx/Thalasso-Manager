<!DOCTYPE html>
<html>
<head>
  <title>Cureadmin</title>
  <link rel="stylesheet" href="premiere.css">
</head>

<body>

<ul class="navbar">
  <li><a href="premierepageadmin.php">Home page</a>
  <li><a href="cureadmin.php">Insertion Cure</a>
  <li><a href ="hebergementadmin.php">Insertion Hebergement</a>
  <li><a href = "accueil.php">Deconnexion</a>
</ul>


<center><h1>Nos cures</h1></center>
<h2>Une nouvelle cure au programme ? Insérez la dans votre base !</h2>
<form name="Curesadmin" method="POST" action="cure2admin.php">
Identifiant de la cure : <input type="text" name="idcure"/><br></br>
Nom de la cure : <input type = "text" name="nomcure"/><br></br>
Description de la cure : <input type="text" name="descure"/><br></br>
Code de la prestation : <input type="text" name="codecure"/><br></br>
  <input type="submit" name="valider" value="OK"/>
</form>



</body>
</html>