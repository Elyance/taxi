# Taxi – Spring Boot MVC + JSP + PostgreSQL (Guide Étudiant)

Ce mini-projet montre comment lier Spring MVC, JSP et PostgreSQL pour gérer une entité simple `Utilisateur` (liste, création/édition).

## Aperçu
- Stack: Spring Boot 4.x, Java 17, Spring MVC, Spring Data JPA, PostgreSQL, JSP/JSTL.
- Fonctionnalités:
  - Lister les utilisateurs
  - Créer/éditer un utilisateur (nom, email)
  - **Système d'authentification administrateur**

## Prérequis
- Java 17
- Maven
- PostgreSQL démarré localement
- Base: `taxi`, utilisateur: `postgres`, mot de passe: `motdepasse`

## Configuration
- Fichier de configuration: [src/main/resources/application.properties](src/main/resources/application.properties)
  - Datasource, JPA et résolveur de vues JSP sont déjà configurés.
- Dépendances: [pom.xml](pom.xml)
  - MVC, JPA, PostgreSQL JDBC, JSP (tomcat-embed-jasper + JSTL), Lombok

## Base de données
- Script SQL: [sql/script.sql](sql/script.sql)
- Crée toutes les tables du système (admin, gare, trajet, etc.)
- Script admin test: [sql/admin_test.sql](sql/admin_test.sql)
- Exécuter les scripts:

```bash
psql -U postgres -d taxi -f sql/script.sql
psql -U postgres -d taxi -f sql/admin_test.sql
```

## Lancer l'application
```bash
mvn spring-boot:run
```

## Routes
- Accueil/Login: `/` → [src/main/webapp/WEB-INF/jsp/admin/login.jsp](src/main/webapp/WEB-INF/jsp/admin/login.jsp)
- **Login POST: `/login`** → Traitement de l'authentification
- **Dashboard Admin: `/dashboard`** → (à implémenter)
- **Logout: `/logout`**

## Système d'authentification

### Compte de test
- **Nom d'utilisateur** : `admin`
- **Mot de passe** : `admin123`

### Fonctionnalités
- Formulaire de connexion responsive avec Bootstrap
- Validation côté client et serveur
- Gestion de session sécurisée
- Messages d'erreur appropriés

### Structure
- **Controller**: `AdminController.java`
- **Service**: `AdminService.java`
- **Repository**: `AdminRepository.java` (avec méthode `findByEmail`)
- **Vue**: `admin/login.jsp` (Bootstrap offline)

### Ressources statiques
- `src/main/resources/static/css/bootstrap.min.css`
- `src/main/resources/static/js/bootstrap.bundle.min.js`
- `src/main/resources/static/images/` (pour l'image du login)

## TODO - Fonctionnalités à implémenter
- Dashboard administrateur complet
- Gestion des entités (CRUD pour toutes les tables)
- Système de réservations de billets
- Interface utilisateur pour les clients
- API REST pour les intégrations externes</content>
<parameter name="filePath">/home/elyance/Documents/S5/Mme Baovola/taxi/README.md
