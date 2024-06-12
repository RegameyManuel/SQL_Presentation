# Présentation du SQL

## Histoire du SQL

**SQL (Structured Query Language)** est un langage standardisé de gestion de base de données qui a été développé pour la première fois dans les années 1970 par IBM. Il a été conçu pour manipuler et récupérer des données stockées dans les systèmes de gestion de bases de données relationnelles. Le premier prototype, appelé SEQUEL (Structured English Query Language), a été développé pour le projet de système de gestion de bases de données relationnelles appelé System R chez IBM. Au fil du temps, le langage a été normalisé par l'ANSI et l'ISO, ce qui a conduit à sa large adoption dans l'industrie.

## MySQL et MariaDB

**MySQL** est l'un des systèmes de gestion de bases de données relationnelles open source les plus populaires. Il a été créé par Michael Widenius ("Monty") et David Axmark dans les années 1990. MySQL est célèbre pour sa rapidité, sa robustesse et sa facilité d'utilisation. Il est largement utilisé pour les applications web et est devenu une partie intégrante de la pile technologique LAMP (Linux, Apache, MySQL, PHP/Python/Perl).

**MariaDB** est open source et a été forké de MySQL en 2009 par les mêmes développeurs qui ont créé MySQL, après que MySQL a été acquis par Oracle Corporation. MariaDB est conçu pour être compatible avec MySQL, tout en offrant de nouvelles fonctionnalités, des performances améliorées et des fonctionnalités remplacées qui n'étaient pas disponibles dans les versions gratuites de MySQL.

## Fonctionnement Général

SQL fonctionne en analysant et en exécutant des instructions écrites dans le langage SQL. Ces instructions peuvent effectuer diverses tâches, telles que la création de tables, la mise à jour de données, la récupération de données, et la gestion des transactions. SQL utilise des déclarations pour définir des structures de données, des requêtes pour récupérer des données et des commandes pour gérer les données et les transactions.

## Moteurs de Table MySQL

MySQL utilise ce qu'on appelle des "moteurs de stockage" pour gérer la manière dont les données sont stockées, gérées et récupérées. Chaque moteur de stockage a ses propres propriétés, optimisations et utilisations spécifiques. Voici quelques-uns des moteurs les plus courants :

- **MyISAM** : C'était le moteur par défaut avant MySQL 5.5. Il est connu pour sa rapidité dans les opérations de lecture, mais il ne supporte pas les transactions ni la récupération après un crash.

- **InnoDB** : C'est le moteur de stockage par défaut pour MySQL depuis la version 5.5. InnoDB supporte les transactions, la récupération après un crash et le verrouillage au niveau des lignes. Il est conçu pour maximiser la robustesse et l'intégrité des données.

- **Memory** : Ce moteur stocke les données en mémoire, ce qui offre un accès très rapide. Cependant, les données sont perdues lorsque la base de données est arrêtée, car elles ne sont pas stockées de manière persistante.

- **Archive** : Utilisé pour le stockage d'un grand nombre de données qui ne nécessitent pas de modification fréquente. Il est optimisé pour les insertions rapides et la compression des données.

Les moteurs de table de MySQL permettent aux utilisateurs de choisir la meilleure façon de stocker et de gérer leurs données en fonction de leurs besoins spécifiques, ce qui rend ce système extrêmement flexible et puissant pour une large gamme d'applications.

## Documentation SQL : Guillemets et Syntaxe

### Introduction

En SQL, l'usage des guillemets simples ('), doubles ("), et des accents graves (`) varie selon le système de gestion de base de données (SGBD) utilisé. Ces caractères sont utilisés pour identifier les éléments de la base de données, comme les noms de tables et de colonnes, et pour délimiter les chaînes de caractères.

### Guillemets simples ('')

- **Usage :** Utilisés pour délimiter les chaînes de caractères.
- **Exemple :** 
  ```sql
  SELECT * FROM utilisateurs WHERE nom = 'Dupont';
  ```

### Guillemets doubles ("")

- **Usage :** Selon le standard SQL, les guillemets doubles sont utilisés pour identifier les identifiants (noms de table, de colonne, etc.) qui ne respectent pas les conventions normales de nommage ou qui contiennent des caractères spéciaux.
- **Exemple :**
  ```sql
  SELECT "nomColonne" FROM "maTable" WHERE "nomColonne" = 'valeur';
  ```
- **Remarque :** Tous les SGBD ne suivent pas cette convention. Par exemple, MySQL utilise les guillemets doubles comme des guillemets simples pour délimiter les chaînes, à moins que le mode ANSI_QUOTES soit activé.

### Accents graves (`)

- **Usage :** Utilisés spécifiquement dans MySQL et quelques autres SGBD pour entourer les identifiants.
- **Exemple :**
  ```sql
  SELECT `nomColonne` FROM `maTable` WHERE `nomColonne` = 'valeur';
  ```
- **Remarque :** Cela permet de s'assurer que les mots réservés peuvent être utilisés comme noms de table ou de colonne sans provoquer d'erreurs.

### Règles de syntaxe générale

1. **Sensibilité à la casse :** SQL n'est pas sensible à la casse pour les mots-clés, mais le traitement des identifiants peut l'être selon le SGBD et la configuration du système d'exploitation sous-jacent.
2. **Commentaires :**
   - Commentaires sur une ligne : Utilisez `-- commentaire` ou `# commentaire` (spécifique à MySQL).
   - Commentaires sur plusieurs lignes : Utilisez `/* commentaire */`.
3. **Terminaison des instructions :** Les instructions SQL doivent se terminer par un point-virgule (`;`), bien que certains outils et environnements puissent tolérer des instructions sans point-virgule en fin de requête.
4. **Nommage des identifiants :**
   - Ne doivent pas commencer par un chiffre, mais peuvent être numériques si délimités correctement.
   - Ne doivent pas contenir d'espaces. Utilisez des underscores `_` comme séparateurs.
   - Évitez d'utiliser des mots réservés du SQL, à moins qu'ils ne soient entourés par des guillemets appropriés.



## SQL concrètement


### 1. Création de la Base de Données et des Tables

```sql
-- Crée la base de données si elle n'existe pas et la sélectionne pour utilisation.
CREATE DATABASE IF NOT EXISTS restaurant;
USE restaurant;

-- Crée la table Client.
CREATE TABLE Client (
    id_client INT PRIMARY KEY, 
    nom VARCHAR(50), 
    prenom VARCHAR(50), 
    email VARCHAR(100)
);

-- Crée la table Commande.
CREATE TABLE Commande (
    id_commande INT PRIMARY KEY, 
    id_client INT, 
    date_commande DATE, 
    total DECIMAL(10, 2), 
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

-- Crée la table Plat.
CREATE TABLE Plat (
    id_plat INT PRIMARY KEY, 
    nom_plat VARCHAR(50), 
    id_categorie INT, 
    prix DECIMAL(10, 2), 
    FOREIGN KEY (id_categorie) REFERENCES Categorie(id_categorie)
);

-- Suppression puis recréation de la table Categorie.
DROP TABLE IF EXISTS Categorie;
CREATE TABLE Categorie (
    id_categorie INT PRIMARY KEY, 
    nom_categorie VARCHAR(50)
);


-- Données pour la table `Client`

INSERT INTO Client (id_client, nom, prenom, email) VALUES
(1, 'Martin', 'Lucie', 'lucie.martin@example.com'),
(2, 'Bernard', 'Julien', 'julien.bernard@example.com'),
(3, 'Thomas', 'Émilie', 'emilie.thomas@example.com'),
(4, 'Petit', 'Sophie', 'sophie.petit@example.com'),
(5, 'Robert', 'Christophe', 'christophe.robert@example.com');


-- Données pour la table `Categorie`

INSERT INTO Categorie (id_categorie, nom_categorie) VALUES
(1, 'Entrée'),
(2, 'Plat principal'),
(3, 'Dessert'),
(4, 'Boisson');


-- Données pour la table `Plat`

INSERT INTO Plat (id_plat, nom_plat, id_categorie, prix) VALUES
(1, 'Salade Niçoise', 1, 12.50),
(2, 'Steak Frites', 2, 18.90),
(3, 'Mousse au Chocolat', 3, 6.50),
(4, 'Poulet Basquaise', 2, 16.50),
(5, 'Tarte Tatin', 3, 8.00),
(6, 'Limonade Maison', 4, 3.75);


-- Données pour la table `Commande`

INSERT INTO Commande (id_commande, id_client, date_commande, total) VALUES
(1, 1, '2023-09-01', 45.90),
(2, 2, '2023-09-02', 24.25),
(3, 3, '2023-09-03', 19.75),
(4, 4, '2023-09-04', 34.75),
(5, 5, '2023-09-05', 22.50);
```


### 2. Requêtes SQL

```sql
-- 1. Sélectionner toutes les colonnes de la table Client.
SELECT * FROM Client;

-- 2. Sélectionner le nom et l'email des clients dont le nom commence par "A".
SELECT nom, email FROM Client WHERE nom LIKE 'A%';

-- 3. Sélectionner le nombre total de clients.
SELECT COUNT(*) AS nombre_clients FROM Client;

-- 4. Sélectionner le plat le moins cher.
SELECT * FROM Plat ORDER BY prix LIMIT 1;

-- 5. Sélectionner les plats dont le prix est supérieur à 10 euros et dans une catégorie spécifique.
SELECT * FROM Plat WHERE prix > 10 AND id_categorie = (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Plat principal');

-- 6. Sélectionner les commandes effectuées par un client donné (ID 1).
SELECT * FROM Commande WHERE id_client = 1;

-- 7. Sélectionner le montant total de toutes les commandes.
SELECT SUM(total) AS montant_total FROM Commande;

-- 8. Mettre à jour le nom d'un client (ID 1).
UPDATE Client SET nom = 'Nouveau Nom' WHERE id_client = 1;

-- 9. Insérer un nouveau plat dans la table Plat.
INSERT INTO Plat (nom_plat, prix, id_categorie) VALUES ('Nouveau Plat', 15.99, (SELECT id_categorie FROM Categorie WHERE nom_categorie = 'Entrée'));

-- 10. Supprimer un plat de la table Plat (ID 1).
DELETE FROM Plat WHERE id_plat = 1;

-- 11. Sélectionner les plats en ordre décroissant de prix.
SELECT * FROM Plat ORDER BY prix DESC;

-- 12. Sélectionner les clients ayant passé une commande avec un montant supérieur à 50 euros.
SELECT DISTINCT c.* FROM Client c INNER JOIN Commande cm ON c.id_client = cm.id_client WHERE cm.total > 50;

-- 13. Sélectionner les plats avec leur catégorie respective.
SELECT p.nom_plat AS plat, c.nom_categorie AS categorie FROM Plat p INNER JOIN Categorie c ON p.id_categorie = c.id_categorie;

-- 14. Sélectionner les clients n'ayant jamais passé de commande.
SELECT * FROM Client WHERE id_client NOT IN (SELECT DISTINCT id_client FROM Commande);

-- 15. Sélectionner les plats et leur nombre de commandes respectif, triés par nombre de commandes décroissant.
SELECT p.nom_plat AS plat, COUNT(cm.id_commande) AS nombre_commandes FROM Plat p LEFT JOIN Commande cm ON p.id_plat = cm.id_plat GROUP BY p.id_plat ORDER BY nombre_commandes DESC;
```


## SQL (légèrement) avancé ...


### Jointures Variées (INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN)
```sql
-- INNER JOIN récupère les enregistrements correspondants dans les deux tables.
SELECT Client.nom, Commande.date_commande
FROM Client
INNER JOIN Commande ON Client.id_client = Commande.id_client;

-- LEFT JOIN inclut tous les enregistrements de la table de gauche et les correspondants de la table de droite.
SELECT Client.nom, Commande.date_commande
FROM Client
LEFT JOIN Commande ON Client.id_client = Commande.id_client;

-- RIGHT JOIN n'est pas supporté dans toutes les bases de données, donc vérifiez la compatibilité.
-- Elle inclut tous les enregistrements de la table de droite et les correspondants de la table de gauche.
-- Si votre système de gestion de base de données ne supporte pas RIGHT JOIN, utilisez LEFT JOIN avec l'ordre des tables inversé.
SELECT Commande.date_commande, Client.nom
FROM Commande
LEFT JOIN Client ON Commande.id_client = Client.id_client;

-- CROSS JOIN produit le produit cartésien des deux tables.
SELECT Client.nom, Plat.nom_plat
FROM Client
CROSS JOIN Plat;
```


### Fonctions SQL Avancées (GROUP BY, HAVING, DISTINCT)
```sql
-- Utilisation de GROUP BY avec HAVING pour filtrer les résultats.
SELECT Categorie.nom_categorie, COUNT(*) AS Nombre_Plats
FROM Plat
JOIN Categorie ON Plat.id_categorie = Categorie.id_categorie
GROUP BY Categorie.nom_categorie
HAVING COUNT(*) > 5;

-- Utilisation de DISTINCT pour éviter les doublons.
SELECT DISTINCT Client.prenom
FROM Client;
```


### Fonctions de Date et d'Heure
```sql
-- Extrait l'année de la date de commande.
SELECT id_commande, YEAR(date_commande) AS Annee_Commande
FROM Commande;

-- Calcule la différence en jours entre deux dates.
SELECT DATEDIFF(CURDATE(), date_commande) AS Jours_Depuis_Commande
FROM Commande;
```


### Utilisation de Fonctions d'Aggrégation (SUM, AVG, MIN, MAX)
```sql
-- Calcule le total des ventes, la commande moyenne, le montant maximum et minimum des commandes.
SELECT SUM(total) AS Total_Ventes, AVG(total) AS Moyenne_Commande, MIN(total) AS Commande_Min, MAX(total) AS Commande_Max
FROM Commande;
```


### Sous-requêtes et Opérations sur les Sets (IN, NOT IN, EXISTS)
```sql
-- Utilise IN pour sélectionner les clients ayant passé une commande de plus de 100 euros.
SELECT nom, prenom FROM Client
WHERE id_client IN (SELECT id_client FROM Commande WHERE total > 100);

-- Utilise EXISTS pour vérifier l'existence de certaines commandes.
SELECT nom FROM Client c
WHERE EXISTS (SELECT 1 FROM Commande co WHERE co.id_client = c.id_client AND total > 150);
```


### Insertions, Mises à jour, et Suppressions de données
```sql
-- Insertion d'un nouveau client.
INSERT INTO Client (id_client, nom, prenom, email) VALUES (101, 'Dupont', 'Jean', 'jean.dupont@example.com');

-- Mise à jour de l'email d'un client.
UPDATE Client SET email = 'nouveau.email@example.com' WHERE id_client = 101;

-- Suppression d'un client.
DELETE FROM Client WHERE id_client = 101;
```


### Transactions (START TRANSACTION, COMMIT, ROLLBACK)

Les transactions en SQL sont des séquences d'opérations de gestion de base de données qui sont traitées de manière logique et indivisible. Elles sont essentielles pour maintenir l'intégrité des données, en particulier dans les environnements où plusieurs utilisateurs ou applications accèdent et modifient simultanément la base de données. Une transaction en SQL commence par une commande de démarrage et se termine par un commit ou un rollback.

#### Principe des Transactions

1. **Atomicité** : Chaque transaction est atomique, ce qui signifie qu'elle est indivisible. Toutes les opérations au sein de la transaction sont effectuées avec succès, ou aucune n'est appliquée. Si une opération échoue, toutes les modifications précédentes dans la transaction sont annulées (rollback).

2. **Cohérence** : Une transaction transforme la base de données d'un état valide à un autre état valide, en préservant l'intégrité des données. Toutes les règles d'intégrité doivent être respectées.

3. **Isolation** : Chaque transaction doit être isolée des autres transactions. Les modifications effectuées dans une transaction ne doivent pas être visibles par les autres transactions avant que la transaction ne soit terminée (commit).

4. **Durabilité** : Une fois qu'une transaction a été validée (commit), les modifications qu'elle a introduites dans la base de données doivent être permanentes, même en cas de panne du système.

#### Exemple de Transaction en SQL

Pour illustrer comment les transactions fonctionnent en pratique, imaginons une base de données de gestion de comptes bancaires où les transactions sont cruciales pour assurer que tous les transferts de fonds sont effectués de manière sécurisée et cohérente.

```sql
-- Démarrage de la transaction
START TRANSACTION;

-- Tentative de transfert de 100 euros du compte 001 vers le compte 002
-- Débit du compte 001
UPDATE Comptes SET solde = solde - 100 WHERE numero_compte = '001';

-- Crédit du compte 002
UPDATE Comptes SET solde = solde + 100 WHERE numero_compte = '002';

-- Vérification que le compte débiteur a suffisamment de fonds (ne doit pas être négatif)
SELECT solde INTO @solde FROM Comptes WHERE numero_compte = '001';
IF @solde < 0 THEN
    -- Si le solde est insuffisant, annulation de la transaction
    ROLLBACK;
ELSE
    -- Si tout est en règle, validation de la transaction
    COMMIT;
END IF;
```

#### Commentaires sur l'Exemple

- **START TRANSACTION** démarre la transaction.
- Les commandes **UPDATE** sont utilisées pour transférer les fonds entre les comptes.
- La commande **SELECT INTO** récupère le solde après le débit pour vérifier si le compte ne passe pas en négatif.
- **IF** permet de tester si le solde est inférieur à zéro. Si c'est le cas, la transaction est annulée avec **ROLLBACK**; sinon, elle est validée avec **COMMIT**.
- **ROLLBACK** annule toutes les modifications effectuées dans la transaction.
- **COMMIT** applique toutes les modifications de manière permanente dans la base de données.

- **@solde** cré une variable
    1. Portée et Durée de vie : Les variables utilisateur comme @solde ont une portée limitée à la session dans laquelle elles sont définies. Elles perdent leur valeur une fois la session terminée.
    2. Sécurité des transactions : L'utilisation de cette variable dans le contexte d'une transaction bancaire est cruciale pour assurer l'intégrité des opérations financières et prévenir les erreurs telles que les découverts non autorisés.


Cet exemple montre l'utilisation essentielle des transactions pour gérer des opérations financières complexes de manière sécurisée et fiable, garantissant ainsi l'intégrité et la cohérence des données dans des systèmes transactionnels critiques.