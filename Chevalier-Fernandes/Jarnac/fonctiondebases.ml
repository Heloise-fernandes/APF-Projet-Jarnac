(*=============== Fonction de bases ===============*)
	let rec peutCreerUnMot liste mot =
		let rec parcourmot m l i = 
			let rec estdansListe lettre l = match l with
				|[]->([],false)
				|x::q-> if x = lettre then (q,true) else let (r,b) = estdansListe lettre q in (x::r,b)
			in
			if i = (String.length m) then true
			else let (q,b) = (estdansListe m.[i] l) in b && parcourmot m q (i+1)
		in parcourmot mot liste 0

	let string2List m = 
		let rec aux m i =
			if i = String.length m then []
			else m.[i]::(aux m (i+1))
		in aux m 0

	let list2String l = 
		let rec aux l1 = 
			match l1 with
			|[]-> ""
			|x::q -> (Char.escaped x) ^ (aux q)
		in aux l

	let getLettre tab = 
		let rec aux t i=
			if (i = Array.length t)||(t.(i) = '-') then []
			else t.(i)::(aux t (i+1))
		in aux tab 0

	let contientNvMotLettre ancMot nvMot = peutCreerUnMot (string2List nvMot) ancMot

	(*Mise à jour des lettres dispo*)
	let rec enleverLettre l lettre =
		match l with
		|[]->[]
		|x::q-> if x==lettre then q else let r = enleverLettre q lettre in x::r

	let rec enleverMot liste mot i = 
		if i = (String.length mot) then liste
		else let l = enleverLettre liste mot.[i] in enleverMot l mot (i+1)
