<?php session_start();

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/functions.php';
require_once __DIR__ . '/config/config.php';

// Nous utilisons une condition imbriqué pour donner cdes conditions supplémentaire pour le champ du mot de passe.
// L'utilisateur remplit le formulaire.
// PHP vérifie :
// Si les mots de passe sont identiques.
// S'ils sont suffisamment longs.
// Si l’email est déjà utilisé.
// Si tout est OK :
// Le mot de passe est haché.
// L'utilisateur est enregistré en base.
// Redirection vers connexion.php.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $mot_de_passe = $_POST['password'];
    $confirmation_pass = $_POST['confirmation_pass'];

    if ($mot_de_passe !== $confirmation_pass) {
        $erreur = "Les mots de passe ne correspondent pas.";
    } elseif (strlen($mot_de_passe) < 8) {
        $erreur = "Le mot de passe doit contenir au moins 8 caractères.";
    } elseif (findUserByEmail($pdo, $email)) {
        $erreur = "Cet email est déjà utilisé.";
    } else {
        $mot_de_passe_hash = password_hash($mot_de_passe, PASSWORD_DEFAULT);
        createUser($pdo, $email, $mot_de_passe_hash);
        header("Location: connexion.php");
        exit;
    }
    // Affiche le formulaire d’inscription + traite les données envoyées.
}
?>



<!-- STRUCTURE HTML POUR LES CHAMPS CREE  -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fichier-Inscription</title>
</head>
<body>
    <main>
        <?php if (isset($erreur)) : ?>
            <p style="color: red;"><?= htmlspecialchars($erreur) ?></p>
        <?php endif; ?>
        <form action="inscription.php" method="post">
            <fieldset>
                <legend>Inscription </legend>
                <hr>
                <label for="email"> Email:
                    <input type="email" name="email" placeholder="Veuillez entrer votre email :">
                </label>
                <label for="password"> Mot de Passe :
                    <input type="password" name="password" placeholder="Veuillez entrer votre mot de passe :">
                </label>
                <label for="confirmation_pass"> Confirmation mot de passe :
                    <input type="password" name="confirmation_pass" placeholder="Confirmez votre mot de passe :">
                </label>
                <hr>
            </fieldset>
            <button type="submit">Inscription</button>
        </form>
    </main>
</body>

</html>