Bien sûr, voici une série de requêtes SQL qui couvrent différentes opérations courantes sur une base de données contenant les tables `client`, `commande`, `plat` et `categorie` :

1. Sélectionner toutes les colonnes de la table `client` :
```sql
SELECT * FROM client;
```

2. Sélectionner le nom et l'email des clients dont le nom commence par "A" :
```sql
SELECT nom, email FROM client WHERE nom LIKE 'A%';
```

3. Sélectionner le nombre total de clients :
```sql
SELECT COUNT(*) AS nombre_clients FROM client;
```

4. Sélectionner le plat le moins cher :
```sql
SELECT * FROM plat ORDER BY prix LIMIT 1;
```

5. Sélectionner les plats dont le prix est supérieur à 10 euros et dont la catégorie est "Plat principal" :
```sql
SELECT * FROM plat WHERE prix > 10 AND categorie = 'Plat principal';
```

6. Sélectionner les commandes effectuées par un client donné (par exemple, celui ayant l'ID 1) :
```sql
SELECT * FROM commande WHERE id_client = 1;
```

7. Sélectionner le montant total de toutes les commandes :
```sql
SELECT SUM(montant) AS montant_total FROM commande;
```

8. Mettre à jour le nom d'un client (par exemple, celui ayant l'ID 1) :
```sql
UPDATE client SET nom = 'Nouveau Nom' WHERE id = 1;
```

9. Insérer un nouveau plat dans la table `plat` :
```sql
INSERT INTO plat (nom, prix, categorie) VALUES ('Nouveau Plat', 15.99, 'Entrée');
```

10. Supprimer un plat de la table `plat` (par exemple, celui ayant l'ID 1) :
```sql
DELETE FROM plat WHERE id = 1;
```

11. Sélectionner les plats en ordre décroissant de prix :
```sql
SELECT * FROM plat ORDER BY prix DESC;
```

12. Sélectionner les clients ayant passé une commande avec un montant supérieur à 50 euros :
```sql
SELECT DISTINCT c.* FROM client c INNER JOIN commande cm ON c.id = cm.id_client WHERE cm.montant > 50;
```

13. Sélectionner les plats avec leur catégorie respective :
```sql
SELECT p.nom AS plat, c.nom AS categorie FROM plat p INNER JOIN categorie c ON p.id_categorie = c.id;
```

14. Sélectionner les clients n'ayant jamais passé de commande :
```sql
SELECT * FROM client WHERE id NOT IN (SELECT DISTINCT id_client FROM commande);
```

15. Sélectionner les plats et leur nombre de commandes respectif, triés par nombre de commandes décroissant :
```sql
SELECT p.nom AS plat, COUNT(cm.id) AS nombre_commandes 
FROM plat p LEFT JOIN commande plat_cmd ON p.id = plat_cmd.id_plat 
GROUP BY p.id 
ORDER BY nombre_commandes DESC;
```

Ces requêtes devraient couvrir un large éventail d'opérations SQL couramment utilisées dans le contexte d'une base de données relationnelle.