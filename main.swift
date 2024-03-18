//Partie projet : 
import Foundation
import Darwin //Juste une bibliothèque pour me permettre de quitter le programme


//Problème 1 : Le jeu la se compile mais je peux pas faire de retour en arrière Peux être mettre une boucle pour retourner en arrière ?


// Déclaration de la structure Question
//N'oublions pas que nous devons tester l'utilisateur sur différents sujets : culture générale, science,histoire...
struct Question: Codable {
    var question: String
    var reponse: String
    var reponseCorrecte: String
    var difficulte: String
    var category: String
}

// Fonction pour charger et accéder au JSON
func ChargementAccèsJSON(filename: String) {
    let url = URL(fileURLWithPath: filename)
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let questions = try decoder.decode([Question].self, from: data)
        for q in questions {
            print("Question : \(q.question)")
            print("Réponse : \(q.reponse)")
            print("Réponse Correcte : \(q.reponseCorrecte)")
            print("Difficulté : \(q.difficulte)")
            print("Catégorie : \(q.category)")
            print("--------------------")
        }
    } catch {
        print("Erreur lors du chargement et de l'accès au JSON : \(error)")
    }
}

// Mettre accès au JSON
let FichierJSON = "Project.json"

//On boucle sera toujours true donc on rentrera dans la condition pour que le jeu retourne en arrière pour éviter les fin de parties comme cela Test : 
while true {
print("+---------Projet----------+")
print("|                         |")//Consommation d'espace pour rien à modifier 
print("|  Bievenue dans le menu  |")
print("+-------------------------+")
print("|          Menu :         |")
print("|-------------------------|")
print("|        1. Jouer         |")
print("|    2. Règles du jeu     |")
print("|       3. Quitter        |")
print("+-------------------------+")

// Obtention de l'entrée de l'utilisateur
print("\nVeuillez entrer votre choix (1-3) : ")

if let choice = readLine(), let option = Int(choice) {
    switch option {
    case 1:
        print("\nVous avez choisi de jouer au jeu.")
        print("Entrez un nom d'utilisateur :")
        if let nomUtilisateur = readLine() {
            print("\nVeuillez choisir la difficulté des questions : ")
            print("1. Facile")
            print("2. Moyen")
            print("3. Difficile")

            if let choixDifficulte = readLine(), let optionDifficulte = Int(choixDifficulte) {
                switch optionDifficulte {
                case 1:
                    print("Difficulté Facile choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                    ChargementAccèsJSON(filename: "Project.json")
                case 2:
                    print("Difficulté Moyenne choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                    ChargementAccèsJSON(filename: "Project.json")

                case 3:
                    print("Difficulté Difficile choisie. Bonne chance, \(nomUtilisateur) !\n\n")
                    ChargementAccèsJSON(filename: "Project.json")

                default:
                    print("Choix de difficulté invalide")
                }
            }
        }

    case 2:
        print("\nVoici les règles du jeu : ")
        print("\nRègles du jeu : BLABLABLABLA\n\n")
    case 3:
        print("Vous avez choisi de quitter")
      exit()
    default:
        print("Choix invalide")
    }
} else {
    print("Entrée invalide")
}
}

