-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

-------------------------------Departement-------------------------------
CREATE TABLE Departement(
    num_dept NUMBER PRIMARY KEY,
    nom_dept VARCHAR2(50), 
    locale VARCHAR2(50)
);


---------------------------------Employes--------------------------------
CREATE TABLE Employes(
    num_emp NUMBER PRIMARY KEY,
    nom_emp VARCHAR2(50),
    fonction VARCHAR2(50),
    manager NUMBER,
    date_emb DATE,
    salaire NUMBER,
    commission NUMBER,
    num_dept NUMBER,
    CONSTRAINT FK_num_dept FOREIGN KEY(num_dept)
        REFERENCES Departement(num_dept)
);


-------------------------------Departement-------------------------------
INSERT INTO DEPARTEMENT(num_dept, nom_dept, locale)
    VALUES(10, 'Sales', 'DALLAS');

INSERT INTO DEPARTEMENT(num_dept, nom_dept, locale)
    VALUES(20, 'Research', 'PARIS');

INSERT INTO DEPARTEMENT(num_dept, nom_dept, locale)
    VALUES(30, 'Marketing', 'BORADEAUX');


---------------------------------Employes---------------------------------------------------------
INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('MARTIN', 16712, 'DIRECTEUR', 25717, '23-MAY-90', 40000, NULL, 30);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('DUPONT', 17574, 'ADMINISTARTIF', 16712, '03-MAY-95', 9000, NULL, 30);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('DUPOND', 26691, 'COMMERCIAL', 27047, '04-APR-88', 25000, 2500, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LAMBERT', 25012, 'ADMINISTARTIF', 27047, '14-APR-91', 12000, NULL, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('JOUBERT', 25717, 'PRESENDENT', NULL, '10-OCT-82', 50000, NULL, 30);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LEBRETON', 16094, 'COMMERCIAL', 27047, '01-JUN-91', 15000, 0, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('MARTIN', 17147, 'COMMERCIAL', 27047, '10-DEC-93', 20000, 500, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('PAQUEL', 27546, 'COMMERCIAL', 27047, '03-SEP-83', 22000, 2000, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LEFEBVRE', 25935, 'COMMERCIAL', 27047, '11-JAN-84', 23500, 1500, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('GARFARIN', 15155, 'INGENIEUR', 24533, '22-MAR-85', 24000, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('SIMON', 26834, 'INGENIEUR', 24533, '04-OCT-88', 20000, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('DELOBEL', 16278, 'INGENIEUR', 24533, '16-NOV-94', 21000, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('ADIBA', 25067, 'INGENIEUR', 24533, '05-OCT-87', 30000, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('CODD', 24533, 'DIRECTEUR', 25717, '12-SEP-75', 55000, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LAMERE', 27047, 'DIRECTEUR', 25717, '07-SEP-89', 45000, NULL, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('BALIN', 17232, 'ADMINISTARTIF', 24533, '03-OCT-87', 13500, NULL, 10);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('BARA', 24831, 'ADMINISTARTIF', 16712, '10-SEP-88', 13500, NULL, 30);


--1---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES 
WHERE FONCTION='INGENIEUR' AND NUM_DEPT=10;

--2---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES 
WHERE FONCTION!='ADMINISTARTIF' AND EXTRACT(YEAR FROM date_emb) IN (1987, 1988);

--3---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES 
WHERE NOM_EMP LIKE '%A%M%';

--4---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES 
WHERE NOM_EMP LIKE '%A%A%';

--5---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES 
WHERE COMMISSION IS NOT NULL AND COMMISSION!=0;

--6---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYES e1, DEPARTEMENT d1
WHERE d1.NUM_DEPT = e1.NUM_DEPT AND d1.LOCALE = 'DALLAS';

--7---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e1.NOM_EMP, 
    e1.DATE_EMB, 
    e2.NOM_EMP AS NOM_MANAGER, 
    e2.DATE_EMB AS DATE_EMB_MANAGER 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.MANAGER = e2.NUM_EMP 
    AND e1.DATE_EMB < e2.DATE_EMB;

--8---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP, 
    e2.DATE_EMB 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NOM_EMP = 'SIMON' 
    AND e1.DATE_EMB > e2.DATE_EMB;

--9---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NOM_EMP = 'CODD' 
    AND EXTRACT(DAY FROM e1.DATE_EMB) = EXTRACT(DAY FROM e2.DATE_EMB);

--10--------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP, 
    e1.NOM_EMP AS NOM_MANAGER 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NOM_EMP = 'LAMERE' 
    AND e1.NUM_EMP = e2.MANAGER;

--11--------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NUM_DEPT = 10  
    AND e1.DATE_EMB > e2.DATE_EMB 
    AND e2.NUM_DEPT!=10;

--12--------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP, 
    e2.FONCTION 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NOM_EMP = 'PAQUEL' 
    AND e1.FONCTION = e2.FONCTION 
    AND e1.MANAGER = e2.MANAGER;

--13--------------------------------------------------------------------------------------------------------------------------
SELECT 
    e1.nom_emp AS Research_Depart,
    e2.nom_emp AS Sales_Depart
FROM 
    employes e1,
    employes e2,
    departement d1,
    departement d2
WHERE 
    e1.num_dept = d1.num_dept
    AND d1.nom_dept = 'Research'
    AND e2.num_dept = d2.num_dept
    AND d2.nom_dept = 'Sales'
    AND EXTRACT(DAY FROM e1.date_emb) = EXTRACT(DAY FROM e2.date_emb);

--14--------------------------------------------------------------------------------------------------------------------------
SELECT 
    e2.NOM_EMP, e2.SALAIRE, 
    e1.NOM_EMP AS NOM_MANAGER, e1.SALAIRE 
FROM 
    EMPLOYES e1, 
    EMPLOYES e2
WHERE 
    e1.NUM_EMP = e2.MANAGER 
    AND e1.SALAIRE < e2.SALAIRE;

--15--------------------------------------------------------------------------------------------------------------------------
SELECT nom_emp, TRUNC(salaire, -3) AS salaire_tronque FROM employes;