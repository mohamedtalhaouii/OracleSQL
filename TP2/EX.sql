-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

CREATE TABLE Auteurs(
    id_auteur NUMBER PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    date_naissance DATE CHECK(date_naissance < TO_DATE('01-JAN-2000', 'DD-MON-YYYY')),
    email VARCHAR2(100) UNIQUE,
    CONSTRAINT fk_id_auteur FOREIGN KEY(id_auteur)
        REFERENCES Livres(id_auteur)
);

CREATE TABLE Livres(
    id_livre NUMBER PRIMARY KEY,
    titre VARCHAR2(50),
    id_auteur NUMBER,
    date_publication DATE,
    genre VARCHAR2(50) CHECK(genre IN ('Roman', 'Science-fiction', 'Fantasy')),
    CONSTRAINT fk_id_livre FOREIGN KEY(id_livre)
        REFERENCES Emprunts(id_livre)
);

CREATE TABLE Emprunts(
    id_emprunt NUMBER PRIMARY KEY,
    id_livre NUMBER,
    date_emprunt DATE DEFAULT SYSDATE, -- SYSDATE : retourne la date et l'heure actuelles du système
    date_retour DATE,
    CONSTRAINT chk_date_retour CHECK (date_retour > date_emprunt)
);
