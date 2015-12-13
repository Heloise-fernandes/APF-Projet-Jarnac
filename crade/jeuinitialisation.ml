
(*Fonction de présence dans le dico*)
let estDansDictionnaire m = true

(*================Pioche================*)
type piocheJeu = char list

let laPiocheDebut = [(14,'a');(4,'b');(7,'c');(5,'d');(19,'e');(2,'f');(4,'g');(2,'h');(11,'i');(1,'j');(1,'k');(6,'l');(5,'m');(9,'n');(8,'o');(4,'p');(1,'q');(10,'r');(7,'s');(9,'t');
(8,'u');(2,'v');(1,'w');(1,'x');(1,'y');(2,'z')]
      
let rec creerPioche l = 
	let rec sousListe a x = if x = 0 then [] else a::(sousListe a (x-1))in
	match l with
	|[]->[]
	|x::q -> let (num , lettre) = x in (sousListe lettre num)@(creerPioche q)
	
let getElmtRandom p i =
	let rec enleverElmt l1 e = match l1 with
	|[]-> failwith "Cet element n'existe pas"
	|x::q -> if x = e then q else x::(enleverElmt q e)
	in let elmt = List.nth p i in (elmt , enleverElmt p elmt)  

let rec melanger p = let _ = Random.self_init () in
	match p with 
	|[]-> []
	|_ -> let (x,q) =  getElmtRandom p (Random.int (List.length p) ) in x::(melanger q)

let rec piocher p i = match p with
	|[]->([],[])
	|x::q -> if i=0 then ([],x::q) else let (listej, restep) = piocher q (i-1) in (x::listej,restep)

let faireEchange a b c p= piocher (melanger (a::b::c::p)) 3

(*================Initialisation du jeu================*)
type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}

let nouveauPlateau () = {grille = Array.make_matrix 8 9 '-';numLigne = 0;fini = false;}

let ajouterUnJoueur n = {nom = n;plateau = nouveauPlateau () ;score=0;lettre = []}

let nouvellePartie () = 
begin
	print_string "Entrer le nom du premier joueur"; print_newline ();
	let n1 = read_line () in print_string "Entrer le nom du deuxième joueur"; print_newline ();
	let n2 = read_line () in 
	{
	pioche = melanger (creerPioche laPiocheDebut);
	tour = 0; 
	joueur1 = ajouterUnJoueur n1; joueur2 = ajouterUnJoueur n2;numJoueurTour = 1}
end

(*================Affichage===============*)
let afficherGrille t = 
begin
print_string "  |  |  | 9|16|25|36|49|64|81|";
print_newline ();
for i = 0 to ((Array.length t)-1) do
	print_string (string_of_int i);
	print_string " |";
	for j = 0 to ((Array.length t.(i))-1) do
		if (t.(i).(j) = '-') then
		print_string " " 
		else print_string (Char.escaped t.(i).(j));
		print_string " |";
	done;
	print_newline ();
done;
print_newline ();
end



let printLettreDispo liste = 
	let rec aux l = match l with
	|[]-> ()
	|x::q-> let _ = print_string ((Char.escaped x)^"|") in aux q
	in let _ = print_string "Vos lettres : |" in let _ = aux liste in print_newline ()

let printLettreTab j = let _= afficherGrille j.plateau.grille in let _ = printLettreDispo j.lettre in ()


(*================Jeu===============*)

 
let rec peutCreerUnMot liste mot =
	let rec parcourmot m l i = 
		let rec estdansListe lettre l = match l with
		|[]->([],false)
		|x::q-> if x = lettre then (q,true) else let (r,b) = estdansListe lettre q in (x::r,b)
		in
		if i = (String.length m) then true
		else let (q,b) = (estdansListe m.[i] l) in b && parcourmot m q (i+1)
	in
	parcourmot mot liste 0

(*Mise à jour des lettres dispo*)
let rec enleverLettre l lettre =
	match l with
	|[]->[]
	|x::q-> if x==lettre then q else let r = enleverLettre q lettre in x::r

let rec enleverMot liste mot i = 
	if i = (String.length mot) then liste
	else let l = enleverLettre liste mot.[i] in enleverMot l mot (i+1)

(*Ajouter transformer*)
(*le mot existe et n'est pas trop long*)
let ajoutMotTab j m  i = 
	let rec ajouterMot tab mot i = 
		if i = (String.length mot) then ()
		else let t = tab.(i)<-mot.[i] in ajouterMot tab mot (i+1)
	in let _= j.lettre <- enleverMot j.lettre m 0 in  ajouterMot (j.plateau.grille.(i)) m 0

let transformer j ligne m = 
	let rec getLettre t i = 
		if (i = Array.length t)||(t.(i) = '-') then []
		else t.(i)::(getLettre t (i+1))
	in let liste = j.lettre@(getLettre j.plateau.grille.(ligne) 0) 
	   in if (peutCreerUnMot liste m) then let _ =  j.lettre <- liste in let _ = ajoutMotTab j m ligne in true
		  else let _ = print_string "vous ne pouvez pas creer ce mot" in let _ = print_newline () in false

let former j m = 
	if peutCreerUnMot j.lettre m then let _ = ajoutMotTab j m j.plateau.numLigne in let _ = j.plateau.numLigne<-j.plateau.numLigne +1  in true
    else let _ = print_string "vous ne pouvez pas creer ce mot" in let _ = print_newline () in false

let passer num = if num = 1 then 2 else 1

(*Interrogation joueur*)						
let rec printChoixAction () = 
let _ = print_string "Ecrivez le numéro de l'action que vous souhaitez réaliser :" in
let _ = print_newline () in
let _ = print_string "1 - Former" in
let _ = print_newline () in
let _ = print_string "2 - Transformer" in
let _ = print_newline () in
let _ = print_string "3 - Passer" in
let _ = print_newline () in
let m = read_line () in let num = int_of_string m in 
	if (num=1)||(num=2)||(num=3) then num 
	else printChoixAction ()


let rec printChoixActionPioche () = 
let _ = print_string "Ecrivez le numéro de l'action que vous souhaitez réaliser :" in
let _ = print_newline () in
let _ = print_string "1 - Trirer" in
let _ = print_newline () in
let _ = print_string "2 - Echanger" in
let _ = print_newline () in
let m = read_line () in let num = int_of_string m in if (num=1)||(num=2) then num else printChoixActionPioche ()


let rec demanderligneModif num t = 
let _ = afficherGrille t in
let _ = print_string "Quel mot souhaitez vous transformer?(choisissez la ligne)" in let _ = print_newline () in
let m = read_line () in let choix = int_of_string m in if(choix >= 0)&&(choix < num) then choix else demanderligneModif num t

let rec demanderUnMotAFormer j = 
let _ = print_string "Vous devez créer un mot de 3 lettres ou plus" in let _ = print_newline () in
let m1 = read_line () in let m = String.lowercase m1 in if ((String.length m)>=3)&&((String.length m)<9)&&(estDansDictionnaire m)then
							let b = (former j m) in 
							if b then ()
							else ()
						else ()

let rec demanderUnMotATransformer j = 
let ligne = demanderligneModif j.plateau.numLigne j.plateau.grille in
let _ = print_string "Vous devez créer un mot de 3 lettres ou plus" in let _ = print_newline () in
let m1 = read_line () in let m = String.lowercase m1 in if ((String.length m)>=3)&&((String.length m)<9)&&(estDansDictionnaire m) then
							let b = (transformer j ligne m) in
							if b then ()
							else ()
						else ()
												
let rec demanderChoixAction j = 
let choix = printChoixAction () in 
if  choix = 1 then let _ = (demanderUnMotAFormer j) in let _ = printLettreTab j in demanderChoixAction j
else 
	if choix = 2 then let _ = (demanderUnMotATransformer j) in let _ = printLettreTab j in demanderChoixAction j
	else ()


let rec actionEchangerUnelettre j =
	let _ = printLettreDispo j.lettre in
	let _ = print_string "Choisissez une lettre a échanger : " in let _ = print_newline () in let l = read_line () in let l1 = String.lowercase l in  
	let _ = print_string "Choisissez une deuxième lettre a échanger : " in let _ = print_newline () in let l = read_line ()  in let l2 = String.lowercase l  in 
	let _ = print_string "Choisissez une troisième lettre a échanger : " in let _ = print_newline () in let l = read_line () in let l3 = String.lowercase l  in
	if (String.length l1 = 1)&&(String.length l2 = 1)&&(String.length l3 = 1)&&(peutCreerUnMot j.lettre (l1^l2^l3)) then
		let (lettreSupp, nvPioche) = faireEchange l1.[0] l2.[0] l3.[0] j.lettre in (lettreSupp@(enleverMot j.lettre (l1^l2^l3) 0),nvPioche)
	else actionEchangerUnelettre j

let tourUn j pioche = 
let _ = print_string j.nom in
let _ = print_newline () in
let (lettreEnplus, nvPioche1) = (piocher pioche 6) in 
let _ = j.lettre <- lettreEnplus@j.lettre in 
let _= printLettreTab j in
let _ = demanderUnMotAFormer j in
let (lettreEnplus, nvPioche2) = (piocher nvPioche1 1) in 
let _ = j.lettre <- lettreEnplus@j.lettre in
let _= printLettreTab j in
let _ = demanderChoixAction j in nvPioche2

let jouersansEchange j pioche =
	let (lettreEnplus, nvPioche1) = (piocher pioche 1) in 
	let _ = j.lettre <- lettreEnplus@j.lettre in 
	let _= printLettreTab j in
	let _ = demanderChoixAction j in nvPioche1

let joueravecEchanger j pioche = 
	let (nvListe, nvPioche1) = actionEchangerUnelettre j in 
	let _ = j.lettre <- nvListe in 
	let _= printLettreTab j in
	let _ = demanderChoixAction j in nvPioche1

let tourN j pioche = 
let _ = print_string j.nom in
let _ = print_newline () in 
let _ = printLettreDispo j.lettre in
let choix = printChoixActionPioche () in
if choix = 1 then jouersansEchange j pioche
else joueravecEchanger j pioche

let rec miseAjourAnarc j i = if ((i+1) = j.plateau.numLigne) then let _ = j.plateau.grille.(i)<-j.plateau.grille.(j.plateau.numLigne) in j.plateau.numLigne <- i 
							else let _ = j.plateau.grille.(i)<-j.plateau.grille.(i+1) in miseAjourAnarc j (i+1)

let ajoutMotJarnac j1 j2 m = 
	let rec ajouterMot tab mot i = 
		if i = (String.length mot) then ()
		else let t = tab.(i)<-mot.[i] in ajouterMot tab mot (i+1)
	in let _= j1.lettre <- enleverMot j1.lettre m 0 in  let _ = ajouterMot (j2.plateau.grille.(j2.plateau.numLigne)) m 0 in let _ = j2.plateau.numLigne<-j2.plateau.numLigne +1 in ()

let jarnac j1 j2 ligne mot =  
	let rec getLettre t i = 
		if (i = Array.length t)||(t.(i) = '-') then []
		else t.(i)::(getLettre t (i+1))
	in let liste = j1.lettre@(getLettre j1.plateau.grille.(ligne) 0) 
	   in if (peutCreerUnMot liste mot) then let _ =  j1.lettre <- liste in let _ = ajoutMotJarnac j1 j2 mot in let _ = miseAjourAnarc j1 ligne in true
		  else let _ = print_string "vous ne pouvez pas creer ce mot" in let _ = print_newline () in false

let rec demanderUnMotAJarnac j1 j2 = 
let ligne = demanderligneModif j1.plateau.numLigne j1.plateau.grille in
let _ = print_string "Vous devez créer un mot de 3 lettres ou plus" in let _ = print_newline () in
let m = read_line () in if ((String.length m)>=3)&&((String.length m)<9)&&(estDansDictionnaire m) then
							let b = jarnac j1 j2 ligne m in
							if b then true
							else false
						else let _ = print_string "mot invalide" in let _ = print_newline () in false
						
let rec demanderJarnac () = let _ = print_string "Voulez vous jouer un coup de jarnac?(o/n)" in let _ = print_newline in let m = read_line () in if (m="o")||(m="n") then m else  demanderJarnac ()

let rec coupJanac j1 j2 = let reponse = demanderJarnac () in 
if (reponse="o") then let _ = printLettreTab j1 in let b = demanderUnMotAJarnac j1 j2 in if b then () else coupJanac j1 j2
else ()


let rec getScore tab i= 
	let rec getScoreLigne i t = if (t.(i) = '-')||(i=Array.length t) then (i)*(i) else getScoreLigne (i+1) t
	in 
	if (i=Array.length tab) then 0 
	else (getScoreLigne 0 tab.(i)) + (getScore tab (i+1))
	
let scoreJoueur j = j.score <- getScore (j.plateau.grille) 0
	
let resultat p = 
	let _ = scoreJoueur p.joueur1 in 
	let _ = scoreJoueur p.joueur2 in
	let s1 = p.joueur1.score in 
	let s2 = p.joueur2.score in
		if  s1 = s2 then let _ = print_string "Egalié" in let _ = print_newline in ()
		else 
			if s1 > s2 then 
				let _ = print_string ("Le joueur 1 à gagné avec "^string_of_int(s1)^"points contre "^string_of_int(s2)^"points pour le joueur 2") in 
				let _ = print_newline in ()
			else 
				let _ = print_string ("Le joueur 2 à gagné avec "^string_of_int(s2)^"points contre "^string_of_int(s1)^"points pour le joueur 1") in 
				let _ = print_newline in ()

let premierTour p = 
let _ = p.pioche <- tourUn p.joueur1 p.pioche in
let _ = coupJanac p.joueur1 p.joueur2 in
let _ = p.numJoueurTour <- passer p.numJoueurTour in
let _ = p.tour <- p.tour + 1 in
let _ = p.pioche <- tourUn p.joueur2 p.pioche in
let _ = coupJanac  p.joueur2 p.joueur1  in
let _ = p.numJoueurTour <- passer p.numJoueurTour in
let _ = p.tour <- p.tour +1 in ()

let rec nEmeTour p = 
	if  (p.pioche <> [])&&(p.joueur1.plateau.numLigne <> 8)&&(p.joueur2.plateau.numLigne <> 8) then
		let _ = p.pioche <- tourN  p.joueur1 p.pioche in
		let _ = coupJanac  p.joueur1 p.joueur2 in
		let _ = p.numJoueurTour <- passer p.numJoueurTour in
		let _ = p.tour <- p.tour +1 in
		let _ = p.pioche <- tourN  p.joueur2 p.pioche in
		let _ = coupJanac  p.joueur2 p.joueur1 in
		let _ = p.numJoueurTour <- passer p.numJoueurTour in
		let _ = p.tour <- p.tour +1 in nEmeTour p
	else ()

