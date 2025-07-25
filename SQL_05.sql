mysql> SELECT * FROM livres WHERE YEAR(date_creation) < 1900;
+----+--------------------------+---------------------+-----------+--------------+
| id | titre                    | date_creation       | auteur_id | categorie_id |
+----+--------------------------+---------------------+-----------+--------------+
|  1 | La Mare au Diable        | 1846-05-14 13:24:26 |         1 |            1 |
|  2 | Indiana                  | 1832-03-14 02:10:00 |         1 |            1 |
|  3 | Les Misérables           | 1862-03-14 19:29:09 |         2 |            2 |
|  4 | Les Contemplations       | 1856-05-07 15:04:35 |         2 |            3 |
|  5 | Le Comte de Monte-Cristo | 1845-12-20 16:02:01 |         3 |            2 |
|  6 | Les Trois Mousquetaires  | 1844-02-29 10:41:21 |         3 |            2 |
|  7 | Madame Bovary            | 1857-09-18 17:52:58 |         4 |            1 |
|  8 | Salaambo                 | 1862-07-30 20:15:30 |         4 |            2 |
+----+--------------------------+---------------------+-----------+--------------+
8 rows in set (0.01 sec)


mysql> SELECT * FROM livres ORDER BY (date_creation) ASC;
+----+--------------------------+---------------------+-----------+--------------+
| id | titre                    | date_creation       | auteur_id | categorie_id |
+----+--------------------------+---------------------+-----------+--------------+
|  2 | Indiana                  | 1832-03-14 02:10:00 |         1 |            1 |
|  6 | Les Trois Mousquetaires  | 1844-02-29 10:41:21 |         3 |            2 |
|  5 | Le Comte de Monte-Cristo | 1845-12-20 16:02:01 |         3 |            2 |
|  1 | La Mare au Diable        | 1846-05-14 13:24:26 |         1 |            1 |
|  4 | Les Contemplations       | 1856-05-07 15:04:35 |         2 |            3 |
|  7 | Madame Bovary            | 1857-09-18 17:52:58 |         4 |            1 |
|  3 | Les Misérables           | 1862-03-14 19:29:09 |         2 |            2 |
|  8 | Salaambo                 | 1862-07-30 20:15:30 |         4 |            2 |
| 10 | Marius                   | 1929-11-24 12:28:59 |         5 |            4 |
|  9 | La Gloire de mon père    | 1957-04-11 22:25:02 |         5 |            5 |
+----+--------------------------+---------------------+-----------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT FLOOR(YEAR(date_creation) * 10) * 10 AS decennie , COUNT(*) AS nb_livres FROM livres GROUP BY decennie ORDER BY decennie; 
+----------+-----------+
| decennie | nb_livres |
+----------+-----------+
|   183200 |         1 |
|   184400 |         1 |
|   184500 |         1 |
|   184600 |         1 |
|   185600 |         1 |
|   185700 |         1 |
|   186200 |         2 |
|   192900 |         1 |
|   195700 |         1 |
+----------+-----------+
9 rows in set (0.00 sec)


mysql> SELECT titre, YEAR(date_creation) AS date, FLOOR(YEAR(date_creation)/10) * 10 AS decennie FROM livres ORDER BY decennie;  
+--------------------------+------+----------+
| titre                    | date | decennie |
+--------------------------+------+----------+
| Indiana                  | 1832 |     1830 |
| La Mare au Diable        | 1846 |     1840 |
| Le Comte de Monte-Cristo | 1845 |     1840 |
| Les Trois Mousquetaires  | 1844 |     1840 |
| Les Contemplations       | 1856 |     1850 |
| Madame Bovary            | 1857 |     1850 |
| Les Misérables           | 1862 |     1860 |
| Salaambo                 | 1862 |     1860 |
| Marius                   | 1929 |     1920 |
| La Gloire de mon père    | 1957 |     1950 |
+--------------------------+------+----------+
10 rows in set (0.00 sec)

-----------------------EXERCIEC 2 :

mysql> CREATE DATABASE transport_aerien;
Query OK, 1 row affected (0.00 sec)

mysql> USE transport_aerien;
Database changed

mysql> CREATE TABLE avions ( id INT AUTO_INCREMENT PRIMARY KEY, modele VARCHAR(100) NOT NULL, constructeur VARCHAR(100) NOT NULL, capacite INT NOT NULL, aut
onomie_km INT NOT NULL, en_service BOOLEAN NOT NULL);                  
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO avions (modele, constructeur, capacite, autonomie_km, en_service) VALUES ('A320', 'Airbus', 180, 6150, TRUE),('A380', 'Airbus', 853, 1520
0, TRUE),('737 MAX', 'Boeing', 210, 6570, TRUE),('747-400', 'Boeing', 416, 13450, FALSE),('CSeries 300', 'Bombardier', 160, 6112, TRUE),('MD-11', 'McDonnell Douglas', 293, 12555, FALSE),('Concorde', 'Aérospatiale/BAC', 92, 7250, FALSE),('E190', 'Embraer', 114, 4260, TRUE),('CRJ900', 'Bombardier', 90, 2956, TRUE),('Il-96', 'Ilyushin', 262, 11000, FALSE);
Query OK, 10 rows affected (0.04 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM avions;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  2 | A380        | Airbus            |      853 |        15200 |          1 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  4 | 747-400     | Boeing            |      416 |        13450 |          0 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
|  7 | Concorde    | Aérospatiale/BAC  |       92 |         7250 |          0 |
|  8 | E190        | Embraer           |      114 |         4260 |          1 |
|  9 | CRJ900      | Bombardier        |       90 |         2956 |          1 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
+----+-------------+-------------------+----------+--------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT modele, constructeur FROM avions;
+-------------+-------------------+
| modele      | constructeur      |
+-------------+-------------------+
| A320        | Airbus            |
| A380        | Airbus            |
| 737 MAX     | Boeing            |
| 747-400     | Boeing            |
| CSeries 300 | Bombardier        |
| MD-11       | McDonnell Douglas |
| Concorde    | Aérospatiale/BAC  |
| E190        | Embraer           |
| CRJ900      | Bombardier        |
| Il-96       | Ilyushin          |
+-------------+-------------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE capacite > 300;
+----+---------+--------------+----------+--------------+------------+
| id | modele  | constructeur | capacite | autonomie_km | en_service |
+----+---------+--------------+----------+--------------+------------+
|  2 | A380    | Airbus       |      853 |        15200 |          1 |
|  4 | 747-400 | Boeing       |      416 |        13450 |          0 |
+----+---------+--------------+----------+--------------+------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE autonomie_km > 300;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  2 | A380        | Airbus            |      853 |        15200 |          1 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  4 | 747-400     | Boeing            |      416 |        13450 |          0 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
|  7 | Concorde    | Aérospatiale/BAC  |       92 |         7250 |          0 |
|  8 | E190        | Embraer           |      114 |         4260 |          1 |
|  9 | CRJ900      | Bombardier        |       90 |         2956 |          1 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
+----+-------------+-------------------+----------+--------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE en_service = 0;
+----+----------+-------------------+----------+--------------+------------+
| id | modele   | constructeur      | capacite | autonomie_km | en_service |
+----+----------+-------------------+----------+--------------+------------+
|  4 | 747-400  | Boeing            |      416 |        13450 |          0 |
|  6 | MD-11    | McDonnell Douglas |      293 |        12555 |          0 |
|  7 | Concorde | Aérospatiale/BAC  |       92 |         7250 |          0 |
| 10 | Il-96    | Ilyushin          |      262 |        11000 |          0 |
+----+----------+-------------------+----------+--------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE constructeur = 'Boeing';
+----+---------+--------------+----------+--------------+------------+
| id | modele  | constructeur | capacite | autonomie_km | en_service |
+----+---------+--------------+----------+--------------+------------+
|  3 | 737 MAX | Boeing       |      210 |         6570 |          1 |
|  4 | 747-400 | Boeing       |      416 |        13450 |          0 |
+----+---------+--------------+----------+--------------+------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE capacite BETWEEN 100 AND 300;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
|  8 | E190        | Embraer           |      114 |         4260 |          1 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
+----+-------------+-------------------+----------+--------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT constructeur FROM avions;
+-------------------+
| constructeur      |
+-------------------+
| Airbus            |
| Boeing            |
| Bombardier        |
| McDonnell Douglas |
| Aérospatiale/BAC  |
| Embraer           |
| Ilyushin          |
+-------------------+
7 rows in set (0.00 sec)


mysql> SELECT * FROM avions ORDER BY autonomie_km ASC;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  9 | CRJ900      | Bombardier        |       90 |         2956 |          1 |
|  8 | E190        | Embraer           |      114 |         4260 |          1 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  7 | Concorde    | Aérospatiale/BAC  |       92 |         7250 |          0 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
|  4 | 747-400     | Boeing            |      416 |        13450 |          0 |
|  2 | A380        | Airbus            |      853 |        15200 |          1 |
+----+-------------+-------------------+----------+--------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM avions ORDER BY autonomie_km DESC;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  2 | A380        | Airbus            |      853 |        15200 |          1 |
|  4 | 747-400     | Boeing            |      416 |        13450 |          0 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
|  7 | Concorde    | Aérospatiale/BAC  |       92 |         7250 |          0 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  8 | E190        | Embraer           |      114 |         4260 |          1 |
|  9 | CRJ900      | Bombardier        |       90 |         2956 |          1 |
+----+-------------+-------------------+----------+--------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM avions ORDER BY autonomie_km DESC LIMIT 3;
+----+---------+-------------------+----------+--------------+------------+
| id | modele  | constructeur      | capacite | autonomie_km | en_service |
+----+---------+-------------------+----------+--------------+------------+
|  2 | A380    | Airbus            |      853 |        15200 |          1 |
|  4 | 747-400 | Boeing            |      416 |        13450 |          0 |
|  6 | MD-11   | McDonnell Douglas |      293 |        12555 |          0 |
+----+---------+-------------------+----------+--------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM avions ORDER BY capacite ASC LIMIT 5;
+----+-------------+------------------+----------+--------------+------------+
| id | modele      | constructeur     | capacite | autonomie_km | en_service |
+----+-------------+------------------+----------+--------------+------------+
|  9 | CRJ900      | Bombardier       |       90 |         2956 |          1 |
|  7 | Concorde    | Aérospatiale/BAC |       92 |         7250 |          0 |
|  8 | E190        | Embraer          |      114 |         4260 |          1 |
|  5 | CSeries 300 | Bombardier       |      160 |         6112 |          1 |
|  1 | A320        | Airbus           |      180 |         6150 |          1 |
+----+-------------+------------------+----------+--------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM avions WHERE autonomie_km BETWEEN 6000 AND 13000;
+----+-------------+-------------------+----------+--------------+------------+
| id | modele      | constructeur      | capacite | autonomie_km | en_service |
+----+-------------+-------------------+----------+--------------+------------+
|  1 | A320        | Airbus            |      180 |         6150 |          1 |
|  3 | 737 MAX     | Boeing            |      210 |         6570 |          1 |
|  5 | CSeries 300 | Bombardier        |      160 |         6112 |          1 |
|  6 | MD-11       | McDonnell Douglas |      293 |        12555 |          0 |
|  7 | Concorde    | Aérospatiale/BAC  |       92 |         7250 |          0 |
| 10 | Il-96       | Ilyushin          |      262 |        11000 |          0 |
+----+-------------+-------------------+----------+--------------+------------+
6 rows in set (0.00 sec)