
let digit c = int_of_char c - int_of_char '0'
					  
let chiffre = parser [<''0'..'9' as x >] -> x

let lettre = parser [<''a' ..'z' | 'A'..'Z' as x >] -> x

let rec chargePioche = parser
	    |[< x = lettre ; a = chargePioche>]-> let (q,p) = a in (x::q, p)
	    |[<'' ' ; a = chargePioche>]-> let (q,p) = a in (q, p)							   
	    |[<''!'; s >]->([], s)						   
        |[<>]->([],[<>]);;
  
let rec chargeTour = parser
		|[<''0'..'9' as c  ; a = chargeTour>]-> let (q,p) = a in (digit c, p)
		|[<'' ' ; a = chargeTour>]-> a							   
		|[<''!'; s >]->(0, s)						   
        |[<>]->(0,[<>])

  
let rec chargeNomjoueur = parser
        |[< x = lettre ; a = chargeNomjoueur>]-> let (q,p) = a in ((Char.escaped x)^q, p)
		|[< x = chiffre ; a = chargeNomjoueur>]-> let (q,p) = a in ((Char.escaped x)^q, p)
		|[<'' ' ; a = chargeNomjoueur>]-> let (s,p) = a in (s, p)							   
		|[<''!'; s >]->("", s)						   
        |[<>]->("",[<>])

let rec chargeTabEtLigne = 
	parser
        |[< x = lettre ; a = chargeTabEtLigne >]->  let (num, listTab, s) = a in (num, x::listTab, s)
        |[<  ''-' as x ; a = chargeTabEtLigne >]->  let (num, listTab, s) = a in (num, x::listTab, s)
		|[<'' ' ; a = chargeTabEtLigne>]-> let (num, listTab, s) = a in (num, listTab, s)
		|[< ''0'..'9' as c ; a = chargeTabEtLigne>] -> let (num, listTab, s) = a in (digit c, listTab, s)		   
		|[<''!'; s >]->(0,[], s)						   
        |[<>]->(0,[],[<>])

let rec chargeScorePlusMain = 
      parser
      |[< x = lettre ; a = chargeScorePlusMain >]->  let (num, listTab, s) = a in (num, x::listTab, s)
      |[<'' ' ; a = chargeScorePlusMain>]-> let (num, listTab, s) = a in (num, listTab, s)
      |[<''(' ; a = chargeScorePlusMain>]-> let (num, listTab, s) = a in (num, listTab, s)
      |[<'')' ; a = chargeScorePlusMain>]-> let (num, listTab, s) = a in (num, listTab, s)
      |[< ''0'..'9' as c ; a = chargeScorePlusMain>] -> let (num, listTab, s) = a in (digit c, listTab, s)		   
      |[<''!'; s >]->(0,[], s)						   
      |[<>]->(0,[],[<>])

let rec chargeNumJ = 
      parser
      |[< x = chiffre ; a = chargeNumJ >]-> let (q,p) = a in (digit x,p)
      |[<'' ' ; a = chargeNumJ>]-> a	   
      |[<''!'; s >]->(0, s)						   
      |[<>]->(0,[<>])

let remplirtab l =
  let rec remplir t i j l= match l with
    |[]-> t
    |x::q-> if j = 9 then remplir t (i+1) 0 (x::q) else let _ = t.(i).(j) <- x in  remplir t i (j+1) q
  in remplir (Array.make_matrix 8 9 '-') 0 0 l 
 
let chargerPartie nom =
let fich = open_in (nom^".txt") in
let contenu = input_line fich in
let stream = Stream.of_string contenu in
let (pioche, s1) = chargePioche stream in
let (tour,s2) = chargeTour s1 in
let (nomj1,s3) = chargeNomjoueur s2 in
let (numLigne1,listab1,s4) = chargeTabEtLigne s3 in
let (score1,main1,s5) = chargeScorePlusMain s4 in
let (nomj2,s6) = chargeNomjoueur s5 in
let (numLigne2,listab2,s7) = chargeTabEtLigne s6 in
let (score2,main2,s8) = chargeScorePlusMain s7 in
let (numJ,s9) = chargeNumJ s8 in (pioche,tour,nomj1,numLigne1,remplirtab listab1,score1,main1,nomj2,numLigne2,remplirtab listab2,score2,main2,numJ)

(*let s = Stream.of_string "z q s d ! 0 !  joueur1 ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 0 ! 0 ( a b c ) ! joueur2 ! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 0 ! 0 ( d e f ) !"		 
let (p,s1) = pioche s
let (p,s2) = tour s1	
let (j,s3) = nomjoueur s2
let (n,l,s4) = recupTabEtLigne s3
let (n,l,s5) = scorePlusMain s4
  *)
