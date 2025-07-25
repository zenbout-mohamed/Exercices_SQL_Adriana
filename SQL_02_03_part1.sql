mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| 80jours            |
| blog               |
| crud               |
| eshop              |
| librairie          |
| locvoit            |
| membre             |
| mon_site           |
| my_first_bdd       |
| mysql              |
| mysql-training     |
| nouvelle_appli     |
| performance_schema |
| phpmyadmin         |
| sys                |
| testphp            |
+--------------------+
17 rows in set (0.00 sec)
mysql> CREATE DATABASE my_first_bdd;
Query OK, 1 row affected (0.00 sec)

mysql> USE my_first_bdd;
Database changed

mysql> CREATE TABLE my_first_table (    id INT AUTO_INCREMENT PRIMARY KEY,    libelle VARCHAR(100) NOT NULL,   date_ajout DATETIME DEFAULT CURRENT_TIMESTAMP);                                                                         
Query OK, 0 rows affected (0.10 sec)
mysql> SHOW TABLES;
+------------------------+
| Tables_in_my_first_bdd |
+------------------------+
| my_first_table         |
+------------------------+
1 row in set (0.00 sec)

mysql> DESCRIBE my_first_table;
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| id         | int(11)      | NO   | PRI | NULL              | auto_increment |
| libelle    | varchar(100) | NO   |     | NULL              |                |
| date_ajout | datetime     | YES  |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+
3 rows in set (0.02 sec)