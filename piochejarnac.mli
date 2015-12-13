type piocheJeu = string list

val laPiocheDebut : (int*string) list

val creerPioche : (int*string) list -> piocheJeu
	
val getElmtRandom : piocheJeu -> int ->(string * piocheJeu)

val melanger : piocheJeu -> piocheJeu

val piocher : piocheJeu-> int -> (piocheJeu * piocheJeu)

val faireEchange : string -> string -> string -> piocheJeu -> (piocheJeu * piocheJeu)
