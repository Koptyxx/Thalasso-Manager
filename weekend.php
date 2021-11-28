<!DOCTYPE html>
<html>
<head>
  <title>Nos week-ends</title>
  <link rel="stylesheet" href="premiere.css">
</head>

<body>

<!-- Menu de navigation du site -->
<ul class="navbar">
  <li><a href="premierepage.php">Home page</a>
  <li><a href="cure.php">Cure</a>
  <li><a href="weekend.php">Week-end</a>
  <li><a href="hebergement.php">Hebergement</a>
  <li><a href = "accueil.php">Deconnexion</a>
</ul>

<!-- Contenu principal -->
<center><h1>Nos week-ends</h1></center>
<h2>Nous proposons différents type de week-ends</h2>
<form name="WE" method="POST" action="">
    Veuillez selectionner votre type de cure : 
  <select name="champ">
    <option value=""></option>
    <option value="DE">Détente</option>
    <option value="BF">Beauté-Fraicheur</option>
    <input type="submit" name="valider" value="OK"/>
  </select>
</form>
<address>Adresse : 101 rue des Canadiens<br>
Contact : thalassotouquet@gmail.com
  </address>

</body>
</html>