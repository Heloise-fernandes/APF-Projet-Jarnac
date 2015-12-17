(*================Type Pioche================*)
	type piocheJeu = char list

(*===============Action Pioche===============*)
	val laPiocheDebut : (int*char) list

	val creerPioche : (int*char) list -> piocheJeu
		
	val getElmtRandom : piocheJeu -> int ->(char * piocheJeu)

	val melanger : piocheJeu -> piocheJeu

	val piocher : piocheJeu-> int -> (piocheJeu * piocheJeu)

	val faireEchange : char -> char -> char -> piocheJeu -> (piocheJeu * piocheJeu)

	val changerMain : char list -> piocheJeu -> (piocheJeu * piocheJeu)
