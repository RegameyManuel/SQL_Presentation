-- Supprime la base de données si elle existe.
DROP DATABASE IF EXISTS restaurant;

-- Création de la base de données.
CREATE DATABASE restaurant;

-- Sélection de la base.
USE restaurant;

-- Création de la table client.
CREATE TABLE client (
    id_client INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nom VARCHAR(50), 
    prenom VARCHAR(50), 
    email VARCHAR(100)
);

-- Création de la table commande.
CREATE TABLE commande (
    id_commande INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_client INT, 
    date_commande DATE, 
    total DECIMAL(10, 2), 
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);


-- Création de la table categorie.
CREATE TABLE categorie (
    id_categorie INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nom_categorie VARCHAR(50)
);


-- Création de la table plat.
CREATE TABLE plat (
    id_plat INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nom_plat VARCHAR(50), 
    id_categorie INT, 
    prix DECIMAL(10, 2), 
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

-- Données pour la table `client`
INSERT INTO client (nom, prenom, email) VALUES
('Martin', 'Lucie', 'lucie.martin@example.com'),
('Bernard', 'Julien', 'julien.bernard@example.com'),
('Kuong', 'Émilie', 'emilie.kuong@example.com'),
('Petit', 'Sophie', 'sophie.petit@example.com'),
('Robert', 'Christophe', 'christophe.robert@example.com');

-- Données pour la table `categorie`
INSERT INTO categorie (nom_categorie) VALUES
('Entrée'),
('Plat principal'),
('Dessert'),
('Boisson');

-- Données pour la table `plat`
INSERT INTO plat (nom_plat, id_categorie, prix) VALUES
('Salade Niçoise',		(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Entrée'),		12.50),
('Steak Frites',		(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Plat principal'),18.90),
('Mousse au Chocolat',	(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Dessert'),		6.50),
('Poulet Basquaise',	(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Plat principal'),16.50),
('Tarte Tatin',			(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Dessert'),		8.00),
('Limonade Maison',		(SELECT categorie.id_categorie FROM categorie where categorie.nom_categorie = 'Boisson'),		3.75);

-- Données pour la table `commande`
INSERT INTO commande (id_client, date_commande, total) VALUES
((SELECT client.id_client FROM client where client.email = 'lucie.martin@example.com'),		'2023-09-01',45.90),
((SELECT client.id_client FROM client where client.email = 'julien.bernard@example.com'),	'2023-09-02',24.25),
((SELECT client.id_client FROM client where client.email = 'emilie.kuong@example.com'),		'2023-09-03',19.75),
((SELECT client.id_client FROM client where client.email = 'sophie.petit@example.com'),		'2023-09-04',34.75),
((SELECT client.id_client FROM client where client.email = 'christophe.robert@example.com'),'2023-09-05',22.50);
