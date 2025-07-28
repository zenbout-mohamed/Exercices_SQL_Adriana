<?php
session_start();
//  Plus de bug de chemin si on appelle une page depuis un sous-dossier ou via une autre inclusion.

require_once __DIR__ . '/config/database.php'; // connexion à MySQL
require_once __DIR__ . '/config/functions.php'; // findUserByEmail + createUser
require_once __DIR__ . '/config/config.php'; // si besoin de constantes


// Formulaire de connexion + vérification des identifiants.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $pass = $_POST['password'];
    $user = findUserByEmail($pdo, $email);
// L'utilisateur entre son email et mot de passe.
// Le script vérifie si un utilisateur avec cet email existe.
// Si oui → on compare les mots de passe avec password_verify.
// Si OK → on connecte l’utilisateur avec $_SESSION.
    if ($user && password_verify($pass, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['email'] = $user['email'];
        header("Location: dashboard.php");
        exit;
    } else {
        $erreur = "Email ou mot de passe incorrect.";
    }
}
?>
<!-- STRUCTURE HTML POUR LA CREATION DES CHAMPS REQUIS DE LA PAGE CONNEXION -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fichier-Connexion</title>
</head>
<body>
    <main>
        <?php if (isset($erreur)) : ?>
            <p style="color: red;"><?= htmlspecialchars($erreur) ?></p>
        <?php endif; ?>

        <form action="connexion.php" method="post">
            <fieldset>
                <legend>Connexion </legend>
                <hr>
                <label for="email"> Email:
                    <input type="email" name="email" required>
                </label>
                <label for="password"> Mot de Passe :
                    <input type="password" name="password" required>
                </label>
                <hr>
            </fieldset>
            <button type="submit">Connexion</button>
        </form>
    </main>
</body>

</html>