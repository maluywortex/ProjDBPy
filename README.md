# braintraining_forstudents

### Objectif ###

Il s'agit de compléter en python un projet déjà commencé par mon enseignant permettant de créer des exercices interactifs.
Il s'agit d'en faire un outil plus complet qui enregistre les travaux des étudiants et offre une gestion des utilisateurs.
Ce développement aura lieu pendant ma formation de CFC informaticien.\
Version : \
26.10.2023 : ouverture du dépôt

### Comment configurer ma machine pour que le programme fonctionne? ###

Il s'agit d'une application en python réalisée avec tkinter pour la partie graphique. Aucune configuration spécifique n'est requise.\
Il conviendra cependant d'installer le package mysql-connector-python pour l'interaction avec la BD et d'exécuter le script SQL du modèle dans MySQL Workbench.

La connexion utilise par défaut le serveur `localhost`, l'utilisateur `root`, un mot de passe vide et la base `mydb`. Ces paramètres peuvent être remplacés avec les variables d'environnement `DB_HOST`, `DB_USER`, `DB_PASSWORD` et `DB_NAME`.
Les résultats sont enregistrés dans les tables `User`, `Exercice` et `Result`.

### A qui puis-je m'adresser? ###

Propriétaire du dépôt : frederique.andolfatto@eudvaud.ch\
Enseignant ayant créé le projet de base : jeanphilippe.chavey@eduvaud.ch
