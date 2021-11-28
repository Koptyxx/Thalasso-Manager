<!DOCTYPE html>
<html>
<head>
  <title>Heberadmin</title>
  <link rel="stylesheet" href="premiere.css">
</head>

<body>

<!-- Menu de navigation du site -->
<ul class="navbar">
  <li><a href="premierepageadmin.php">Home page</a>
  <li><a href="cureadmin.php">Insertion Cure</a>
  <li><a href ="hebergementadmin.php">Insertion Hebergement</a>
  <li><a href = "accueil.php">Deconnexion</a>
</ul>

<!-- Contenu principal -->
<center><h1>Nos hebergements</h1></center>
<h2>Une nouvelle chambre ? Insérez la dans votre base !</h2>
<form name="Heberadmin" method="POST" action="heber2admin.php">
Identifiant de la chambre : <input type="number" name="idC"/><br></br>
Situation de la chambre : <input type="text" name="situ"/><br></br>
Type de chambre : <select name="TypeC">
    <option value=""></option>
    <option value="standard simple">Standard simple</option>
    <option value="standard double">Standard double</option>
    <option value="confort simple">Confort simple</option>
    <option value="confort double">Confort double</option>
    <option value="suite">Suite</option>
  </select>
  <input type="submit" name="valider" value="OK"/>
</form>



</body>
</html>