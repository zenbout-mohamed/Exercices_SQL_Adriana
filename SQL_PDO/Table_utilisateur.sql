mysql> SHOW DATABASES;
+-----------------------+
| Database              |
+-----------------------+
| information_schema    |
| 80jours               |
| blog                  |
| concession_automobile |
| crud                  |
| eshop                 |
| formulaire            |
| librairie             |
| locvoit               |
| membre                |
| mon_site              |
| my_first_bdd          |
| mysql                 |
| mysql-training        |
| nouvelle_appli        |
| performance_schema    |
| phpmyadmin            |
| societe               |
| sys                   |
| testphp               |
| transport_aerien      |
+-----------------------+
21 rows in set (0.01 sec)

mysql> USE formulaire; 
Database changed
mysql> SHOW TABLES;  
+----------------------+
| Tables_in_formulaire |
+----------------------+
| utilisateur          |
+----------------------+
1 row in set (0.00 sec)

mysql> DESCRIBE utilisateur;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| email    | varchar(255) | NO   | UNI | NULL    |                |
| password | varchar(255) | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM utilisateur;
+----+-----------------------+--------------------------------------------------------------+
| id | email                 | password                                                     |
+----+-----------------------+--------------------------------------------------------------+
|  1 | nouno@gmail.com       | $2y$10$xoOiHxGB0CPJzOJGktJWye.v3kaviWsz/QSh8uk4cqLyqC//NNw8C |
|  2 | steph12@gmail.com     | $2y$10$mNK9PglPr5mD4iCpsIF8VO/jnzXsmdo.ShggjCsUhIrJBlEXKJ0fm |
|  3 | sois-disant@gmail.com | $2y$10$QqR9EvFILIhiyFbrN50Xi.CvSvSmMBGVLregZ2wr2HFsjthia4htq |
+----+-----------------------+--------------------------------------------------------------+
3 rows in set (0.01 sec)
