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
    VALUES('DUPONT', 17574, 'ADMINISTARTIF', 16712, '03-MAY-95', 900, NULL, 30);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('DUPOND', 26691, 'COMMERCIAL', 27047, '04-APR-88', 25000, 2500, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LAMBERT', 25012, 'ADMINISTARTIF', 27047, '14-APR-91', 12000, NULL, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('JOUBERT', 25717, 'PRESENDENT', NULL, '10-OCT-82', 50000, NULL, 30);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('LEBRETON', 16094, 'COMMERCIAL', 27047, '01-JUN-91', 15000, 0, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('MARTIN', 17147, 'DIRECTEUR', 27047, '10-DEC-93', 20000, 500, 20);

INSERT INTO Employes(nom_emp, num_emp, fonction, manager, date_emb, salaire, commission, num_dept)
    VALUES('PAQUEL', 27546, 'DIRECTEUR', 27047, '03-SEP-83', 22000, 2000, 20);

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
