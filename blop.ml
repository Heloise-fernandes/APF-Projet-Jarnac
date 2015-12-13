let laPiocheDebut = [(14,"a");(4,"b");(7,"c");(5,"d");(19,"e");(2,"f");(4,"g");(2,"h");(11,"i");(1,"j");(1,"k");(6,"l");(5,"m");(9,"n");(8,"o");(4,"p");(1,"q");(10,"r");(7,"s");(9,"t");
(8,"u");(2,"v");(1,"w");(1,"x");(1,"y");(2,"z")]


		      
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

let rec melanger p =
	match p with 
	|[]-> []
	|_ ->let b = Random.self_init in  let (x,q) =  getElmtRandom p (Random.int (List.length p) ) in x::(melanger q)

let rec piocher p i = match p with
	|[]->([],[])
	|x::q -> if i=0 then ([],x::q) else let (listej, restep) = piocher q (i-1) in (x::listej,restep)

let faireEchange a b c p= piocher (melanger (a::b::c::p)) 3


let maPioche1 =  creerPioche laPiocheDebut
let maPioche2 =  melanger maPioche1

let (lettreDispo,maPioche3) = piocher maPioche2 6
let taille = List.length maPioche3

let (nvmain,maPioche4) = faireEchange "e" "e" "c" maPioche3
let taille = List.length maPioche4
