# Jeu de Quizz en Swift 

Ce jeu de Quiz en Swift permet aux joueurs de répondre à des questions dans différentes catégories et difficultés (`Question.json`) . Les scores des joueurs sont enregistrés dans un fichier JSON (`GestionScore.json`)  et peuvent être consultés dans un tableau des scores.

## Configuration 

1. **main.swift**: Assurez-vous d'avoir swift d'installé sur votre ordinateur 
2. **Fichiers JSON**: Assurez-vous que les fichiers JSON contenant les questions (`Question.json`) et le score (`GestionScore.json`) soient présents dans le même répertoire que le fichier exécutable.

## Démarrage du Jeu

1. Ouvrez visual studio code 
2. Exécutez le programme en utilisant le terminal visual studio code ./main.

## Comment jouer 

1. Au lancement du jeu, un menu vous sera présenté avec différentes options :
    - **Jouer (1)** : Permet de commencer une partie.
    - **Score (2)** : Affiche le tableau des scores et des joueurs.
    - **Règles du jeu (3)** : Affiche les règles du jeu.
    - **Quitter (4)** : Permet de quitter le jeu.
      
2. Lorsque vous choissisez de jouer, vous devrez entrer un nom d'utilisateur et choisir la difficulté des questions (Facile, Moyens, Difficile).
3. Après avoir sélectionné la difficulté, des questions vous seront posés tour par tour ("Une par une"). Pour chaque question, vous devrez entrer la lettre de la réponse que vous pensez être correcte (A, B, C ou D).
4. Le jeu enregistrera automatiquement votre score à la fin de la partie.
5. Vous pouvez consulter le tableau des scores à tout le moment via le menu principal.



Bonne chance chère utilisateur ! 
