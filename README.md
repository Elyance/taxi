# Taxi – Spring Boot MVC + JSP + PostgreSQL (Guide Étudiant)

Ce mini-projet montre comment lier Spring MVC, JSP et PostgreSQL pour gérer une entité simple `Utilisateur` (liste, création/édition).

## Aperçu
- Stack: Spring Boot 4.x, Java 17, Spring MVC, Spring Data JPA, PostgreSQL, JSP/JSTL.
- Fonctionnalités:
  - Lister les utilisateurs
  - Créer/éditer un utilisateur (nom, email)

## Prérequis
- Java 17
- Maven
- PostgreSQL démarré localement
- Base: `test_spring`, utilisateur: `postgres`, mot de passe: `motdepasse`

## Configuration
- Fichier de configuration: [src/main/resources/application.properties](src/main/resources/application.properties)
  - Datasource, JPA et résolveur de vues JSP sont déjà configurés.
- Dépendances: [pom.xml](pom.xml)
  - MVC, JPA, PostgreSQL JDBC, JSP (tomcat-embed-jasper + JSTL)

## Base de données
- Script SQL: [sql/script.sql](sql/script.sql)
- Crée la table `utilisateur` et insère des données de test.
- Exécuter le script:

```bash
psql -U postgres -d test_spring -f sql/script.sql
```

## Lancer l’application
```bash
mvn spring-boot:run
```

## Routes
- Accueil: `/` → [src/main/webapp/WEB-INF/jsp/index.jsp](src/main/webapp/WEB-INF/jsp/index.jsp)
- Liste des utilisateurs: `/utilisateurs` → [src/main/webapp/WEB-INF/jsp/utilisateurs/list.jsp](src/main/webapp/WEB-INF/jsp/utilisateurs/list.jsp)
- Formulaire création: `/utilisateurs/create` → [src/main/webapp/WEB-INF/jsp/utilisateurs/edit.jsp](src/main/webapp/WEB-INF/jsp/utilisateurs/edit.jsp)
- Formulaire édition: `/utilisateurs/edit/{id}` → même vue `edit.jsp`
- Sauvegarde: `POST /utilisateurs/save` (champs: `id` optionnel, `nom`, `email`)
