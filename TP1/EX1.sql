-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

--1) Installation d’Oracle Database Express Edition 11g :
---> (https://www.oracle.com/database/technologies/xe-prior-release-downloads.html)


--2) Installation de SQL Developer :
---> (https://www.oracle.com/fr/database/sqldeveloper/technologies/download)


--3) Lier Oracle Database avec SQL Developer :
--    Nom de connexion : OracleDB
--    Nom d’utilisateur : SYSTEM
--    Mot de passe : SYSTEM
--    Type de connexion : Basique
--    Nom d’hôte : localhost
--    Port : 1521
--    SID : XE
--> Tester et enregistrer la connexion


--4) Création d’un nouvel utilisateur :
CREATE USER mohamed_talhaoui IDENTIFIED BY mot_pass;


--5) Attribuer les droits à l'utilisateur :
GRANT CONNECT, RESOURCE TO mohamed_talhaoui;


