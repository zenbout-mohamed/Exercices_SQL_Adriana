<?php
// Chemin vers le fichier .env.local 
$envPath = file_exists(__DIR__ . '/../.env.local') 
// Lit le fichier .env.local pour récupérer les identifiants.
// Vérifie si le fichier .env.local existe. Si oui, il l'utilise.
// Sinon, il essaye d'utiliser .env en secours.
    ? __DIR__ . '/../.env.local' 
    : __DIR__ . '/../.env';

// Lecture des infos de connexion avec la fonction parse_ini_file
$env = parse_ini_file($envPath);

$host = $env['DB_HOST'];
$db   = $env['DB_NAME'];
$user = $env['DB_USER'];
$pass = $env['DB_PASS'];

// Construction du DSN après lecture du .env.local
$dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";
// Établit une connexion sécurisée avec PDO.
// En cas d'erreur, affiche un message clair.
try {
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Erreur de connexion : ' . $e->getMessage());
}
