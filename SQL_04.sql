mysql> INSERT INTO auteurs(nom,email) VALUES ('George Sand','gsand@example.com'),('Victor Hugo','vhugo@example.com'),('Alexandre Dumas','adumas@example.com'
),('Gustave Flaubert','gflaubert@example.com'),('Marcel Pagnol','mpagnol@example.com');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM auteurs;
+----+------------------+-----------------------+
| id | nom              | email                 |
+----+------------------+-----------------------+
|  1 | George Sand      | gsand@example.com     |
|  2 | Victor Hugo      | vhugo@example.com     |
|  3 | Alexandre Dumas  | adumas@example.com    |
|  4 | Gustave Flaubert | gflaubert@example.com |
|  5 | Marcel Pagnol    | mpagnol@example.com   |
+----+------------------+-----------------------+
5 rows in set (0.00 sec)

------------------------------------------AJOUT DE DONNEES (LIVRES)-------------------------------------------
mysql> INSERT INTO livres (titre, date_creation, auteur_id, categorie_id)VALUES   ('La Mare au Diable', '1846-05-14 13:24:26', 1, 1),  ('Indiana', '1832-03-14 02:10', 1, 1);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> SELECT * FROM livres;
+----+-------------------+---------------------+-----------+--------------+------+
| id | titre             | date_creation       | auteur_id | categorie_id | date |
+----+-------------------+---------------------+-----------+--------------+------+
|  1 | La Mare au Diable | 1846-05-14 13:24:26 |         1 |            1 | NULL |
|  2 | Indiana           | 1832-03-14 02:10:00 |         1 |            1 | NULL |
+----+-------------------+---------------------+-----------+--------------+------+
2 rows in set (0.00 sec)


----------------------------------------AJOUT DE DONNEES LIVRES(Partie 2)----------------------------------------
mysql> INSERT INTO livres (titre, date_creation, auteur_id, categorie_id)VALUES   ('Les Misérables', '1862-03-14 19:29:09', 2, 2),  ('Les Contemplations', '
1856-05-07 15:04:35', 2, 3); 
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO livres (titre, date_creation, auteur_id, categorie_id) VALUES ('Le Comte de Monte-Cristo', '1845-12-20 16-02-01', 3, 2),  ('Les Trois Mou
squetaires', '1844-02-29 10:41:21', 3, 2);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO livres (titre, date_creation, auteur_id, categorie_id) VALUES ('Madame Bovary', '1857-09-18 17:52:58', 4, 1),  ('Salaambo', '1862-07-30 20:15:30', 4, 2);                          
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO livres (titre, date_creation, auteur_id, categorie_id) VALUES   ('La Gloire de mon père', '1957-04-11 22:25:02', 5, 5),  ('Marius', '1929-11-24 12:28:59', 5, 4);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
----------------------RECTIFICATION DE LA COLONNE date_creation pour la date------------------------------------
mysql> ALTER TABLE livre MODIFY COLUMN date_creation DATE;

mysql> ALTER TABLE livres MODIFY COLUMN date_creation DATE;
Query OK, 10 rows affected, 10 warnings (0.14 sec)
Records: 10  Duplicates: 0  Warnings: 10
------------------------------------------------------------------------------
mysql> SELECT * FROM livres;
+----+--------------------------+---------------+-----------+--------------+
| id | titre                    | date_creation | auteur_id | categorie_id |
+----+--------------------------+---------------+-----------+--------------+
|  1 | La Mare au Diable        | 1846-05-14    |         1 |            1 |
|  2 | Indiana                  | 1832-03-14    |         1 |            1 |
|  3 | Les Misérables           | 1862-03-14    |         2 |            2 |
|  4 | Les Contemplations       | 1856-05-07    |         2 |            3 |
|  5 | Le Comte de Monte-Cristo | 1845-12-20    |         3 |            2 |
|  6 | Les Trois Mousquetaires  | 1844-02-29    |         3 |            2 |
|  7 | Madame Bovary            | 1857-09-18    |         4 |            1 |
|  8 | Salaambo                 | 1862-07-30    |         4 |            2 |
|  9 | La Gloire de mon père    | 1957-04-11    |         5 |            5 |
| 10 | Marius                   | 1929-11-24    |         5 |            4 |
+----+--------------------------+---------------+-----------+--------------+
10 rows in set (0.01 sec)