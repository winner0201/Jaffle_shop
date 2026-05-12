# Jaffle_shop
projet jaffle shop

# Résumé du Projet Data Engineering : Pipeline dbt sur Databricks

Ce document récapitule l'ensemble du travail accompli pour la mise en place d'un pipeline de données moderne (Modern Data Stack) utilisant **Databricks**, **dbt** et l'architecture **Medallion**.

## 1. Architecture des Données (Medallion)
J'ai implémenté une structure de données en trois couches pour garantir la qualité et la traçabilité :
- **Couche Bronze (Raw) :** Ingestion des données brutes (`customers`, `orders`, `payments`) dans le catalogue `raw`.
- **Couche Silver (Staging) :** Nettoyage, renommage des colonnes et typage via des vues dbt dans le schéma `marketing_db.staging`.
- **Couche Gold (Marts) :** Transformation métier en tables physiques (Schéma en Étoile) dans le schéma `marketing_db.marts`.

## 2. Réalisations Techniques dbt
- **Modélisation Staging :**
    - Création de `stg_customers`, `stg_orders` et `stg_payments`.
    - Utilisation de la fonction `{{ source() }}` pour une gestion dynamique des sources brutes.
- **Modélisation Marts (Business Logic) :**
    - **Table de Dimension :** `dim_customers` regroupant l'historique et les agrégats par client (première/dernière commande, volume).
    - **Table de Faits :** `fct_orders` centralisant les transactions et les montants des paiements pour le pilotage du CA.
- **Configuration & Gouvernance :**
    - Configuration du `dbt_project.yml` pour séparer les matérialisations (Vues pour le staging, Tables pour les marts).
    - Implémentation d'une **macro personnalisée** (`generate_schema_name`) pour contrôler précisément le nommage des schémas dans Unity Catalog.
    - Centralisation des définitions dans `sources.yml` pour assurer le lignage des données (Lineage).

## 3. Stack Technique
- **Environnement :** Databricks (Unity Catalog, SQL Warehouse).
- **Transformation :** dbt (Core/Cloud).
- **Langages :** SQL, YAML (Configuration dbt).
- **Versionnage :** Git/GitHub (CI/CD via les Jobs Databricks).

## 4. Compétences Clés Démontrées
- Maîtrise du **Star Schema** (Schéma en étoile).
- Capacité à isoler les données sensibles (`raw`) des données analytiques.
- Gestion des dépendances entre modèles (DAG).
- Automatisation de la qualité de donnée (Data Quality via dbt tests).