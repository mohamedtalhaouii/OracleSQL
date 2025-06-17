-- Nom : Mohamed Talhaoui
-- Filière : IIA (S4) | 2024/2025

CREATE TABLE Auteurs(
    id_auteur NUMBER PRIMARY KEY,
    nom CHAR(50) NOT NULL,
    prenom CHAR(50) NOT NULL,
    date_naissance DATE CHECK(date_naissance < TO_DATE('01-JAN-2025', 'DD-MON-YYYY')),
    email CHAR(100) UNIQUE
);

CREATE TABLE Livres(
    id_livre NUMBER PRIMARY KEY,
    titre CHAR(50),
    id_auteur NUMBER,
    CONSTRAINT fk_id_auteur FOREIGN KEY(id_auteur)
        REFERENCES Auteurs(id_auteur),
    date_publication DATE,
    genre CHAR(50) CHECK(genre IN ('Roman', 'Science-fiction', 'Fantasy'))
);

CREATE TABLE Emprunts(
    id_emprunt NUMBER PRIMARY KEY,
    id_livre NUMBER,
    CONSTRAINT fk_id_livre FOREIGN KEY(id_livre)
    REFERENCES Livres(id_livre),
    date_emprunt DATE DEFAULT SYSDATE, -- SYSDATE : retourne la date et l'heure actuelles du système
    date_retour DATE,
    CONSTRAINT chk_date_retour CHECK (date_retour > date_emprunt)
);