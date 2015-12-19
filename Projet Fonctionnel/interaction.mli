(*=============== Interactions ===============*)
	
	(* Role : Demande le nom des joueurs
	   Param : unit
	   Retour : nom joueur1, nom joueur2 *)
	val demanderNoms : unit -> (string*string)

	(* Role : Demande le nom d'un jeour
	   Param : numero du joueur
	   Retour : un nom *)
	val demanderNom : int -> string

	(* Role : Demande de choisir une action
	   Param : unit
	   Retour : un numéro d'action compris entre 1 et 3 (1:former un mot, 2: transformer un mot, 3 : passer son tour) *)
	val demanderChoixAction : unit -> int

	(* Role : Demande de choisir une acion de pioche
	   Param : unit
	   Retour : un numéro d'action compris entre 1 et 2 (1:piocher une lettre, 2: échanger 3 lettres) *)
	val demanderChoixActionPioche : unit -> int

	(* Role : Demande si le joueur veux faire un coup de jarnac
	   Param : unit
	   Retour : un booleen qui repond à la question *)
	val demanderJarnac : unit -> bool 

	(* Role : Demande un mot de 3 lettres ou plus
	   Param : unit
	   Retour : le mot *)
	val demanderMot3Lettres : unit -> string

	(* Role : Demande un mot de 4 lettres ou plus
	   Param : unit
	   Retour : le mot *)
	val demanderMot4Lettres : unit -> string

	(* Role : Demande un mot avec les trois lettres à échanger
	   Param : une liste de carctère
	   Retour : une string qui contient les trois lettres *)
	val demander3LettresEchanger : char list -> string

	(* Role : Demande au joueur quelle ligne du tableau il veut modifier
	   Param : la ligne à partir de laquelle les lignes sont vide et une grille
	   Retour : la ligne à modif *)
	val demanderligneModif : int -> char array array -> int
	
	(* Role : Demande si le joueur veux savegarder
	   Param : unit
	   Retour : renvoie le nom de la sauvegarde ou une chaine vide dans le cas contraire *)
	val demandeSauvegarde : unit -> string
	
	(* Role : Demande le nom de la savegarde
	   Param : unit
	   Retour : nom de la sauvegarde *)
	val demandeNomSauvegarde : unit -> string
	
	(* Role : demande au joueur s'il veux vraiment charger une partie si le fichier n'est pas trouvé
	   Param : unit
	   Retour : reponse à la quetion sous forme de booleen *)		
	val demandeVerifChargement : unit -> bool

	(* Role : Demande au joueur s'il veux charger une partie
	   Param : unit
	   Retour : le nom de la savegarde ou vide s'il n'existe pas *)
	val demandeChargement : unit -> string

	(* Role : Demande si le joueur veux changer de main
	   Param : unit
	   Retour : reponse à la quetion sous forme de booleen *)
	val demandeNvMain : unit -> bool
