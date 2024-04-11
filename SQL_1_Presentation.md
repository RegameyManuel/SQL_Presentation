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