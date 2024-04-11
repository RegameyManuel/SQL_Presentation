Pour créer une série de requêtes SQL variée et instructive sur une base de données MariaDB contenant les tables **Client**, **Commande**, **Plat**, et **Categorie**, je vais proposer différents types de requêtes qui couvrent plusieurs aspects de SQL. Ces requêtes incluront des sélections simples, des jointures, des agrégations, des sous-requêtes, des manipulations de données, et des commandes de gestion de base de données.

### Structure des Tables
Supposons que les tables aient les structures suivantes :
- **Client** (id_client, nom, prenom, email)
- **Commande** (id_commande, id_client, date_commande, total)
- **Plat** (id_plat, nom_plat, id_categorie, prix)
- **Categorie** (id_categorie, nom_categorie)


### Requêtes SQL Commentées

1. **Sélection Simple**:
   ```sql
   -- Cette requête récupère toutes les colonnes et tous les enregistrements de la table 'Client'.
   SELECT * FROM Client;
   ```

2. **Sélection avec Condition**:
   ```sql
   -- Récupère le nom et le prénom des clients dont l'identifiant est égal à 1.
   SELECT nom, prenom FROM Client WHERE id_client = 1;
   ```

3. **Jointure entre deux tables**:
   ```sql
   -- Joint les tables 'Client' et 'Commande' via l'identifiant client et récupère le nom du client,
   -- la date de la commande et le total de la commande.
   SELECT Client.nom, Commande.date_commande, Commande.total
   FROM Client
   JOIN Commande ON Client.id_client = Commande.id_client;
   ```

4. **Jointure avec trois tables et filtrage**:
   ```sql
   -- Joint les tables 'Commande', 'Client', et 'Plat', récupère le nom du client, le nom du plat,
   -- et le total de la commande pour les commandes de plus de 50 euros.
   SELECT Client.nom, Plat.nom_plat, Commande.total
   FROM Commande
   JOIN Client ON Commande.id_client = Client.id_client
   JOIN Plat ON Commande.id_commande = Plat.id_plat
   WHERE Commande.total > 50;
   ```

5. **Agrégats (Somme, Moyenne, Compte)**:
   ```sql
   -- Compte le nombre total de commandes et calcule la moyenne des totaux de toutes les commandes.
   SELECT COUNT(*) AS Nombre_Commandes, AVG(total) AS Moyenne_Total
   FROM Commande;
   ```

6. **Group By et Having**:
   ```sql
   -- Regroupe les plats par catégorie et compte le nombre de plats par catégorie,
   -- en affichant uniquement les catégories ayant plus de 5 plats.
   SELECT Categorie.nom_categorie, COUNT(*) AS Nombre_Plats
   FROM Plat
   JOIN Categorie ON Plat.id_categorie = Categorie.id_categorie
   GROUP BY Categorie.nom_categorie
   HAVING COUNT(*) > 5;
   ```

7. **Sous-requête**:
   ```sql
   -- Sélectionne le nom et le prénom des clients ayant effectué une commande de plus de 100 euros.
   SELECT nom, prenom FROM Client
   WHERE id_client IN (SELECT id_client FROM Commande WHERE total > 100);
   ```

8. **Mise à jour d'une table**:
   ```sql
   -- Met à jour l'adresse email du client ayant l'identifiant 1.
   UPDATE Client SET email = 'nouveau.email@example.com' WHERE id_client = 1;
   ```

9. **Insertion de données**:
   ```sql
   -- Insère un nouveau plat dans la table 'Plat'.
   INSERT INTO Plat (nom_plat, id_categorie, prix) VALUES ('Nouveau Plat', 1, 9.99);
   ```

10. **Suppression de données**:
    ```sql
    -- Supprime une commande spécifique de la table 'Commande'.
    DELETE FROM Commande WHERE id_commande = 1;
    ```

11. **Utilisation de fonctions SQL (par exemple, date)**:
    ```sql
    -- Sélectionne toutes les colonnes des commandes et extrait l'année de la date de commande.
    SELECT *, YEAR(date_commande) AS Annee_Commande FROM Commande;
    ```

12. **Transactions (début, commit, rollback)**:
    ```sql
    -- Démarre une transaction, insère un enregistrement dans 'Client', puis annule (rollback) cette transaction.
    START TRANSACTION;
    INSERT INTO Client (nom, prenom, email) VALUES ('Test', 'User', 'test@example.com');
    ROLLBACK;
    ```

13. **Création et suppression de tables**:
    ```sql
    -- Crée une nouvelle table 'TestTable' puis la supprime.
    CREATE TABLE TestTable (id INT, value VARCHAR(50));
    DROP TABLE TestTable;
    ```

Chaque exemple est conçu pour illustrer un concept spécifique de SQL, de l'utilisation de base des requêtes SELECT à des opérations plus avancées comme les transactions ou la manipulation de la structure des bases de données. Cela devrait offrir un bon support