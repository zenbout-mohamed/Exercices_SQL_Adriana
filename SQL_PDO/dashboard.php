<?php
// session_start démarre la session PHP, indispensable pour accéder aux variables de session $_SESSION.
// Cela permet de vérifier si un utilisateur est connecté.
session_start();

// Vérifie si l'utilisateur est connecté.
// Si $_SESSION 'user_id' n'existe pas, cela signifie que la personne n’est pas connectée.
// On la redirige alors vers la page de connexion.
// exit; interrompt le script pour éviter qu’un non-connecté accède au reste de la page.
if (!isset($_SESSION['user_id'])) {
    header("Location: connexion.php");
    exit;
}

require_once __DIR__ .'/config/database.php';

// On exécute une requête SQL :
// SELECT email FROM utilisateur récupère tous les emails des utilisateurs dans la table utilisateur
$stmt = $pdo->query("SELECT email FROM utilisateur");
// Puis on récupère tous les résultats sous forme de tableau associatif grâce à fetchAll(PDO::FETCH_ASSOC)
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

//*ANCHOR Ca évite qu’un visiteur non connecté puisse accéder à des pages réservées aux utilisateurs inscrits. C’est une base de sécurité dans tout site web avec authentification.
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <main>
        <h1>Bienvenue <?= htmlspecialchars($_SESSION['email']) ?></h1>
            <hr>
            <p>Liste des utilisateurs inscrits :</p>
                <a href="connexion.php">Déconnexion</a>
                <!-- Boucle permettant de lister tous les utilisateurs connecté en affichant leurs adresse mails -->
            <ul>
                <?php foreach ($users as $user): ?>
                    <li><?= htmlspecialchars($user['email']) ?></li>
                <?php endforeach; ?>
            </ul>
    </main>
    

    
</body>
</html>

