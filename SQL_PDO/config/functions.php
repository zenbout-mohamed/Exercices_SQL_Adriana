<?php
// *ANCHOR - La fonction permet de chercher dans la base de données si un utilisateur existe déjà avec cet email.
// *ANCHOR -  La fonction findUserByEmail Elle permet de vérifier si un utilisateur existe déjà dans la base de données en cherchant par email.
//  Dans l'inscription : pour empêcher que deux comptes aient le même email.
//  Dans la connexion : pour retrouver l’utilisateur afin de comparer le mot de passe entré avec celui en base.

function findUserByEmail(PDO $pdo, string $email): ?array {
    $stmt = $pdo->prepare("SELECT * FROM utilisateur WHERE email = :email");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    return $user ?: null;
}
// *ANCHOR - La fonction permet d'insérer un nouvel utilisateur dans la base avec son email et son mot de passe sécurisé.
// *ANCHOR - La fonction createUser permet à insérer un nouvel utilisateur dans la base de données, donc c’est une fonction d’inscription.
// le type void signifie que la fonction ne retourne rien.
function createUser(PDO $pdo, string $email, string $password): void {
    $stmt = $pdo->prepare("INSERT INTO utilisateur (email, password) VALUES (:email, :password)");
    $stmt->execute([
        'email' => $email,
        'password' => $password
    ]);
}

?>