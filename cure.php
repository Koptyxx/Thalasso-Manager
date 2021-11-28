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


<center><h1>Nos cures</h1></center>
<h2>Nous proposons différents types de cures</h2>
<form name="Cures" method="POST" action="cure2.php">
    Veuillez selectionner votre type de cure : 
  <select name="champ">
    <option value = ""></option>
    <option value="Bien-etre">Bien-être</option>
    <option value="Remise en forme">Remise en forme</option>
    <option value="Santé">Santé</option>
    <option value="Amincissement">Amincissement</option>
    <option value="Postnatale">Postanatale</option>
    <option value="Anti-age">Anti-âge</option>
    <option value="Sante du dos">Santé du dos</option>
    <option value="Sante des jambes">Santé des jambes</option>
  </select><br><br>
  Date de venue : <input type="date" name="Dvenue"/><br><br>
  Date de départ : <input type="date" name="Ddépart"/><br><br>
  <input type="submit" name="valider" value="OK"/>
</form>



</body>
</html>