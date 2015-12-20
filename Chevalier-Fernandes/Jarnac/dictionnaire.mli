(*=============== Dictionnaire ===============*)

	(*Type permettant de representer un dictionnaire. Un noeud est un tableau compose d'un tableau a 26 case. Chaque case representant une
	lettre (A=0,B=1....Z=25).*)
	type dico = Noeud of dico array * bool | Feuille
	
	(*Fonction permettant de creer un dictionnaire vide
	  Entree : unit
	  Sortie : Dictionnaire compose d'un neoud, chaque case du noeud etant compose d'une feuille*)
	val dico_vide : unit -> dico
	
	(*Fonction permettant de savoir si un mot (chaine de caractere) est presente dans un dictionnaire
	  Entrees : une chaine de caractere representant le mot a tester
				le dictionnaire ou l'on doit chercher le mot
	  Sortie : Un boolen, true si le mot passe en parametre est dans le dico, faux sinon*)
	val member : string -> dico -> bool
	
	(*Fonction permettant d'ajouter un mot dans un dictionnaire
	  Entrees : une chaine representant le mot
				le dictionnaire dans lequel ajouter le mot
	  Sortie : le dictionnaire donne en parametre, connaissant le mot donne en parametre*)
	val add : string -> dico -> dico
	
	(*Fonction permettant de supprimer un mot dans un dictionnaire
	  Entrees : une chaine representant le mot
				le dictionnaire dans lequel supprimer le mot
	  Sortie : le dictionnaire donne en parametre, ne connaissant plus le mot donne en parametre*)
	val remove : string -> dico -> dico
	
	(*Fonction non traitee*)
	(*val of_stream : char stream -> dico*)
	
	(*Fonction permettant de creer une liste composee de tous les mot connu par un dictionnaire
	  Entree : un dictionnaire dont on veut la liste des mots connus
	  Sortie : la liste des mot connus par le dictionnaire*)
	val to_list : dico -> string list
