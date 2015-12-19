(*================Affichage===============*)
	(* Role : Afficher la grille d'un joueur
	   Param : une grille
	   Retour : unit *)
	val printGrille : char array array -> unit

	(* Role : affiche la main d'un joeur
	   Param : la main du joueur
	   Retour : unit*)
	val printLettreDispo : char list -> unit

	(* Role : affiche la grille et la main du joueur
	   Param : une grille et une main
	   Retour : unit*)
	val printLettreTab : char array array -> char list -> unit

	(* Role : affiche les scores des joueurs
	   Param : le score de joueur 1 et le score du joueur 2
	   Retour : unit*)
	val printScore : int -> int -> unit

	(* Role : affiche que le mot ne pas être utilisé
	   Param : unit
	   Retour : unit*)
	val printmotInvalide : unit -> unit

	(* Role : affiche le nom du joueur qui doit jouer
	   Param : le nom du joueur
	   Retour : unit*)
	val printNom : string -> unit
	
	(* Role : affiche si la savegarde n'est pas trouvée
	   Param : unit
	   Retour : unit*)
	val printPasSauvegarde : unit -> unit
