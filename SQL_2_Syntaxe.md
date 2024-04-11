# Documentation SQL : Guillemets et Syntaxe

## Introduction

En SQL, l'usage des guillemets simples ('), doubles ("), et des accents graves (`) varie selon le système de gestion de base de données (SGBD) utilisé. Ces caractères sont utilisés pour identifier les éléments de la base de données, comme les noms de tables et de colonnes, et pour délimiter les chaînes de caractères.

## Guillemets simples ('')

- **Usage :** Utilisés pour délimiter les chaînes de caractères.
- **Exemple :** 
  ```sql
  SELECT * FROM utilisateurs WHERE nom = 'Dupont';
  ```

## Guillemets doubles ("")

- **Usage :** Selon le standard SQL, les guillemets doubles sont utilisés pour identifier les identifiants (noms de table, de colonne, etc.) qui ne respectent pas les conventions normales de nommage ou qui contiennent des caractères spéciaux.
- **Exemple :**
  ```sql
  SELECT "nomColonne" FROM "maTable" WHERE "nomColonne" = 'valeur';
  ```
- **Remarque :** Tous les SGBD ne suivent pas cette convention. Par exemple, MySQL utilise les guillemets doubles comme des guillemets simples pour délimiter les chaînes, à moins que le mode ANSI_QUOTES soit activé.

## Accents graves (`)

- **Usage :** Utilisés spécifiquement dans MySQL et quelques autres SGBD pour entourer les identifiants.
- **Exemple :**
  ```sql
  SELECT `nomColonne` FROM `maTable` WHERE `nomColonne` = 'valeur';
  ```
- **Remarque :** Cela permet de s'assurer que les mots réservés peuvent être utilisés comme noms de table ou de colonne sans provoquer d'erreurs.

## Règles de syntaxe générale

1. **Sensibilité à la casse :** SQL n'est pas sensible à la casse pour les mots-clés, mais le traitement des identifiants peut l'être selon le SGBD et la configuration du système d'exploitation sous-jacent.
2. **Commentaires :**
   - Commentaires sur une ligne : Utilisez `-- commentaire` ou `# commentaire` (spécifique à MySQL).
   - Commentaires sur plusieurs lignes : Utilisez `/* commentaire */`.
3. **Terminaison des instructions :** Les instructions SQL doivent se terminer par un point-virgule (`;`), bien que certains outils et environnements puissent tolérer des instructions sans point-virgule en fin de requête.
4. **Nommage des identifiants :**
   - Ne doivent pas commencer par un chiffre, mais peuvent être numériques si délimités correctement.
   - Ne doivent pas contenir d'espaces. Utilisez des underscores `_` comme séparateurs.
   - Évitez d'utiliser des mots réservés du SQL, à moins qu'ils ne soient entourés par des guillemets appropriés.

