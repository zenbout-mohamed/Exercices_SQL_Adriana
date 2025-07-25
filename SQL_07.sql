mysql> CREATE DATABASE societe;
Query OK, 1 row affected (0.01 sec)

mysql> USE societe;
Database changed

mysql> CREATE TABLE societe ( id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(100) NOT NULL);
Query OK, 0 rows affected (0.07 sec)

mysql> RENAME TABLE societe TO departement;
Query OK, 0 rows affected (0.05 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_societe |
+-------------------+
| departement       |
+-------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE employes (id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(100) NOT NULL, prenom VARCHAR(100) NOT NULL, id_departement INT NOT NULL, FOREIGN KEY (id_departement) REFERENCES departement(id));                  
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE projets (id INT AUTO_INCREMENT PRIMARY KEY, titre VARCHAR(100), budget DECIMAL(10,2));        
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE projets_employes(id_employe INT , id_projets INT, role VARCHAR (100), PRIMARY KEY (id_employe, id_projets), FOREIGN KEY (id_employe) REFERENCES employes(id), FOREIGN KEY (id_projets) REFERENCES projets(id));
Query OK, 0 rows affected (0.08 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_societe |
+-------------------+
| departement       |
| employes          |
| projets           |
| projets_employes  |
+-------------------+
4 rows in set (0.00 sec)

mysql> DESCRIBE departement;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom   | varchar(100) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE employes;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| id             | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom            | varchar(100) | NO   |     | NULL    |                |
| prenom         | varchar(100) | NO   |     | NULL    |                |
| id_departement | int(11)      | NO   | MUL | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> DESCRIBLE projets;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIBLE projets' at line 1
mysql> DESCRIBE projets;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int(11)       | NO   | PRI | NULL    | auto_increment |
| titre  | varchar(100)  | YES  |     | NULL    |                |
| budget | decimal(10,2) | YES  |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> DESCRIBE projets_employes;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id_employe | int(11)      | NO   | PRI | NULL    |       |
| id_projets | int(11)      | NO   | PRI | NULL    |       |
| role       | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

---------------------------------------------------EXERCICE 2 :

mysql> CREATE DATABASE concession_automobile;
Query OK, 1 row affected (0.00 sec)

mysql> USE concession_automobile;
Database changed

mysql> CREATE TABLE model_auto (id INT AUTO_INCREMENT PRIMARY KEY, marque VARCHAR(100) NOT NULL, modele VARCHAR(100) NOT NULL, carburant VARCHAR(100), puiss
ance INT, prix DECIMAL(10,2)); 
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE voiture ( num_serie_unique VARCHAR(100) PRIMARY KEY, date_arrivee_stock DATE NOT NULL, etat VARCHAR(100) DEFAULT 'disponible', id_modele
 INT NOT NULL, FOREIGN KEY (id_modele) REFERENCES model_auto(id));                                 
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE client (id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(100) NOT NULL, prenom VARCHAR(100) NOT NULL, email VARCHAR(100),telephone VARCHAR
(20));
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE commande(id INT AUTO_INCREMENT PRIMARY KEY,date_commande DATE NOT NULL,montant DECIMAL(10,2) NOT NULL,serie VARCHAR(100) NOT NULL,id_cli
ent INT NOT NULL, FOREIGN KEY (id_client) REFERENCES client(id));
Query OK, 0 rows affected (0.08 sec)
mysql> DESCRIBE commande;
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| id            | int(11)       | NO   | PRI | NULL    | auto_increment |
| date_commande | date          | NO   |     | NULL    |                |
| montant       | decimal(10,2) | NO   |     | NULL    |                |
| serie         | varchar(100)  | NO   |     | NULL    |                |
| id_client     | int(11)       | NO   | MUL | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM commande;
Empty set (0.00 sec)

mysql> SHOW TABLES;           
+---------------------------------+
| Tables_in_concession_automobile |
+---------------------------------+
| client                          |
| commande                        |
| model_auto                      |
| voiture                         |
+---------------------------------+
4 rows in set (0.00 sec)