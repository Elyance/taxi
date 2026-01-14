# Système de Login Administrateur

## Description
Le système de login permet aux administrateurs de se connecter à l'application Taxi.

## Fonctionnalités
- Formulaire de connexion avec validation
- Authentification par email et mot de passe
- Gestion de session
- Déconnexion sécurisée
- Interface responsive avec Bootstrap

## Structure des fichiers créés

### Controllers
- `AdminController.java` : Gestion de l'authentification et des sessions

### Services
- `AdminService.java` : Logique métier pour l'authentification

### Vues
- `admin/login.jsp` : Page de connexion avec formulaire

### Ressources statiques
- `css/bootstrap.min.css` : Framework CSS Bootstrap (version offline)
- `js/bootstrap.bundle.min.js` : JavaScript Bootstrap (version offline)
- `images/` : Dossier pour l'image du login (à ajouter)

## Utilisation

### Accès à la page de login
```
GET /
```

### Soumission du formulaire
```
POST /login
Paramètres: nom, mdp
```

### Déconnexion
```
GET /logout
```

### Dashboard (à implémenter)
```
GET /dashboard
```

## Configuration

### Base de données
Assurez-vous que la table `admin` existe avec les colonnes :
- `id_admin` (SERIAL, PRIMARY KEY)
- `nom` (VARCHAR(50))
- `email` (VARCHAR(50))
- `mdp` (VARCHAR(50))

### Session
La session stocke :
- `admin` : Objet Admin complet
- `adminId` : ID de l'administrateur
- `adminEmail` : Email de l'administrateur
- `adminNom` : Nom de l'administrateur

## Sécurité
- Validation des entrées
- Protection contre les injections SQL (via JPA)
- Gestion d'erreurs appropriée
- Session sécurisée

## Personnalisation

### Ajout d'une image
1. Placez votre image dans `src/main/resources/static/images/`
2. Modifiez `admin/login.jsp` ligne ~95 :
```jsp
<!-- Remplacer cette ligne -->
<!-- <img src="<c:url value='/images/admin-login.jpg'/>" alt="Login Admin" class="img-fluid rounded"> -->
<!-- Par -->
<img src="<c:url value='/images/votre-image.jpg'/>" alt="Login Admin" class="img-fluid rounded">
```

### Modification du style
- Éditez le CSS dans `admin/login.jsp` (section `<style>`)

## TODO
- Implémenter le dashboard administrateur
- Ajouter la fonctionnalité "mot de passe oublié"
- Implémenter le hashage des mots de passe (BCrypt)
- Ajouter la validation renforcée</content>
<parameter name="filePath">/home/elyance/Documents/S5/Mme Baovola/taxi/LOGIN_README.md