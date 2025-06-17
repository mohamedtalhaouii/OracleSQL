-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

--(Voir TP3!)
--1--------------------------------------------------------------------------------------------------------------------------
SELECT num_emp, num_dept, fonction, date_emb FROM EMPLOYES
ORDER BY NUM_DEPT ASC, FONCTION ASC, date_emb ASC;

--2--------------------------------------------------------------------------------------------------------------------------
SELECT nom_emp, num_emp FROM EMPLOYES
WHERE num_emp NOT IN (
    SELECT DISTINCT manager
    FROM EMPLOYES
    WHERE manager IS NOT NULL
);

--3--------------------------------------------------------------------------------------------------------------------------
SELECT FONCTION, COUNT(DISTINCT NUM_EMP) AS NOMBRE_EMP FROM EMPLOYES
GROUP BY FONCTION;

--4--------------------------------------------------------------------------------------------------------------------------
SELECT TRUNC(salaire, -3) AS SALAIRE, COUNT(*) AS NOMBRE_EMP 
FROM EMPLOYES
GROUP BY TRUNC(salaire, -3)
ORDER BY SALAIRE ASC;

--5--------------------------------------------------------------------------------------------------------------------------
SELECT dep.NOM_DEPT, MAX(SALAIRE) FROM EMPLOYES emp, DEPARTEMENT dep
WHERE emp.NUM_DEPT = dep.NUM_DEPT
GROUP BY dep.NOM_DEPT;

--6--------------------------------------------------------------------------------------------------------------------------
SELECT FONCTION, MIN(SALAIRE) FROM EMPLOYES
GROUP BY FONCTION;

--7--------------------------------------------------------------------------------------------------------------------------
SELECT FONCTION, dep.NOM_DEPT, SUM(SALAIRE) FROM EMPLOYES emp, DEPARTEMENT dep
WHERE emp.NUM_DEPT = dep.NUM_DEPT
GROUP BY FONCTION, dep.NOM_DEPT
ORDER BY FONCTION ASC, dep.NOM_DEPT DESC;