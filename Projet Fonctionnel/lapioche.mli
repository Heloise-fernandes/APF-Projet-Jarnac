(*================Type Pioche================*)
	type piocheJeu = char list

(*===============Action Pioche===============*)

	(* Il s'agit d'une liste commposée de 26 éléments x où x est composé d'une lettre et d'une nombre d'occurence dans une partie*)
	val laPiocheDebut : (int*char) list
	
	(* Role : creer une pioche à partir de laPiocheDebut
	   Param : laPiocheDebut
	   Retour : une pioche*)
	val creerPioche : (int*char) list -> piocheJeu
		
	(* Role : recupère un élément à l'indice n et la retire de la liste
	   Param : une pioche et un indice
	   Retour : un caractère et une pioche privé de ce caractère*)
	val getElmtRandom : piocheJeu -> int ->(char * piocheJeu)

	(* Role : permet de mélanger les letres aléatoirement
	   Param : une pioche
	   Retour : la nouvelle pioche*)
	val melanger : piocheJeu -> piocheJeu

	(* Role : Permet de piocher un nombre n de lettre
	   Param : le nombre de letre et la pioche
	   Retour : les n lettres voulu sous forme de list et la nouvelle pioche*)
	val piocher : piocheJeu-> int -> (piocheJeu * piocheJeu)

	(* Role : Permet d'échanger trois lettre contre 3 autres
	   Param : les 3 lettre et la pioche
	   Retour : les nouvelle lettre et la nouvelle pioche*)
	val faireEchange : char -> char -> char -> piocheJeu -> (piocheJeu * piocheJeu)

	(* Role : Permet au joueur lors du premier tour de changer de main
	   Param : la main du joueur et la pioche
	   Retour : la nouvelle main et la nouvelle pioche*)
	val changerMain : char list -> piocheJeu -> (piocheJeu * piocheJeu)
