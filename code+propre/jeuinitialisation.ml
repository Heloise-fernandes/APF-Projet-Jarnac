(*====================Type du jeu====================*)
type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : Lapioche.piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}

let dico = Complements.charge_dico

(*================Action du Dico================*)
let estDansDictionnaire m = let mot = String.uppercase m in Dictionnaire.member mot dico

(*================Initialisation du jeu================*)
let nouveauPlateau () = {grille = Array.make_matrix 8 9 '-';numLigne = 0;fini = false;}

let ajouterUnJoueur n = {nom = n;plateau = nouveauPlateau () ;score=0;lettre = []}

let nouvellePartie () = 
	let (n1,n2) = Interaction.demanderNoms () in 
	{pioche = Lapioche.melanger (Lapioche.creerPioche Lapioche.laPiocheDebut);tour = 0;joueur1 = ajouterUnJoueur n1; joueur2 = ajouterUnJoueur n2;numJoueurTour = 1}

(*=================Action jeu================*)
(*AJoute le mot au tableau*)
let ajoutMotTab j m  i = 
	let rec ajouterMot tab mot i = 
		if i = (String.length mot) then ()
		else let t = tab.(i)<-mot.[i] in ajouterMot tab mot (i+1)
	in let _= j.lettre <- Fonctiondebases.enleverMot j.lettre m 0 in  ajouterMot (j.plateau.grille.(i)) m 0

let passer num = if num = 1 then 2 else 1

let rec former j = 
	let _ = Affichage.printLettreDispo j.lettre in
	let m1 = Interaction.demanderMot3Lettres() in
	let m = String.lowercase m1 in 
	if ((String.length m)>=3)&&((String.length m)<9)&&(estDansDictionnaire m)&&(Fonctiondebases.peutCreerUnMot j.lettre m)then
		let _ = ajoutMotTab j m j.plateau.numLigne in
		let _ = j.plateau.numLigne<-j.plateau.numLigne +1 in true 					
	else let _ =Affichage.printmotInvalide () in false

let rec transformer j i = 
	let _ = Affichage.printGrille j.plateau.grille in
	let ligne = Interaction.demanderligneModif j.plateau.numLigne j.plateau.grille in (*Ligne du tableau de j1 à modif*)
	let _ = Affichage.printLettreDispo j.lettre in
	let m = Interaction.demanderMot4Lettres() in  (*Mot a former*)
	let listAncMot = Fonctiondebases.getLettre j.plateau.grille.(ligne) in
	let liste = j.lettre@listAncMot in 
	(*Si la taille est comprise entre 4 et 9 et que le mot est dans le dico et que le mot contient les lettres de l'ancien mot et que les lettres soient contenue dans la liste alors*)
	if ((String.length m)>=4)&&((String.length m)<9)&&(estDansDictionnaire m)&&(Fonctiondebases.peutCreerUnMot liste m)&&(Fonctiondebases.contientNvMotLettre (Fonctiondebases.list2String listAncMot) m) then
		let _ =  j.lettre <- liste in (m,ligne)						
	else let _ =Affichage.printmotInvalide () in (" ",ligne)
								
let rec demanderChoixAction j = 
let choix = Interaction.demanderChoixAction () in 
if  choix = 1 then let b = (former j) in let _ = (Affichage.printLettreTab j.plateau.grille j.lettre) in demanderChoixAction j
else 
	if choix = 2 then let (m,ligne) = (transformer j 0) in 
		if(m <> " ") then
			let _ = ajoutMotTab j m ligne in 
			let _ = (Affichage.printLettreTab j.plateau.grille j.lettre) in demanderChoixAction j
		else demanderChoixAction j
	else ()


(*==================Jarnac==================*)

(*Cette fonction permet de supprimer le mot volé dans le tableau*)
let rec miseAjourAnarc j i = 
	if ((i+1) = j.plateau.numLigne) then 
		let _ = j.plateau.grille.(i)<-j.plateau.grille.(j.plateau.numLigne) in j.plateau.numLigne <- i 
	else 
		let _ = j.plateau.grille.(i)<-j.plateau.grille.(i+1) in miseAjourAnarc j (i+1)
		
(*Ajoute le mot au tableau du joueur 2 et supprime les lettres de la main du joueur1*)
let ajoutMotJarnac j1 j2 m = 
	let rec ajouterMot tab mot i = 
		if i = (String.length mot) then ()
		else 
			let t = tab.(i)<-mot.[i] in ajouterMot tab mot (i+1)
	in 
	let _= j1.lettre <- Fonctiondebases.enleverMot j1.lettre m 0 in  
	let _ = ajouterMot (j2.plateau.grille.(j2.plateau.numLigne)) m 0 in 
	let _ = j2.plateau.numLigne<-j2.plateau.numLigne +1 in ()

(*Cette fonction definis si le joueur veux ou non jouer un coup de jarnac*)
let rec coupJanac j1 j2 =  
	let _ = (Affichage.printLettreTab j1.plateau.grille j1.lettre) in 
	if Interaction.demanderJarnac () then
		let (m,ligne) = transformer j1 3 in 
		if (m <> " ") then 
			let _ = ajoutMotJarnac j1 j2 m in miseAjourAnarc j1 ligne 
		else let _ = Affichage.printmotInvalide () in coupJanac j1 j2
	else ()																				

(*================Action ===============*)
let jouersansEchange j pioche =
	let (lettreEnplus, nvPioche1) = (Lapioche.piocher pioche 1) in 
	let _ = j.lettre <- lettreEnplus@j.lettre in 
	let _= (Affichage.printLettreTab j.plateau.grille j.lettre) in
	let _ = demanderChoixAction j in nvPioche1

(*-----------Action piocher Echange----------*)

	let rec actionEchangerUnelettre j =
		let l1 = Interaction.demander3LettresEchanger j.lettre in  
		if (String.length l1 = 3)&&(Fonctiondebases.peutCreerUnMot j.lettre (l1)) then
			let (lettreSupp, nvPioche) = Lapioche.faireEchange l1.[0] l1.[1] l1.[2] j.lettre in (lettreSupp@(Fonctiondebases.enleverMot j.lettre l1 0),nvPioche)
		else actionEchangerUnelettre j

	let joueravecEchanger j pioche = 
		let (nvListe, nvPioche1) = actionEchangerUnelettre j in 
		let _ = j.lettre <- nvListe in 
		let _= (Affichage.printLettreTab j.plateau.grille j.lettre) in
		let _ = demanderChoixAction j in nvPioche1

	
(*-------------Action piocher 1--------------*)
	let jouerPiocherTour1 j pioche = 
		let rec creer j droit=  
			let b = former j in
				if b then true
				else 
					if droit then
						let b = Interaction.demandeNvMain () in
						if b then false
						else creer j true
					else creer j false
		in
		let (lettreEnplus, nvPioche1) = (Lapioche.piocher pioche 6) in 
		let _ = j.lettre <- lettreEnplus in 
		let _= (Affichage.printGrille j.plateau.grille) in 
		let b = creer j true in
		if b then nvPioche1
		else 
			let (liste , nvPioche2) = Lapioche.changerMain j.lettre nvPioche1 in
			let _ = j.lettre <- liste in 
			let _= (Affichage.printGrille j.plateau.grille) in 
			let b = creer j false in nvPioche2
(*-----------------schema -------------------*)		
	let schemaExecutionTourN j pioche = 
		let _ = Affichage.printNom j.nom in
		let _= (Affichage.printLettreTab j.plateau.grille j.lettre) in
		let choix = Interaction.demanderChoixActionPioche () in
		if choix = 1 then jouersansEchange j pioche
		else joueravecEchanger j pioche
	
	let schemaExecutionTourUn j pioche = 
		let _ = Affichage.printNom j.nom in
		let nvPioche1 = jouerPiocherTour1 j pioche in jouersansEchange j nvPioche1

(*================Calcul des Scores================*)

let scoreJoueur j = 
	let rec getScore tab i= 
		let rec getScoreLigne i t = if (t.(i) = '-')||(i=Array.length t) then (i)*(i) else getScoreLigne (i+1) t
		in 
		if (i=Array.length tab) then 0 
		else (getScoreLigne 0 tab.(i)) + (getScore tab (i+1))
	in j.score <- getScore (j.plateau.grille) 0
	
let resultat p = 
	if  (p.pioche <> [])&&(p.joueur2.plateau.numLigne <> 8)&&(p.joueur1.plateau.numLigne <> 8) then
		let _ = scoreJoueur p.joueur1 in 
		let _ = scoreJoueur p.joueur2 in
		let s1 = p.joueur1.score in 
		let s2 = p.joueur2.score in Affichage.printScore s1 s2
	else ()
	
(*================== Sauvegarde ==================*)
let rec charger () = 
	let sauv = Interaction.demandeChargement () in
	if sauv = " " then 
		let b = Interaction.demandeVerifChargement () in 
		if b then charger ()
		else nouvellePartie ()
	else  
		if sauv = "n" then nouvellePartie ()
		else (*FOnction chargement partie*) nouvellePartie ()
let sauvegarder () = 
	let sauv = Interaction.demandeSauvegarde () in
	if sauv = " " then false 
	else (*Fonction sauvegarde*)true
		
(*======================Jeu======================*)

let premierTour p = 
	let _ = p.pioche <- schemaExecutionTourUn p.joueur1 p.pioche in
	let _ = coupJanac p.joueur1 p.joueur2 in
	let _ = p.numJoueurTour <- passer p.numJoueurTour in
	let _ = p.pioche <- schemaExecutionTourUn p.joueur2 p.pioche in
	let _ = coupJanac  p.joueur2 p.joueur1  in
	let _ = p.numJoueurTour <- passer p.numJoueurTour in
	let _ = p.tour <- p.tour +1 in
	let b = sauvegarder () in ()

let rec nEmeTour p = 
	if  (p.pioche <> [])&&(p.joueur2.plateau.numLigne <> 8) then
		let _ = p.pioche <- schemaExecutionTourN  p.joueur1 p.pioche in
		let _ = coupJanac  p.joueur1 p.joueur2 in
		let _ = p.numJoueurTour <- passer p.numJoueurTour in
		if  (p.pioche <> [])&&(p.joueur1.plateau.numLigne <> 8) then
			let _ = p.pioche <- schemaExecutionTourN  p.joueur2 p.pioche in
			let _ = coupJanac  p.joueur2 p.joueur1 in
			let _ = p.numJoueurTour <- passer p.numJoueurTour in
			let _ = p.tour <- p.tour +1 in 
			let b = sauvegarder () in
			if b then ()
			else nEmeTour p
		else ()
	else ()
