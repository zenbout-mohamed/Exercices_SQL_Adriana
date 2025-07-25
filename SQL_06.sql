mysql> UPDATE avions SET autonomie_km = 6300 WHERE modele = 'A320';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE avions SET constructeur = 'Boeing' WHERE constructeur = 'McDonnell Douglas';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE avions SET capacite = capacite + 10 WHERE constructeur = 'Bombardier';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> DELETE FROM avions WHERE capacite < 100;
Query OK, 1 row affected (0.01 sec)

mysql> DELETE FROM avions WHERE en_service = 0;
Query OK, 3 rows affected (0.01 sec)
