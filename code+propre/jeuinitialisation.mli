(*====================Type du jeu====================*)
type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : Lapioche.piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}

(*================Initialisation du jeu================*)
val nouveauPlateau : unit -> plateaujoueur

val ajouterUnJoueur : string -> joueur

val nouvellePartie : unit -> partie

(*================Action du Dico================*)
val estDansDictionnaire : string -> bool

(*=================Action jeu================*)

val ajoutMotTab : joueur -> string -> int -> unit 

val passer : int -> int

val transformer : joueur -> int-> (string * int)

val former : joueur -> bool

val demanderChoixAction : joueur -> unit

(*================Action piocher===============*)

val jouersansEchange : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*-----------Action piocher Echange----------*)
val actionEchangerUnelettre : joueur -> (Lapioche.piocheJeu * Lapioche.piocheJeu)

val joueravecEchanger : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*-------------Action piocher 1--------------*)
val jouerPiocherTour1 : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*-----------------schema -------------------*)	
val schemaExecutionTourUn : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

val schemaExecutionTourN : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*==================Jarnac==================*)
val miseAjourAnarc : joueur -> int -> unit

val ajoutMotJarnac : joueur -> joueur -> string -> unit

val coupJanac : joueur -> joueur -> unit

(*================Calcul des Scores================*)
val scoreJoueur : joueur -> unit

val resultat : partie -> unit
(*================== Sauvegarde ==================*)
val charger : unit -> partie

val sauvegarder : unit -> bool
(*======================Jeu======================*)
val premierTour : partie -> unit

val nEmeTour : partie -> unit
