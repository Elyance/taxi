<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        :root {
            --bg1: #0ea5e9; /* sky-500 */
            --bg2: #9333ea; /* purple-600 */
            --card-bg: rgba(255,255,255,0.85);
            --card-border: rgba(255,255,255,0.35);
            --text: #0f172a;
            --muted: #475569;
            --input: #cbd5e1;
            --primary: #0ea5e9;
            --primary-strong: #0284c7;
        }

        * { box-sizing: border-box; }
        body {
            font-family: 'Inter', system-ui, Arial, sans-serif;
            margin: 0;
            color: var(--text);
            background: #f8fafc;
            min-height: 100vh;
        }

        .container { display: grid; grid-template-columns: 1fr 1fr; min-height: 100vh; }
        .left { display: flex; align-items: center; justify-content: center; padding: 3rem; }

        .form-card {
            width: 100%; max-width: 460px; padding: 2rem;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 18px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
            backdrop-filter: saturate(1.2) blur(8px);
            -webkit-backdrop-filter: saturate(1.2) blur(8px);
        }
        h1 { margin: 0 0 0.5rem; font-size: 1.9rem; letter-spacing: -0.5px; }
        .subtitle { margin: 0 0 1.25rem; color: var(--muted); }
        .field { margin: 0.9rem 0; }
        label { display: block; font-size: 0.9rem; margin-bottom: 0.35rem; color: #1f2937; font-weight: 600; }
        input {
            width: 100%; padding: 0.7rem 0.9rem; border: 1px solid var(--input);
            border-radius: 10px; font-size: 1rem; background: rgba(255,255,255,0.9);
            outline: none; transition: box-shadow 0.2s ease, border-color 0.2s ease;
        }
        input:focus { border-color: var(--primary); box-shadow: 0 0 0 3px rgba(14,165,233,0.25); }
        .btn {
            width: 100%; margin-top: 1.1rem; padding: 0.8rem; border: none;
            border-radius: 12px; color: #fff; font-weight: 700; cursor: pointer;
            background: linear-gradient(135deg, var(--primary), var(--primary-strong));
            box-shadow: 0 10px 20px rgba(2,132,199,0.35);
            transition: transform 0.05s ease, box-shadow 0.2s ease;
        }
        .btn:hover { transform: translateY(-1px); box-shadow: 0 12px 26px rgba(2,132,199,0.45); }
        .error { margin-top: 0.6rem; color: #dc2626; font-weight: 600; }

        .right { position: relative; }
        .hero-img { width: 100%; height: 100%; object-fit: cover; filter: saturate(1.05) contrast(1.02); }
        .overlay { position: absolute; inset: 0; background: linear-gradient(90deg, rgba(0,0,0,0.45), rgba(0,0,0,0.05)); }
        .hero-text {
            position: absolute; left: 2rem; bottom: 2rem; color: #fff;
            text-shadow: 0 2px 12px rgba(0,0,0,0.45);
        }
        .hero-text h2 { margin: 0; font-size: 2rem; }
        .hero-text p { margin: 0.25rem 0 0; opacity: 0.9; }
        .credit { position: absolute; top: 10px; right: 10px; font-size: 0.8rem; color: #fff; opacity: 0.85; }
        .credit a { color: #fff; text-decoration: underline; }

        @media (max-width: 980px) {
            .container { grid-template-columns: 1fr; }
            .right { display: none; }
            .left { padding: 2rem; }
            .form-card { max-width: 520px; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <div class="form-card">
                <h1>Connexion administrateur</h1>
                <p class="subtitle">Veuillez vous authentifier pour accéder au tableau de bord.</p>
                <form action="/admin/login" method="post">
                    <div class="field">
                        <label for="nom">Nom</label>
                        <input type="text" id="nom" name="nom" value="${nom}" required />
                    </div>
                    <div class="field">
                        <label for="mdp">Mot de passe</label>
                        <input type="password" id="mdp" name="mdp" required />
                    </div>
                    <button class="btn" type="submit">Se connecter</button>
                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>
                </form>
            </div>
        </div>
        <div class="right">
            <img class="hero-img" alt="Sprinter de transport en commun" src="https://images.pexels.com/photos/4061974/pexels-photo-4061974.jpeg?auto=compress&cs=tinysrgb&w=1920&h=1280&dpr=1" />
            <div class="overlay"></div>
            <div class="hero-text">
                <h2>Transport rapide et fiable</h2>
                <p>Gérez votre flotte en toute simplicité.</p>
            </div>
            <div class="credit">Photo: <a href="https://commons.wikimedia.org/wiki/File:Mercedes-Benz_Sprinter_(First_generation)_--_05-14-2011.jpg" target="_blank">Wikimedia Commons</a></div>
        </div>
    </div>
</body>
</html>
