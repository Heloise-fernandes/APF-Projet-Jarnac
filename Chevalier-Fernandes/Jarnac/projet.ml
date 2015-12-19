
(*INITIALISATION*)

let partieJanac = Jeu.charger ()

(*PREMIER TOUR*)
let b1 = if partieJanac.tour = 0 then Jeu.premierTour partieJanac else false

(*N TOUR*)
let b2 = if b1 = false then Jeu.nEmeTour partieJanac else true

(*Resultat*)
let _ = if b2 = false then Jeu.resultat partieJanac  else ()
