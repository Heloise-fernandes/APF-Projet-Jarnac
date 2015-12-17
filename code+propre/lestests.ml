(*(*TEST*)
let maPioche1 =  creerPioche laPiocheDebut
let maPioche2 =  melanger maPioche1

let (lettreDispo,maPioche3) = piocher maPioche2 6
let taille = List.length maPioche3

let (nvmain,maPioche4) = faireEchange 'e' 'e' 'c' maPioche3
let taille = List.length maPioche4
*)

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

(*N tour tour*)

(*choix action pioche*)


(*choix action *)

(*								      
let tableautest =[|
			 [|'t';'z';'a';'r';'-';'-';'-';'-';'-'|];
			 [|'a';'b';'c';'d';'e';'f';'g';'h';'i'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			 [|'-';'-';'-';'-';'-';'-';'-';'-';'-'|];
			|];;
getLettre tableautest.(0) 0;;
getLettre tableautest.(1) 0;;
    *)
