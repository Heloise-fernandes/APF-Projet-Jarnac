type piocheJeu = char list
type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable  lettre : char list}
type partie = {mutable pioche : piocheJeu; mutable  tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur}


let ecrirePlateau p fich =
	let _ = print_string "d ecrirePlateau" in
	let g = p.grille in
	let nbligne = Array.length g in
	let nbcolone = Array.length g.(0) in
	let _ = begin
		for i = 0 to nbligne-1 do
			for j=0 to nbcolone-1 do
				Printf.fprintf fich "%c " g.(i).(j)
			done;
		done;
		Printf.fprintf fich "%d " p.numLigne
	end in
	print_string "f ecrirePlateau"

let ecrireJoueur j fich = 
	let _ = print_string "d ecrireJoueur" in
	let _ = Printf.fprintf fich " %s " j.nom in
	let _ = begin Printf.fprintf fich "! "; ecrirePlateau j.plateau fich; Printf.fprintf fich "! " end in
	let _ = Printf.fprintf fich "%d " j.score in
	let rec ecrireLettre l =
		match l with
			|[] -> ()
			|x::r -> begin Printf.fprintf fich "%c " x; ecrireLettre r end in
	let _ = begin Printf.fprintf fich "( " ; ecrireLettre j.lettre; Printf.fprintf fich ") " end in
	let _ = print_string "f ecrirePlateau" in ()
	

let ecrirePartie partie fich =
	let _ = print_string "d ecrire partie" in
	let rec ecrirePioche p = 
		(match p with
			|[] -> Printf.fprintf fich "! "
			|x::r ->  begin Printf.fprintf fich "%c " x; ecrirePioche r end) in
	let _ = ecrirePioche partie.pioche in
	(*ecrire tour*)
	let _ =  Printf.fprintf fich "%d " partie.tour in
	(*ecrire joueurs 1 et 2*)
	let _ = begin Printf.fprintf fich "! "; ecrireJoueur partie.joueur1 fich;Printf.fprintf fich "!"; ecrireJoueur partie.joueur2 fich; Printf.fprintf fich "!" end in
	let _ = print_string "f ecrire partie" in
	()
	
let sauvegarder partie oc=
	begin
		ecrirePartie partie oc;
		close_out oc;
	end

