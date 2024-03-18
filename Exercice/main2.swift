// Exercice 1
print("Exercice 1")
//Création d'un tableau d'entiers
var tableau_entiers = [1, 2, 3, 4, 5]
// Ajout au tableau d'entiers
tableau_entiers += [6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
//Supression du 1 éléments du tableau soit 2 : Tableau = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,] (Indice du tableau)
tableau_entiers.remove(at: 1)
//Boucle for pour afficher les éléments du tableau
for element in tableau_entiers {
    print(element)
}
print("\n")

// Exercice 2
print("Exercice 2:")
//Création d'un tableau de chaîne de caractères représentant des couleurs
var couleurs = ["rouge", "vert", "bleu", "jaune", "orange"]
//Remplacement de la couleur à l'indice 3 du tableau par violet
couleurs[3] = "violet"
// Affichage de la première couleur
print(couleurs[0])
//Affichage de la couleur remplacer
print(couleurs[3])
// Affichage de la dernière couleur 
print(couleurs.last ?? "") 
// Vérification de la taille du tableau avant l'accès à l'index 4
if couleurs.count >= 5 {
    print(couleurs[4])
}
print("\n")

// Exercice 3
print("Exercice 3:")
//Déclaration de cordonnées en 2 + point en 3D
let coordonnees = (x: 3, y: 4)
let point_3d = (x: 1, y: 2, z: 5)
//Affichage des cordonnées 
print(coordonnees)
print(point_3d)
print("\n")

// Exercice 4
print("Exercice 4:")
//Déclaration d'une personne avec un tuple
let personne = (nom: "Romain", age: 21, titrePoste: "Ingénieur")
//Affichage des différentes informations de la personne
print("Nom :", personne.nom)
print("Age :", personne.age)
print("Titre de poste :", personne.titrePoste)
print("\n")

// Exercice 5
print("Exercice 5:")
//Création d'un dictionaire 
var ages: [String: Int] = ["Alicia": 25, "Bobby": 30, "Charles": 22]
//Ajout de nouvelles entrées
ages["David"] = 28
ages["Eva"] = 35
//Mise à jour de l'âge de Charles
ages["Charles"] = 23
//Supression de l'entrée Bobby
ages.removeValue(forKey: "Bobby")
//Parcours du dictionaire avec impression
for (nom, age) in ages {
    print(nom, age)
}
print("\n")

// Exercice 6
print("Exercice 6:")
// Création d'un dictionnaire représentant une voiture
var voiture: [String: Any] = ["couleur": "noir", "marque": "Ford", "année": 2022, "modèle": "Mustang GT 500"]
//Accès et impression de la valeur de marque si elle n'existe pas on met une chaine de caractère par défaut
print(voiture["marque"] ?? "")
// Accès direct au modèle de la voiture sans conversion optionnelle
let modele = voiture["modèle"]
// Si la clé existe et que la valeur n'est pas nulle, imprimer le modèle de la voiture
if modele != nil {
    print(modele!)
}
print("\n")


// Exercice 7
print("Exercice 7:")
//Création d'un tableau d'entiers
var entiers = [4, 1, 7, 2, 9]
//Tri du tableau dans l'ordre croissant
let triCroissant = entiers.sorted()
//Tri du tableau dans l'ordre décroissant
let triDecroissant = entiers.sorted(by: >)
//affichage du tableau dans l'odre croissant
print("Tableau croissant :", triCroissant)
//affichage du tableau dans l'ordre décroissant
print("Tableau décroissant :", triDecroissant)
print("\n")

// Exercice 8
print("Exercice 8:")
// Création d'un tableau de dictionnaires représentant des livres
var livres: [[String: Any]] = []
// Ajout de livres avec la fonction append
livres.append(["titre": "Game of Thrones", "auteur": "George R.R. Martin", "année": 1996])
livres.append(["titre": "Le Seigneur des Anneaux", "auteur": "J.R.R. Tolkien", "année": 1954])
livres.append(["titre": "Harry Potter", "auteur": "J.K. Rowling", "année": 1997])

// Parcours du tableau de livres et affichage des titres et auteurs
for livre in livres {
    if let titre = livre["titre"] as? String, let auteur = livre["auteur"] as? String {
        print("Titre: \(titre), Auteur: \(auteur)")
    }
}
print("\n")

// Exercice 9
print("Exercice 9:")
// Création d'un dictionnaire représentant une bibliothèque de livres
var bibliotheque: [String: [String]] = [
    "fiction": ["Game of Thrones", "Le Seigneur des Anneaux", "Harry Potter"],
    "non-fiction": ["Sapiens: Une brève histoire de l'humanité", "Thinking, Fast and Slow", "The Power of Habit"]
]
// Parcours du dictionnaire et impression de chaque paire genre-titres
for (genre, titres) in bibliotheque {
    print("\(genre): \(titres.joined(separator: ", "))")
}
print("\n")



// Exercice 10
print("Exercice 10:")

// Création d'un dictionnaire associant des noms de produits à leurs prix
var produits: [String: Double] = [
    "Ordinateur portable": 1200.0,
    "Smartphone": 700.0,
    "Écouteurs sans fil": 100.0,
    "Souris gaming": 50.0,
    "Disque dur externe": 120.0
]

// Function pour filtrer le produit par prix 
func filtrerProduitsParPrix(produits: [String: Double], limite: Double) -> [String: Double] {
    var produitsFiltres = [String: Double]()

    for (nomProduit, prix) in produits {
        if prix < limite {
            produitsFiltres[nomProduit] = prix
        }
    }

    return produitsFiltres
}

// Test de la fonction avec une limite de prix de 150.0
let produitsFiltres = filtrerProduitsParPrix(produits: produits, limite: 150.0)

// Affichage du résultat
print("Produits en dessous de la limite de prix:")
for (nomProduit, prix) in produitsFiltres {
    print("\(nomProduit): \(prix) euros")
}
print("\n")



//TEST TP4

//Exercice TP4 : 
print("Exercice TP4 : ")

// Définition de la structure Livre
struct Livre {
  var titre: String
  var auteur: String
  var codeISBN: String
  var disponible: Bool

  init(titre: String, auteur: String, codeISBN: String) {
      self.titre = titre
      self.auteur = auteur
      self.codeISBN = codeISBN
      self.disponible = true
  }
}

// Définition de la structure Utilisateur
struct Utilisateur {
  var nom: String
  var id: String
  var livresEmpruntés: [String]

  // Fonction pour emprunter un livre
  func livreEmprunté(isbn: String, livres: [String: Livre]) -> Utilisateur {
      if var livre = livres[isbn], livre.disponible {
          var nouveauxLivresEmpruntes = livresEmpruntés
          nouveauxLivresEmpruntes.append(isbn)

          livre.disponible = false

          return Utilisateur(nom: nom, id: id, livresEmpruntés: nouveauxLivresEmpruntes)
      }
      return self
  }

  // Fonction pour retourner un livre
  func livreRetour(isbn: String, livres: [String: Livre]) -> Utilisateur {
      if let index = livresEmpruntés.firstIndex(of: isbn), var livre = livres[isbn] {
          var nouveauxLivresEmpruntes = livresEmpruntés
          nouveauxLivresEmpruntes.remove(at: index)

          // Mettre à jour la disponibilité du livre
          livre.disponible = true

          return Utilisateur(nom: nom, id: id, livresEmpruntés: nouveauxLivresEmpruntes)
      }
      return self
  }
}

// Définition de la structure Bibliothèque
struct Bibliothèque {
  var livres: [String: Livre]
  var utilisateurs: [String: Utilisateur]

  // Fonction pour ajouter un livre à la bibliothèque
  mutating func ajoutLivre(livre: Livre) {
      livres[livre.codeISBN] = livre
  }

  // Fonction pour enregistrer un utilisateur
  mutating func enregistrerUtilisateur(utilisateur: Utilisateur) {
      utilisateurs[utilisateur.id] = utilisateur
  }

  // Fonction pour qu'un utilisateur prenne un livre en emprunt
  mutating func prendreLivre(isbn: String, utilisateurId: String) {
      if var utilisateur = utilisateurs[utilisateurId] {
          utilisateur = utilisateur.livreEmprunté(isbn: isbn, livres: livres)
          utilisateurs[utilisateurId] = utilisateur
      }
  }

  // Fonction pour qu'un utilisateur retourne un livre
  mutating func livreRetour(isbn: String, utilisateurId: String) {
      if var utilisateur = utilisateurs[utilisateurId] {
          utilisateur = utilisateur.livreRetour(isbn: isbn, livres: livres)
          utilisateurs[utilisateurId] = utilisateur
      }
  }
}

// Création de quelques instances de livres  soit 2 
let livre1 = Livre(titre: "Harry Potter", auteur: "J.K. Rowling", codeISBN: "12345")
let livre2 = Livre(titre: "Lord of the Rings", auteur: "J.R.R. Tolkien", codeISBN: "67890")

// Création d'une instance de bibliothèque
var bibliothèque = Bibliothèque(livres: [:], utilisateurs: [:])

// Ajout de livres dans la bibliothèque
bibliothèque.ajoutLivre(livre: livre1)
bibliothèque.ajoutLivre(livre: livre2)

// Création d'utilisateurs
let utilisateur1 = Utilisateur(nom: "Alice", id: "001", livresEmpruntés: [])
let utilisateur2 = Utilisateur(nom: "Bob", id: "002", livresEmpruntés: [])

// Enregistrement des utilisateurs dans la bibliothèque
bibliothèque.enregistrerUtilisateur(utilisateur: utilisateur1)
bibliothèque.enregistrerUtilisateur(utilisateur: utilisateur2)

// Emprunt et retour des livres
bibliothèque.prendreLivre(isbn: "12345", utilisateurId: "001")
bibliothèque.prendreLivre(isbn: "67890", utilisateurId: "002")

bibliothèque.livreRetour(isbn: "12345", utilisateurId: "001")
bibliothèque.livreRetour(isbn: "67890", utilisateurId: "002")

for (userId, utilisateur) in bibliothèque.utilisateurs {
    print("ID: \(userId), Nom: \(utilisateur.nom)")
    print("Emprunts: \(utilisateur.livresEmpruntés.isEmpty ? "Aucun livre emprunté" : utilisateur.livresEmpruntés.joined(separator: ", "))")
    print("----------------------------")
}

for (codeISBN, livre) in bibliothèque.livres {
    print("Code ISBN: \(codeISBN), Titre: \(livre.titre), Auteur: \(livre.auteur), Disponible: \(livre.disponible ? "Oui" : "Non")")
}

//Exercice 1 : 
print("Exercice 1 : ")

enum JourSemaine: String {
    case lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche
}

func leWeekend(jour: JourSemaine) -> Bool {
    return jour == .samedi || jour == .dimanche
}

let jourEnCours = JourSemaine.samedi
let estWeekend = leWeekend(jour: jourEnCours)

// Phase de test exercice 1
print("Est-ce le week-end ? \(estWeekend)")
print("\n\n")

//Exercice 2 :
print("Exercice 2 :")
enum Temperature {
    case Celsius(Double)
    case Fahrenheit(Double)
    case Kelvin(Double)
}
func convertirEnCelsius(temp: Temperature) -> Double {
    switch temp {
    case .Celsius(let value):
        return value
    case .Fahrenheit(let value):
        return (value - 32.0) * 5.0 / 9.0
    case .Kelvin(let value):
        return value - 273.15
    }
}
//Phase de test de l'exercice 2
let tempFahrenheit = Temperature.Fahrenheit(60.0)
let tempKelvin = Temperature.Kelvin(300.0)
print(convertirEnCelsius(temp: tempFahrenheit)) 
print(convertirEnCelsius(temp: tempKelvin))
print("\n\n")

//Exercice 3 :
print("Exercice 3 : ")
enum Direction {
    case nord, sud, est, ouest

    func opposée() -> Direction {
        switch self {
        case .nord:
            return .sud
        case .sud:
            return .nord
        case .est:
            return .ouest
        case .ouest:
            return .est
        }
    }
}
//Phase de test de l'exercice 3
let directionActuelle = Direction.nord
let directionOpposée = directionActuelle.opposée()
print("Direction actuelle: \(directionActuelle)")
print("Direction opposée: \(directionOpposée)")
print("\n\n")

//Exercice 4 : 
print("Exercice 4 : ")
enum StatusCode: Int {
    case success = 200
    case notFound = 404
}

func getStatusDescription(code: Int) -> String? {
    if let status = StatusCode(rawValue: code) {
        switch status {
        case .success:
            return "Succès"
        case .notFound:
            return "Non trouvé"
        }
    }
    return nil
}
//Phase de test de l'exercice 4
if let description = getStatusDescription(code: 200) {
    print("Code 200: \(description)") 
    print("\n\n")
}


//Exercice 5: Catalogue de produits
print("Exercice 5 : ")
enum Categorie {
    case electronique(String)
    case vetements(String)
    case epicerie(String)
    case voiture(String)
}

struct Produit {
    var nom: String
    var categorie: Categorie
}

func getDescriptionProduit(produit: Produit) -> String {
    switch produit.categorie {
    case .electronique(let sousType):
        return "\(produit.nom) - Catégorie: Electronique, Sous-type: \(sousType)"
    case .vetements(let sousType):
        return "\(produit.nom) - Catégorie: Vêtements, Sous-type: \(sousType)"
    case .epicerie(let sousType):
        return "\(produit.nom) - Catégorie: Épicerie, Sous-type: \(sousType)"
    case .voiture(let sousType) :
      return "\(produit.nom) - Catégorie: Voiture, Sous-type: \(sousType)"
    }
}


//Phase de test de  l'exercice 5
let smartphone = Produit(nom: "Smartphone", categorie: .electronique("Mobile"))
print(getDescriptionProduit(produit: smartphone))
print("\n\n")

//Exercice TP4 : 

print("Exercice TP4 : ")

// Définition de la structure Livre
struct Livre {
  var titre: String
  var auteur: String
  var codeISBN: String
  var disponible: Bool

  init(titre: String, auteur: String, codeISBN: String) {
      self.titre = titre
      self.auteur = auteur
      self.codeISBN = codeISBN
      self.disponible = true
  }
}

// Définition de la structure Utilisateur
struct Utilisateur {
  var nom: String
  var id: String
  var livresEmpruntés: [String]

  // Fonction pour emprunter un livre
  func livreEmprunté(isbn: String, livres: [String: Livre]) -> Utilisateur {
      if var livre = livres[isbn], livre.disponible {
          var nouveauxLivresEmpruntes = livresEmpruntés
          nouveauxLivresEmpruntes.append(isbn)

          livre.disponible = false

          return Utilisateur(nom: nom, id: id, livresEmpruntés: nouveauxLivresEmpruntes)
      }
      return self
  }

  // Fonction pour retourner un livre
  func livreRetour(isbn: String, livres: [String: Livre]) -> Utilisateur {
      if let index = livresEmpruntés.firstIndex(of: isbn), var livre = livres[isbn] {
          var nouveauxLivresEmpruntes = livresEmpruntés
          nouveauxLivresEmpruntes.remove(at: index)

          // Mettre à jour la disponibilité du livre
          livre.disponible = true

          return Utilisateur(nom: nom, id: id, livresEmpruntés: nouveauxLivresEmpruntes)
      }
      return self
  }
}

// Définition de la structure Bibliothèque
struct Bibliothèque {
  var livres: [String: Livre]
  var utilisateurs: [String: Utilisateur]

  // Fonction pour ajouter un livre à la bibliothèque
  mutating func ajoutLivre(livre: Livre) {
      livres[livre.codeISBN] = livre
  }

  // Fonction pour enregistrer un utilisateur
  mutating func enregistrerUtilisateur(utilisateur: Utilisateur) {
      utilisateurs[utilisateur.id] = utilisateur
  }

  // Fonction pour qu'un utilisateur prenne un livre en emprunt
  mutating func prendreLivre(isbn: String, utilisateurId: String) {
      if var utilisateur = utilisateurs[utilisateurId] {
          utilisateur = utilisateur.livreEmprunté(isbn: isbn, livres: livres)
          utilisateurs[utilisateurId] = utilisateur
      }
  }

  // Fonction pour qu'un utilisateur retourne un livre
  mutating func livreRetour(isbn: String, utilisateurId: String) {
      if var utilisateur = utilisateurs[utilisateurId] {
          utilisateur = utilisateur.livreRetour(isbn: isbn, livres: livres)
          utilisateurs[utilisateurId] = utilisateur
      }
  }
}


// Scénario de test
var bibliothèque = Bibliothèque(livres: [:], utilisateurs: [:])

let livre1 = Livre(titre: "Harry Potter", auteur: "J.K. Rowling", codeISBN: "12345")
let livre2 = Livre(titre: "Lord of the Rings", auteur: "J.R.R. Tolkien", codeISBN: "67890")
let livre3 = Livre(titre: "The Hobbit", auteur: "J.R.R. Tolkien", codeISBN: "14694")
let livre4 = Livre(titre: "To Kill a Mockingbird", auteur: "Harper Lee", codeISBN: "22222")

bibliothèque.ajoutLivre(livre: livre1)
bibliothèque.ajoutLivre(livre: livre2)
bibliothèque.ajoutLivre(livre: livre3)
bibliothèque.ajoutLivre(livre: livre4)

let utilisateur1 = Utilisateur(nom: "Alice", id: "001", livresEmpruntés: [])
let utilisateur2 = Utilisateur(nom: "Bob", id: "002", livresEmpruntés: [])

bibliothèque.enregistrerUtilisateur(utilisateur: utilisateur1)
bibliothèque.enregistrerUtilisateur(utilisateur: utilisateur2)

// Alice emprunte deux livres
bibliothèque.prendreLivre(isbn: "12345", utilisateurId: "001")
bibliothèque.prendreLivre(isbn: "67890", utilisateurId: "001")

// Bob emprunte un livre
bibliothèque.prendreLivre(isbn: "14694", utilisateurId: "002")

// Imprime le statut des livres et les détails des utilisateurs
for (userId, utilisateur) in bibliothèque.utilisateurs {
    print("ID: \(userId), Nom: \(utilisateur.nom)")
    print("Emprunts: \(utilisateur.livresEmpruntés.isEmpty ? "Aucun livre emprunté" : utilisateur.livresEmpruntés.joined(separator: ", "))")
    print("----------------------------")
}

for (codeISBN, livre) in bibliothèque.livres {
    print("Code ISBN: \(codeISBN), Titre: \(livre.titre), Auteur: \(livre.auteur), Disponible: \(livre.disponible ? "Oui" : "Non")")
}

/*
func processMovieInfo(titre: String, anneeSortie: Int, note: Double) -> (String, Bool, String) {
  let estClassique = anneeSortie < 2000
  let noteFormatee = String(format: "%.1f", note)

  return (titre, estClassique, noteFormatee)
}

let movieInfo = processMovieInfo(titre: "Nom du film", anneeSortie: 1995, note: 8.4)
print("Titre: \(movieInfo.0)")
print("Est classique: \(movieInfo.1)")
print("Note formatée: \(movieInfo.2)")

*/

/*
import Foundation

// Définition de la structure pour les données JSON
struct Person: Codable {
    var name: String
    var age: Int
    var city: String
    var profession: String
    var mail: String 
}

// Chemin vers le fichier JSON
let jsonFilePath = "Exemple.json"

// Chargement du contenu du fichier JSON | Lecture du fichier JSON
guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
    fatalError("Impossible de charger le fichier JSON")
}

// Décodage des données JSON en utilisant la structure définie
do {
    var people = try JSONDecoder().decode([Person].self, from: jsonData)

    // Tri des personnes par ordre du mail
    people.sort {$0.mail < $1.mail}

    // Affichage des personnes triées
    for person in people {
        print("Nom: \(person.name)")
        print("Âge: \(person.age)")
        print("Ville: \(person.city)")
        print("Profession : \(person.profession)")
        print("Mail : \(person.mail)")
        print("---------------")
    }
} catch {
    print("Erreur lors du décodage du JSON: \(error)")
}
*/

// Décodage des données JSON en utilisant la structure définie



/*
### Exercice 5: Décoder un message caché
**Objectif:** Combiner la lecture JSON, la manipulation des données et la logique pour décoder un message caché à partir d'un fichier JSON. Cet exercice simule un scénario réel dans lequel les données peuvent ne pas être simples à interpréter.

**Tâche:** Le fichier JSON nommé `secret.json` contient une série d'objets. Chaque objet a deux propriétés : `code` (Int) et `fragment` (String). La propriété `code` représente l'ordre dans lequel les fragments doivent être disposés, et le `fragment` fait partie d'un message caché. Écrire un programme Swift pour lire le fichier, trier les objets par la propriété `code`, concaténer les propriétés `fragment` dans l'ordre et imprimer le message décodé sur la console.


print("+---------Projet----------+")
print("|                         |")//Consommation d'espace pour rien à modifier 
print("|  Bievenue dans le menu  |")
print("|                         |")//Consommation d'espace pour rien à modifier 
print("+-------------------------+")
print("|          Menu :         |")
print("|-------------------------|")
print("|        1. Jouer         |")
print("|    2. Règles du jeu     |")
print("|       3. Quitter        |")
print("+-------------------------+")




*/
