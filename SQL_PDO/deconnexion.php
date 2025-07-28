<!-- Cette page permet de détruire la session auc ca sou l'utilisateur tente de se déconnecter et sera redirigé vers la page de connexion. -->
<?php
$session_start();
$session_destroy();
header("Location: connexion.php");
exit; ?>