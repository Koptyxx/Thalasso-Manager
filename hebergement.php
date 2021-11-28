<!DOCTYPE html>
<html>
<head>
  <title>Nos hébergements</title>
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

<center><h1>Nos hébergements</h1>
<h2>Nous proposons différents types d'hébergements</h2>
<p>En effet, vous avez le choix du <b>nombre de personnes</b> par chambre, de la <b>situation</b> de la chambre ainsi que de la <b>vue.</b></p>
<p>Faîtes votre choix :
<form name="Hebergement" method="POST" action="heber2.php">
    Type de chambre 
  <select name="TypeC">
    <option value=""></option>
    <option value="standard simple">Standard simple</option>
    <option value="standard double">Standard double</option>
    <option value="confort simple">Confort simple</option>
    <option value="confort double">Confort double</option>
    <option value="suite">Suite</option>
  </select><br><br>Quelle sera la vue de ma chambre ?
  <select name="Vue">
    <option value=""></option>
    <option value="Mer">Mer</option>
    <option value="Rue">Rue</option>
    <option value="Jardin">Jardin</option>
  </select><br><br>
  Date de venue : <input type="date" name="Dvenue"/><br><br>
  Date de départ : <input type="date" name="Ddépart"/><br><br>
  <input type="submit" name="valider" value="OK"/>
</form>
</center>

</body>
</html>