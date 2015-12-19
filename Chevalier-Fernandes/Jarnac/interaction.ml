(*=============== Interactions ===============*)	
	let demanderNom i = 
		print_string ("Entrer le nom du " ^ (string_of_int i) ^ " joueur");print_newline ();
		let n = read_line () in n

	let demanderNoms () = 
		let n = demanderNom 1 in 
		let m = demanderNom 2 in (n,m)

	let rec demanderChoixAction () = 
		let _ = print_string "Ecrivez le numéro de l'action que vous souhaitez réaliser :" in
		let _ = print_newline () in
		let _ = print_string "1 - Former" in
		let _ = print_newline () in
		let _ = print_string "2 - Transformer" in
		let _ = print_newline () in
		let _ = print_string "3 - Passer" in
		let _ = print_newline () in
		let num = read_line () in 
			if (num="1")||(num="2")||(num="3") then int_of_string num 
			else demanderChoixAction ()


	let rec demanderChoixActionPioche () = 
		let _ = print_string "Ecrivez le numéro de l'action que vous souhaitez réaliser :" in
		let _ = print_newline () in
		let _ = print_string "1 - Tirer" in
		let _ = print_newline () in
		let _ = print_string "2 - Echanger" in
		let _ = print_newline () in
		let num = read_line () in 
			if (num="1")||(num="2") then int_of_string num 
			else demanderChoixActionPioche ()

	let rec demanderJarnac () = 
		let _ = print_string "Voulez vous jouer un coup de jarnac?(o/n)" in 
		let _ = print_newline in 
		let m = read_line () in 
		if (m="o")||(m="n") then 
			if (m="o") then true
			else false 
		else  demanderJarnac ()

	let demanderMot3Lettres () = 
		print_string "Vous devez créer un mot de 3 lettres ou plus";print_newline ();
		let m = read_line () in 
		let m1 = String.lowercase m in m1

	let demanderMot4Lettres () = 
		print_string "Vous devez créer un mot de 4 lettres ou plus";print_newline ();
		let m = read_line () in 
		let m1 = String.lowercase m in m1

	let demander3LettresEchanger liste = 
		let _ = print_string "Choisissez 3 lettre a échanger : " in 
		let _ = print_newline () in let l = read_line () in 
		let l1 = String.lowercase l in l1

	let rec demanderligneModif num t = 
		let _ = print_string "Quel mot souhaitez vous transformer?(choisissez la ligne)" in 
		let _ = print_newline () in
		let m = read_line () in 
		let choix = int_of_string m in 
		if(choix >= 0)&&(choix < num) then choix 
		else demanderligneModif num t
		
	let demandeNomSauvegarde () = 
		let _ = print_string "Quel est le nom de votre sauvegarde?" in 
			let _ = print_newline () in read_line ()
	
	let rec demandeSauvegarde () =
		let _ = print_string "Voulez vous sauvegarder la partie une partie?(o/n)" in 
			let _ = print_newline () in 
			let m = read_line () in 
			if (m="o")||(m="n") then 
				if (m="o") then demandeNomSauvegarde ()
				else " " 
			else  demandeSauvegarde ()
					
	let rec demandeVerifChargement () = 
		let _ = print_string "Voulez vous vraiment charger une partie?(o/n)" in 
			let _ = print_newline () in 
			let m = read_line () in 
			if (m="o")||(m="n") then 
				if (m="o") then true
				else false
			else  demandeVerifChargement ()
	
	let rec demandeChargement () = 
		let _ = print_string "Voulez vous charger une partie?(o/n)" in 
			let _ = print_newline () in 
			let m = read_line () in 
			if (m="o")||(m="n") then 
				if (m="o") then demandeNomSauvegarde ()
				else "n"
			else demandeChargement ()
			
	let rec demandeNvMain () = 
		let _ = print_string "Voulez vous changer de main?(o/n)" in 
			let _ = print_newline () in 
			let m = read_line () in 
			if (m="o")||(m="n") then 
				if (m="o") then true
				else false
			else demandeNvMain ()
