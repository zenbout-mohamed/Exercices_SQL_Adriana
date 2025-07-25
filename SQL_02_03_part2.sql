mysql> USE librairie;
Database changed
mysql> CREATE TABLE auteurs (  id INT AUTO_INCREMENT PRIMARY KEY,    nom VARCHAR(100) NOT NULL,    email VARCHAR(100) UNIQUE);    
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE categories (  id INT AUTO_INCREMENT PRIMARY KEY,    nom VARCHAR(100) NOT NULL);
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE livres (id INT AUTO_INCREMENT PRIMARY KEY,    titre VARCHAR(100) NOT NULL,    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,    auteur_id INT,    categorie_id INT,    FOREIGN KEY (auteur_id) REFERENCES auteurs(id),    FOREIGN KEY (categorie_id) REFERENCES categories(id));
Query OK, 0 rows affected (0.07 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_librairie |
+---------------------+
| auteurs             |
| categories          |
| livres              |
+---------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE auteurs;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom   | varchar(100) | NO   |     | NULL    |                |
| email | varchar(100) | YES  | UNI | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> DESCRIBE categories;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom   | varchar(100) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
2 rows in set (0.01 sec)
---------------------------------------------------------------------------------
mysql> DESCRIBE livres;
+---------------+--------------+------+-----+-------------------+----------------+
| Field         | Type         | Null | Key | Default           | Extra          |
+---------------+--------------+------+-----+-------------------+----------------+
| id            | int(11)      | NO   | PRI | NULL              | auto_increment |
| titre         | varchar(100) | NO   |     | NULL              |                |
| date_creation | datetime     | YES  |     | CURRENT_TIMESTAMP |                |
| auteur_id     | int(11)      | YES  | MUL | NULL              |                |
| categorie_id  | int(11)      | YES  | MUL | NULL              |                |
+---------------+--------------+------+-----+-------------------+----------------+
5 rows in set (0.01 sec)

mysql> INSERT INTO categories(nom) VALUES ('Roman historique'),('Poésie'),('Théatre'),('Roman réaliste'),('Littérature jeunesse');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM categories;
+----+----------------------+
| id | nom                  |
+----+----------------------+
|  1 | Roman historique     |
|  2 | Poésie               |
|  3 | Théatre              |
|  4 | Roman réaliste       |
|  5 | Littérature jeunesse |
+----+----------------------+
5 rows in set (0.00 sec)
