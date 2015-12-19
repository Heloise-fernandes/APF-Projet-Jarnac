(*=============== Fonction de bases ===============*)
	(* Role : Savoir si un joueur peut creer un mot à partir de sa main
	   Param : une main et un mot
	   Retour : la réponse sous forme de booleen *)
	val peutCreerUnMot : char list -> string -> bool
	
	(* Role : Change un mot en liste
	   Param : un mot
	   Retour : une liste *)
	val string2List : string -> char list
	
	(* Role : change une liste en mot
	   Param : une liste
	   Retour : un mot *)	
	val list2String : char list -> string
	
	(* Role : change un tableau de caractère en liste de caractère
	   Param : un tableau
	   Retour : une liste *)
	val getLettre : char array -> char list
	
	(* Role : Savoir si un le nouveau mot formé sontien les lettres de l'ancien
	   Param : l'ancien et le nouveau mot
	   Retour : la réponse sous forme de booleen *)
	val contientNvMotLettre : string -> string -> bool
	
	(* Role : Retire de la liste une lettre
	   Param : une liste et un caractère
	   Retour : une liste privée du caractère *)
	val enleverLettre : char list -> char -> char list
	
	(* Role : Enlève les lettre d'un mot d'une liste
	   Param : une liste et un mot
	   Retour : une liste privée du mot *)
	val enleverMot : char list -> string -> int -> char list
