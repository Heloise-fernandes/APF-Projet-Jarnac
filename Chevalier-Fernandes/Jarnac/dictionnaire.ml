
(*Type permettant de representer un dictionnaire. Un noeud est un tableau compose d'un tableau a 26 case. Chaque case representant une
	lettre (A=0,B=1....Z=25).*)
type dico = Noeud of dico array * bool | Feuille

(*Fonction permettant de creer un dictionnaire vide
  Entree : unit
  Sortie : Dictionnaire compose d'un neoud, chaque case du noeud etant compose d'une feuille*)
let dico_vide () = Noeud((Array.make 26 Feuille),false)

(*Fonction permettant de savoir l'indice d'une lettre dans l'alphabet (0 à 25)
  Entree : un caractere
  Sortie : l'indice du caractere dans l'alphabet*)
let vallettre c = int_of_char c - int_of_char 'A'

(*Fonction permettant de savoir si un mot (chaine de caractere) est presente dans un dictionnaire
  Entrees : une chaine de caractere representant le mot a tester
			le dictionnaire ou l'on doit chercher le mot
  Sortie : Un boolen, true si le mot passe en parametre est dans le dico, faux sinon*)
let member mot dictionnaire = 
	let lgmot = String.length mot in
	let rec aux caractere indice dic = if indice = lgmot-1 then (match dic with
																|Noeud(tab,b) -> (match tab.(vallettre caractere) with
																				| Noeud(tab1, b1) -> b1
																				| Feuille -> false )
																|Feuille-> false
																)
									   else (match dic with
											  |Noeud(tab,b) -> aux (String.get mot (indice+1)) (indice+1) (tab.(vallettre (String.get mot (indice))))
											  |Feuille -> false
											) in
	let premierelettre = String.get mot 0 in
	aux premierelettre 0 dictionnaire


(*Fonction permettant d'ajouter un mot dans un dictionnaire
  Entrees : une chaine representant le mot
			le dictionnaire dans lequel ajouter le mot
  Sortie : le dictionnaire donne en parametre, connaissant le mot donne en parametre*)
let add mot dic = 
	(*On definit la longueur du mot a ajouter*)
	let lgmot = String.length mot in
	(*Fonction permettant d'ajouter la derniere lettre du mot dans le dico afin qu'il soit reconnu*)
	let aux2 dico =( match dico with
					  |Noeud(tab,b) -> Noeud(tab, true)
					  |Feuille ->let nvlettre = dico_vide () in
								(match nvlettre with
								|Noeud(tab,b) ->Noeud(tab, true))) in
	(*Fonction permettant d'ajouter recursivement chaque lettre du mot au dictionnaire*)
	let rec aux caractere indice dic = 
		if indice = lgmot-1 then (match dic with
									|Noeud(tab,b)->begin (tab.(vallettre caractere) <- aux2 (tab.(vallettre caractere))) ;Noeud(tab,b) end
									|Feuille -> let nvlettre = dico_vide () in
												(match nvlettre with
												|Noeud(tab,b) -> begin (tab.(vallettre caractere) <- aux2 (tab.(vallettre caractere))) ; Noeud(tab, b) end)
								)
		else (match dic with
				|Noeud(tab,b) -> begin (tab.(vallettre caractere) <- aux (String.get mot (indice+1)) (indice+1) (tab.(vallettre (caractere)))) ;Noeud(tab,b) end
				|Feuille -> let nvlettre = dico_vide () in
							(match nvlettre with
							|Noeud(tab,b) -> begin (tab.(vallettre caractere) <- aux (String.get mot (indice+1)) (indice+1) (tab.(vallettre (caractere))));Noeud(tab, b) end)
             ) in
	let premierelettre = String.get mot 0 in
	aux premierelettre 0 dic


(*Fonction permettant de supprimer un mot dans un dictionnaire
  Entrees : une chaine representant le mot
			le dictionnaire dans lequel supprimer le mot
  Sortie : le dictionnaire donne en parametre, ne connaissant plus le mot donne en parametre*)
let remove mot dico =
  let lgmot = String.length mot in
  let dicovide = dico_vide () in
  (*Permet de reduire les expressions : un dico vide = une feuille, c'est pas la peine de garder un noeud vide*)
  let aux3 dico = if dico = dicovide then Feuille else dico  in	
  (*permet d'aller un cran plus loin'*)
  let aux2 dico =( match dico with
	  |Noeud(tab,b) -> aux3 (Noeud(tab, false))
	  |Feuille -> Feuille (*Le mot n'existe pas*)) in
  let rec aux caractere indice dic = 
		if indice = lgmot-1 then (match dic with
									|Noeud(tab,b)->begin (tab.(vallettre caractere) <- aux2 (tab.(vallettre caractere))) ; aux3 (Noeud(tab,b)) end
									|Feuille -> Feuille (*Le mot n'existe pas*) )

		else (match dic with
				|Noeud(tab,b) -> begin (tab.(vallettre caractere) <- aux (String.get mot (indice+1)) (indice+1) (tab.(vallettre (caractere)))) ; aux3 (Noeud(tab,b)) end
				|Feuille -> Feuille (*le mot n'existe pas*)
             ) in
  let premierelettre = String.get mot 0 in
  (*Si le dictionnaire est le dico vide, il sera compose seulement d'une feuille. On teste donc si c'est une feuille et on renvoit 
    un dictionnaire vide comme declare dans la fonction dico_vide () le cas echeant *)
  let dicoarendre = aux premierelettre 0 dico in
  if dicoarendre = Feuille then dico_vide () else dicoarendre


(*Fonction non traite*)
(* val of_stream : char stream -> dico *)

(*Fonction renvoyant un caractere a partir de son indice dans l'alphabet(0..25)
  Entree : un entier
  Sortie : un caractere *)
let val_to_lettre i = char_of_int (int_of_char 'A' + i)


(*Fonction permettant de creer une liste composee de tous les mot connu par un dictionnaire
	  Entree : un dictionnaire dont on veut la liste des mots connus
	  Sortie : la liste des mot connus par le dictionnaire*)
let to_list dic = 
  let rec aux noeud indice debMot liste =
      if indice = 26 then liste
      else match noeud.(indice) with
      |Feuille -> aux noeud (indice+1) debMot liste
      |Noeud(tab,b) -> let nvmot = debMot ^ (Char.escaped (val_to_lettre indice)) in
	if b then let l1 = aux tab 0 nvmot (liste@[nvmot]) in
       		  let l2 = aux noeud (indice+1) debMot liste in
		  l1@l2
	else let l1 = aux tab 0 nvmot liste in
	     let l2 = aux noeud (indice+1) debMot liste in
	     l1@l2
  in match dic with
  |Noeud(tab,b) -> aux tab 0 "" []
  |Feuille -> []


