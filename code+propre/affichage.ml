(*================Affichage===============*)
	let printGrille t = 
		begin
			print_string "  |  |  | 9|16|25|36|49|64|81|";
			print_newline ();
			for i = 0 to ((Array.length t)-1) do
				print_string (string_of_int i);
				print_string " |";
				for j = 0 to ((Array.length t.(i))-1) do
					if (t.(i).(j) = '-') then print_string " " 
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
		in let _ = print_string "Vos lettres : |" in 
		let _ = aux liste in print_newline ()

	let printLettreTab t l = 
		let _= printGrille t in 
		let _ = printLettreDispo l in ()

	let printScore s1 s2 = 
		if  s1 = s2 then 
			let _ = print_string "Egalié" in 
			let _ = print_newline in ()
		else 
			if s1 > s2 then 
				let _ = print_string ("Le joueur 1 à gagné avec "^string_of_int(s1)^"points contre "^string_of_int(s2)^"points pour le joueur 2") in 
				let _ = print_newline in ()
			else 
				let _ = print_string ("Le joueur 2 à gagné avec "^string_of_int(s2)^"points contre "^string_of_int(s1)^"points pour le joueur 1") in 
				let _ = print_newline in ()

	let printmotInvalide () = print_string "vous ne pouvez pas creer ce mot";print_newline ()

	let printNom joueur = print_string ("C'est à "^joueur^" de jouer");print_newline ()

	let printPasSauvegarde () = print_string ("Il n'y a pas de sauvegarde avec ce nom dans le dossier");print_newline ()
	
	let printStop () = print_string ("");print_newline ()
