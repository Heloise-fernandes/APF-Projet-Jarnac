(*================Chargement===============*)

	(* Role : Transformer un caractère en nombre
	   Param : un caractère
	   Retour : l'entier correspondant 
	   exemple de cours*)
	val digit : char -> int
	
	(* Role : Renvoie le caractère si c'est une lettre
	   Param : un flot de caractère
	   Retour : le carctère 
	   exemple de cours*)
	val chiffre : char Stream.t -> char
	
	(* Role : Renvoie le caractère si c'est un chiffre
	   Param : un flot de caractère
	   Retour : un carctère 
	   exemple de cours*)
	val lettre : char Stream.t -> char
	
	(* Role : Lit une pioche dans un flot de caractères
	   Param : un flot de caractère
	   Retour : la pioche et le reste du flots *)
	val chargePioche : char Stream.t -> char list * char Stream.t
	
	(* Role : Lit le numéro du tour dans un flot de caractères
	   Param : un flot de caractère
	   Retour : le tour et le reste du flots *)
	val chargeTour : int-> char Stream.t -> int * char Stream.t
	
	(* Role : Lit le nom d'un joueur dans un flot de caractères
	   Param : un flot de caractère
	   Retour : le nom et le reste du flot *)
	val chargeNomjoueur : char Stream.t -> string * char Stream.t
	
	(* Role : Lit une grille et le numDelaprochaineLigne à remplir dans un flot de caractères
	   Param : un flot de caractère
	   Retour : une liste de caractère correspondant à la grille,le numDelaprochaineLigne à remplir et le reste du flot *)
	val chargeTabEtLigne : char Stream.t -> int * char list * char Stream.t
	
	(* Role : Lit la main d'un joueur et son score dans un flot de caractères
	   Param : un flot de caractère
	   Retour : la main d'un joueur , son score et le reste du flot *)
	val chargeScorePlusMain : char Stream.t -> int * char list * char Stream.t
	
	(* Role : Lit le numero du joueur qui doit jouer dans un flot de caractères
	   Param : un flot de caractère
	   Retour : numero du joueur et le reste du flot *)
	val chargeNumJ: char Stream.t -> int * char Stream.t
	
	(* Role : creer une grille à partir d'une liste de carctère
	   Param : une liste de carctères
	   Retour : une grille *)
	val remplirtab : char list -> char array array
	
	(* Role : Charge une partie et renvoie tout les éléments nécessaire a la création d'une partie
	   Param : un flots
	   Retour : tous les éléments nécessaire à la création d'une partie *)
	val chargerPartie : string -> char list*int*string*int*char array array*int*char list*string*int*char array array*int*char list*int * bool
					        
