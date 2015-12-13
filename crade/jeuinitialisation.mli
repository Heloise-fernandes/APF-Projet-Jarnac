type piocheJeu = char list
type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}

(*PICOHE*)
val laPiocheDebut : (int*char) list

val creerPioche : (int*char) list -> piocheJeu
	
val getElmtRandom : piocheJeu -> int ->(char * piocheJeu)

val melanger : piocheJeu -> piocheJeu

val piocher : piocheJeu-> int -> (piocheJeu * piocheJeu)

val faireEchange : char -> char -> char -> piocheJeu -> (piocheJeu * piocheJeu)
(*INIT*)
val nouveauPlateau : unit -> plateaujoueur

val ajouterUnJoueur : string -> joueur

val nouvellePartie : unit -> partie

(*JEU*)
val estDansDictionnaire : string -> bool

val peutCreerUnMot : char list -> string -> bool

val enleverLettre : char list -> char -> char list

val ajoutMotTab : joueur -> string -> int -> unit 

val transformer : joueur -> int -> string -> bool

val former : joueur -> string -> bool

val passer : int -> int

val printChoixAction : unit -> int

val printChoixActionPioche : unit -> int

val printLettreDispo : char list -> unit

val afficherGrille : char array array -> unit

val tourUn : joueur -> piocheJeu -> piocheJeu

val tourN : joueur -> piocheJeu -> piocheJeu

val demanderChoixAction : joueur -> unit

val demanderUnMotAFormer : joueur -> unit

val demanderUnMotATransformer : joueur -> unit

val demanderligneModif : int -> char array array -> int 

val printLettreTab : joueur -> unit

val getScore : char array array -> int -> int

val scoreJoueur : joueur -> unit

val miseAjourAnarc : joueur -> int -> unit

val ajoutMotJarnac : joueur -> joueur -> string -> unit

val jarnac : joueur -> joueur -> int -> string -> bool

val demanderUnMotAJarnac : joueur -> joueur -> bool

val demanderJarnac : unit -> string 

val coupJanac : joueur -> joueur -> unit

val resultat : partie -> unit

val premierTour : partie -> unit

val nEmeTour : partie -> unit

val actionEchangerUnelettre : joueur -> (piocheJeu * piocheJeu)

val jouersansEchange : joueur -> piocheJeu -> piocheJeu

val joueravecEchanger : joueur -> piocheJeu -> piocheJeu


