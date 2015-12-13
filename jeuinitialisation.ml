type plateaujoueur = {grille : string array array; numLigne : int; fini : bool;}
type joueur = {nom : string; plateau : plateaujoueur; score : int; lettre : string list;}
type partie = {pioche : Piochejarnac.piocheJeu; tour : int; joueur1 : joueur; joueur2 : joueur;}


let nouveauPlateau = {grille = Array.make_matrix 8 9 "-";numLigne = 0;fini = false;}

let ajouterUnJoueur n = {nom = n;plateau = nouveauPlateau;score=0;lettre = []}

(*v2*)
(*let ajouterUnJoueur = {nom = read_Line ();plateau = nouveauPlateau;score=0;lettre = []}*)

(*V2*)
(*let nouvellePartie = 
begin
	print_string "Entrer le nom du premier joueur";
	let j1 = ajouterUnJoueur in print_string "Entrer le nom du deuxième joueur";
	let j2 = ajouterUnJoueur in 
	{pioche = nouvellePioche; 
	tour = 0; 
	joueur1 = j1; joueur2 = j2}
end*)

let nouvellePartie = 
begin
	print_string "Entrer le nom du premier joueur"; print_newline ();
	let n1 = read_line () in print_string "Entrer le nom du deuxième joueur"; print_newline ();
	let n2 = read_line () in 
	{
	pioche = Piochejarnac.melanger ["b";"l";"o";"p"];
	tour = 0; 
	joueur1 = ajouterUnJoueur n1; joueur2 = ajouterUnJoueur n2;}
end

(*Piochejarnac.melanger (Piochejarnac.creerPioche (Piochejarnac.laPiocheDebut))*)
