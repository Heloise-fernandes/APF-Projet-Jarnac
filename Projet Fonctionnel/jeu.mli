(*=================== Type du jeu ===================*)
type plateaujoueur = {grille : char array array; mutable numLigne : int;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : Lapioche.piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}

(*============== Initialisation du jeu ==============*)
	(* Role : Creer un nouveau plateau
	   Param : unit
	   Retour : un plateau *)
	val nouveauPlateau : unit -> plateaujoueur
	
	(* Role : Creer un nouveau joueur
	   Param : le nom du joueur
	   Retour : un joueur *)
	val ajouterUnJoueur : string -> joueur
	
	(* Role : Creer une nouvelle partie
	   Param : unit
	   Retour : une partie*)
	val nouvellePartie : unit -> partie

(*================== Action du Dico =================*)
	(* Role : Test si le mot est dans le dictionnaire
	   Param : le mot
	   Retour : la réponse sous forme de booeen *)
	val estDansDictionnaire : string -> bool

(*==================== Action jeu ===================*)

	(* Role : Ajoute un mot dans le tableau
	   Param : le joueur dont le tableau et la main doit être modifié, le mot et la ligne à modifier 
	   Retour : unit *)
	val ajoutMotTab : joueur -> string -> int -> unit
	 
	(* Role : Action passer
	   Param : num du joueur qui jouait
	   Retour : num du joueur qui va jouer *)
	val passer : int -> int
	
	(* Role : Action Transformer
	   Param : unit
	   Retour : nom joueur1, nom joueur2 *)
	val transformer : joueur -> int-> (string * int)
	
	(* Role : Former
	   Param : le joueur qui effectue l'action
	   Retour : le mot à était formé *)
	val former : joueur -> bool
	
	(* Role : Demande au joueur une action et appelle la fonction voulu selon la réponse
	   Param : le joueur qui joue
	   Retour : unit*)
	val demanderChoixAction : joueur -> unit
	
(*====================== Jarnac =====================*)
	(* Role : Enlève le mot voller du tableau du joueur
	   Param : le joueur qui subis un jarnac et la ligne volée
	   Retour : unit *)
	val miseAjourAnarc : joueur -> int -> unit
	
	(* Role : Ajoute le mot vollé au joueur qui arnac et met à jour(supprime les lettre de sa main et son mot) le joueur qui subit le jarnac
	   Param : le joueur qui joue et celui qui subit le jarnac
	   Retour : unit*)
	val ajoutMotJarnac : joueur -> joueur -> string -> unit
	
	(* Role : Demande au joueur s'il veux faire un coup de jarnac
	   Param : le joueur qui joue et celui qui subit le jarnac
	   Retour : unit *)
	val coupJanac : joueur -> joueur -> unit

(*================== Action piocher =================*)
	(* Role : Pioche 1 lettre puis demande de choisir une action
	   Param : le joueur qui joue
	   Retour : nom joueur1, nom joueur2 *)
	val jouersansEchange : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*------------- Action piocher Echange --------------*)
	(* Role : Demande les 3 lettres à echanger
	   Param : le joueur qui joue
	   Retour : les lettres suplémentaire et la nouvelle pioche *)
	val actionEchangerUnelettre : joueur -> (Lapioche.piocheJeu * Lapioche.piocheJeu)
	
	(* Role : Echange 3 lettres puis demande de choisir une action
	   Param : le joueur qui joue
	   Retour : v*)
	val joueravecEchanger : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*-------------- Action piocher Tour1 ---------------*)
	(* Role : Pioche 6 lettres,demande de former un mot, ajoute une lettre à la main puis demande de choisir une action
	   Param : le joueur qui joue
	   Retour : la nouvelle pioche *)
	val jouerPiocherTour1 : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*-------------------- schema -----------------------*)	
	(* Role : Jouer le premier tour pour un joueur
	   Param : le joueur qui joue
	   Retour : la nouvelle pioche *)
	val schemaExecutionTourUn : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu
	
	(* Role : Jouer le N ieme tour pour un joueur
	   Param : le joueur qui joue
	   Retour :la nouvelle pioche *)
	val schemaExecutionTourN : joueur -> Lapioche.piocheJeu -> Lapioche.piocheJeu

(*================ Calcul des Scores ================*)
	(* Role : Calcul le score d'un joueur
	   Param : un joueur
	   Retour : unit *)
	val scoreJoueur : joueur -> unit

	(* Role : Donne les résultats de la partie
	   Param : une partie
	   Retour : unit *)
	val resultat : partie -> unit

(*===================== Charger =====================*)
	(* Role : Charge une partie
	   Param : unit
	   Retour : une partie *)
	val charger : unit -> partie
	
(*==================== Sauvegarde ===================*)
	(* Role : Demande si le joueur veux savegarder et si oui sauvegarde
	   Param : une partie 
	   Retour : vrai si'il y a eu sauvegarde faux sinon *)
	val sauvegarder : partie -> bool

	(* Role : Ecrit un plateau dans un fichier
	   Param : un plateau et un fichier de sortie
	   Retour : unit *)
	val ecrirePlateau : plateaujoueur -> out_channel -> unit
	
	(* Role : Ecrit un joueur dans un fichier 
	   Param : un joueur et un fichier de sortie
	   Retour : unit *)
	val ecrireJoueur : joueur -> out_channel -> unit
	
	(* Role : Ecrit une partie dans un fichier
	   Param : une partie et un fichier de sortie
	   Retour : unit *)
	val ecrirePartie : partie -> out_channel -> unit

	(* Role : Sauvegarde une partie
	   Param : une partie
	   Retour : unit*)
	val sauvegarde : partie -> string -> unit

(*======================= Jeu =======================*)
	(* Role : Jouer le premier tour
	   Param : une partie
	   Retour : vrai si'il y a eu sauvegarde faux sinon *)
	val premierTour : partie -> bool
	
	(* Role : Jouer le N ieme tour
	   Param : une partie
	   Retour : vrai si'il y a eu sauvegarde faux sinon *)
	val nEmeTour : partie -> bool

