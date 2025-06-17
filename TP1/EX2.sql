-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

--1---------------------------------------------------------------------------------
CREATE USER useroracle1 IDENTIFIED BY uoracle1;

--2---------------------------------------------------------------------------------
CONNECT useroracle1/uoracle1;
-- La connexion échoue avec une erreur du type "ORA-01045: user USERORACLE1 lacks CREATE SESSION privilege; logon denied".
-- Pourquoi ? Parce que l'utilisateur n'a pas encore le privilège CREATE SESSION nécessaire pour se connecter à la base.

--3---------------------------------------------------------------------------------
CREATE USER useroracle2 IDENTIFIED BY uoracle2;

--4---------------------------------------------------------------------------------
GRANT CREATE TABLE TO useroracle1;

--5---------------------------------------------------------------------------------
GRANT CREATE SESSION, CREATE TABLE TO useroracle2;

--6---------------------------------------------------------------------------------
CONNECT useroracle2/uoracle2; -- Se connecter avec useroracle2

CREATE TABLE Dept(
  NumDept NUMBER,
  NomDept VARCHAR2(50),
  Localisation VARCHAR2(50) 
);

--7---------------------------------------------------------------------------------
GRANT SELECT ON Dept TO useroracle1;

--8---------------------------------------------------------------------------------
GRANT UPDATE (Localisation) ON Dept TO useroracle1;

--9---------------------------------------------------------------------------------
CONNECT useroracle1/uoracle1; -- Se connecter avec useroracle1

--La modification de la localisation fonctionne car useroracle1 a reçu le privilège spécifique pour cette colonne
UPDATE useroracle2.Dept SET Localisation = 'Casablanca' WHERE Localisation = 'rabat';

-- La modification du nom de département échoue car useroracle1 n'a pas reçu de privilège UPDATE sur la colonne NomDept
UPDATE useroracle2.Dept SET NomDept = 'achat' WHERE NomDept = 'ventes';


--10---------------------------------------------------------------------------------
CREATE ROLE developpeur;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO developpeur;

--11---------------------------------------------------------------------------------
GRANT developpeur TO useroracle2;