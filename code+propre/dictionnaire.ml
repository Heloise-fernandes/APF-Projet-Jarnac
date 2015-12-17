type dico = Noeud of dico array * bool | Feuille

let dico_vide () = Noeud((Array.make 26 Feuille),false)

let vallettre c = int_of_char c - int_of_char 'A'

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


let add mot dic = 
	let lgmot = String.length mot in
	let aux2 dico =( match dico with
					  |Noeud(tab,b) -> Noeud(tab, true)
					  |Feuille ->let nvlettre = dico_vide () in
								(match nvlettre with
								|Noeud(tab,b) ->Noeud(tab, true))) in
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
  (*Demander a Binome si on veut le plus petit dico possible (Une feuille) ou un dico_vide () quand on supprime *)
  let dicoarendre = aux premierelettre 0 dico in
  if dicoarendre = Feuille then dico_vide () else dicoarendre



(* val of_stream : char stream -> dico *)


let val_to_lettre i = char_of_int (int_of_char 'A' + i)

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


