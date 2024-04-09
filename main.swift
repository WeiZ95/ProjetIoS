/* Réponse chronométré : Il faut toucher la fonction jouer et prendre la date actuels et la comparer*/

import Foundation

//Déclaration des structure Question et Utilisateur pour les deux fichiers 
struct Question: Codable {
      var question: String
      var reponse: [String] // On utilise [String] car c'est un tableau et pas une chaine de caractère 
      var reponseCorrecte: String
      var difficulte: String
      var categorie: String
  }

  struct Utilisateur: Codable {
    var nomUtilisateur: String
    var scoresFacile: Int
    var scoresMoyen: Int 
    var scoresDifficile: Int 
}


 /*Function jouer elle doit prendre en paramètre le nom du joueur et la question à chaque fois que l'utilisateur à une question il peux choisir la liste des réponse en utilisant la lettre de la réponse qu'il souhaite choisir et validé*/

  func jouer(nomUtilisateur: String, questions: [Question]) -> Int {
    //Déclaration des variables scores et du mélangeur de questions (Shuffle ou shuffled)
    var scores = 0     
    let questionsMelangees = questions.shuffled()

    // Affichage des Question par question et surtout mélanger ! 
    for (index, question) in questionsMelangees.enumerated() { 
      print("Question \(index+1): \(question.question)\n")

    //Pareils il faut afficher les réponse qui sont possible 
    for (index, reponse) in question.reponse.enumerated(){
      print("Réponse \(index+1): \(reponse)")
      }

    //Demander à l'utilisateur de choisir une réponse 
      print("\nEntrez la lettre de la réponse que vous pensez correcte : ", terminator: " ")

      //Début du chronométre
     let debutChrono = Date()
     if let reponseUtilisateur = readLine() {
       let finChrono = Date()
       let tempsEcoulement = finChrono.timeIntervalSince(debutChrono)

       if tempsEcoulement <= 5 && reponseUtilisateur == question.reponseCorrecte {
            print("Vous avez répondu en moins de 5 secondes. Des points supplémentaire vous ont été accordés ")
            scores += 9
       }
    //Gestion du score de l'utilisateur
    if reponseUtilisateur == question.reponseCorrecte {
      print("Réponse correct !\n")
      scores = scores + 20
    } else {
      print("Réponse Inccorect !\n")
      scores = scores - 30
    } 
 } else {
       print("Aucune réponse saisie dans le délai imparti.")
       }
    }
    //Afficher le score de l'utilisateur en fin de partie
    print("\n\nLe score de votre partie \(nomUtilisateur) est de : \(scores)\n\n")
    return scores
  }

  // Fonction pour charger les données depuis le fichier JSON
     func chargerUtilisateurs(from filename: String) -> [Utilisateur]? {
        let url = URL(fileURLWithPath: filename)
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let utilisateurs = try decoder.decode([Utilisateur].self, from: data)
        // Retourner les utilisateurs pour pouvoir les manipuler dans le programme 
        return utilisateurs
    } catch {
        print("Erreur lors du chargement des utilisateurs : \(error)")
        return nil
    }
}

// Fonction pour charger les questions du fichier JSON de GestionScore.json
func ChargementAccèsJSON(filename: String) -> [Question]? {
    let url = URL(fileURLWithPath: filename)
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let questions = try decoder.decode([Question].self, from: data)
        //Retourner la questions pour pouvoir la passer dans la fonction jouer
        return questions 
        } catch {
        print("Erreur lors du chargement et de l'accès au JSON : \(error)")
        return nil
    }
}

//Fonction Enregistrer Score il faut qu'elle prenne en paramètre le fichier, le nom d'utilisateur et la difficulte qu'il a choisi
func EnregistrerScore(filename: String, utilisateur: Utilisateur, difficulte: String) {
  let url = URL(fileURLWithPath: filename)

  var utilisateurs: [Utilisateur] = []

  if let UtilisateurExistant = chargerUtilisateurs(from: filename) {
    utilisateurs = UtilisateurExistant
    if let indexExistant = utilisateurs.firstIndex(where: { $0.nomUtilisateur == utilisateur.nomUtilisateur}){
      switch difficulte{
        case "Facile": 
        //On lui passe le score de la difficulte facile 
          utilisateurs[indexExistant].scoresFacile += utilisateur.scoresFacile
        case "Moyen": 
         utilisateurs[indexExistant].scoresMoyen += utilisateur.scoresMoyen
        case "Difficile": 
         utilisateurs[indexExistant].scoresDifficile += utilisateur.scoresDifficile
        default: 
        print("La difficulté n'existe pas")
      }
      //Mise à jour des nouveau utilisateur dans le fichier JSON cela permet de ne pas effacer les anciens utilisateurs 
    } else {
      switch difficulte{
        case "Facile":
          utilisateurs.append(Utilisateur(nomUtilisateur: utilisateur.nomUtilisateur, scoresFacile: utilisateur.scoresFacile, scoresMoyen: 0, scoresDifficile: 0))
        case "Moyen":
          utilisateurs.append(Utilisateur(nomUtilisateur: utilisateur.nomUtilisateur,scoresFacile: 0, scoresMoyen: utilisateur.scoresMoyen,  scoresDifficile: 0))
        case "Difficile":
          utilisateurs.append(Utilisateur(nomUtilisateur: utilisateur.nomUtilisateur, scoresFacile: 0, scoresMoyen: 0, scoresDifficile: utilisateur.scoresDifficile))
        default:
        print("La difficulté n'existe pas")
      } 
    }
    } else {
        utilisateurs.append(utilisateur)
      }
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted

    do {
      let data = try encoder.encode(utilisateurs)
      try data.write(to: url)
      print("Utilisateur \(utilisateur.nomUtilisateur) Difficultes: \(difficulte) Scores : \(utilisateur) : \(utilisateur.scoresFacile) enregistrées avec succès")
      print("Le score à été enregistré dans le fichier \(filename) avec la difficulté : \(difficulte)\n\n")
    } catch {
      print("Voici encore une erreur \(error)")
    }
  }  




  //while true sera toujours true donc on rentrera dans la condition pour que le jeu retourne en arrière pour éviter les fin de parties 
  while true {
  print("+---------Projet----------+")
  print("|      Quizz en swift     |")
  print("+-------------------------+")
  print("|          Menu :         |")
  print("|-------------------------|")
  print("|        1. Jouer         |")
  print("|         2.Score         |")
  print("|    3. Règles du jeu     |")
  print("|       4. Quitter        |")
  print("+-------------------------+")

  // Obtention de l'entrée de l'utilisateur
  print("\nVeuillez entrer votre choix (1-4) : ", terminator : " ")

  if let choix = readLine(), let option = Int(choix) {
      switch option {
      case 1:
          print("\nVous avez choisi de jouer au jeu.\n")
          print("Entrez un nom d'utilisateur :", terminator : " ")
          if let nomUtilisateur = readLine() {
              print("\nVeuillez choisir la difficulté des questions : ")
              print("1. Facile")
              print("2. Moyen")
              print("3. Difficile")

            //Choix difficulté
              if let choixDifficulte = readLine(), let optionDifficulte = Int(choixDifficulte) {
                  switch optionDifficulte {

                  //Démarrage du jeu avec la difficulté facile
                  case 1:
                   print("\nDifficulté Facile choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                   if let questions = ChargementAccèsJSON(filename: "Question.json"){
                       let questionsFacile = questions.filter { $0.difficulte == "Facile"}
                       let score = jouer(nomUtilisateur: nomUtilisateur, questions: questionsFacile)
                       let utilisateur = Utilisateur(nomUtilisateur: nomUtilisateur, scoresFacile: score, scoresMoyen: 0, scoresDifficile: 0) //A changer
                       EnregistrerScore(filename: "GestionScore.json", utilisateur: utilisateur,difficulte: "Facile")
                  }
                  //Démarrage du jeu avec la difficulté moyenne
                  case 2:
                    print("\nDifficulté Moyenne choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                    if let questions = ChargementAccèsJSON(filename: "Question.json"){
                        let questionsMoyen = questions.filter { $0.difficulte == "Moyen"}
                        let score = jouer(nomUtilisateur: nomUtilisateur, questions: questionsMoyen)
                        let utilisateur = Utilisateur(nomUtilisateur: nomUtilisateur, scoresFacile: 0, scoresMoyen: score, scoresDifficile: 0) //A changer
                        EnregistrerScore(filename: "GestionScore.json", utilisateur: utilisateur,difficulte: "Moyen")

                    }

                  //Démarrage du jeu avec la difficulté difficile
                  case 3:
                    print("\nDifficulté Difficile choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                    if let questions = ChargementAccèsJSON(filename: "Question.json"){
                        let questionsDifficile = questions.filter { $0.difficulte == "Difficile"}
                        let score = jouer(nomUtilisateur: nomUtilisateur, questions: questionsDifficile)
                      let utilisateur = Utilisateur(nomUtilisateur: nomUtilisateur, scoresFacile: 0, scoresMoyen: 0, scoresDifficile: score) //A changer 
                        EnregistrerScore(filename: "GestionScore.json", utilisateur: utilisateur,difficulte: "Difficile")
                    }

                  default:
                      print("Choix de difficulté invalide")
                  }
              }
          }
        case 2:
        print("Vous avez choisi de voir le tableau des score : \n")
        if let utilisateurs = chargerUtilisateurs(from: "GestionScore.json") {
          let TriFacile = utilisateurs.sorted{$0.scoresFacile > $1.scoresFacile} //Tri pour le classement Facile
          let TriMoyen = utilisateurs.sorted{$0.scoresMoyen > $1.scoresMoyen} // Tri pour le classement Moyen
          let TriDifficile = utilisateurs.sorted{$0.scoresDifficile > $1.scoresDifficile} // Tri pour le classement Difficile

          //Affichage des scores par difficultés du jeu 
          print("Tableau des scores facile :")
          print("+--------------------------------------------+")
          for utilisateur in TriFacile {
            //https://stackoverflow.com/questions/32338137/padding-a-swift-string-for-printing
            print("| Utilisateur : \(utilisateur.nomUtilisateur) | Score : \(utilisateur.scoresFacile) ".padding(toLength: 45, withPad: " ", startingAt: 0) + "|")
          }
          print("+--------------------------------------------+")

          print("Tableau des scores moyens :") 
          print("+--------------------------------------------+")

          for utilisateur in TriMoyen {
            print("| Utilisateur : \(utilisateur.nomUtilisateur) | Score : \(utilisateur.scoresMoyen) ".padding(toLength: 45, withPad: " ", startingAt: 0) + "|")

          }
          print("+--------------------------------------------+")

          print("Tableau des scores difficile : ") 
          print("+--------------------------------------------+")
          for utilisateur in TriDifficile {
            print("| Utilisateur : \(utilisateur.nomUtilisateur) | Score : \(utilisateur.scoresDifficile) ".padding(toLength: 45, withPad: " ", startingAt: 0) + "|")
          }
          print("+--------------------------------------------+\n\n")
        }else {
          print("Erreur dans le chargement du fichiers GestionScore.json")
        }

      case 3:
          print("\nRègles du jeu : \n")
          print("Le jeu se compose de questions d'histoire, de science... Le but de ce jeu est similaire à un quiz, c'est-à-dire que vous avez des questions et vous devez répondre à chaque question (par le biais de la lettre de la réponse que vous pensez juste (A, B, C, D)). \n\nSi vous êtes un nouvel utilisateur, le score vous sera attribué. Si vous êtes déjà membre du jeu, le score sera ajouté à votre score précédent.\n\nSi vous répondez incorrectement, vous perdrez donc un certain nombre de points.\n\nVotre score vous sera donné à la fin du jeu et vous aurez la possibilité de consulter votre classement en temps réel directement dans le menu. \n\nBonne chance, puisse le sort vous être favorable !\n\n ")
      case 4:
          print("Vous avez choisi de quitter")
          exit(0) // Permet d'exit le programme | boucle avec un while true ("Evite de le relancer à chaque fois")
      default:
          print("Choix invalide")
      }
  } else {
      print("Entrée invalide\n")
      }
  }