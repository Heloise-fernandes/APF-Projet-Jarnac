(*=============== Interactions ===============*)
	val demanderNoms : unit -> (string*string)

	val demanderNom : int -> string

	val demanderChoixAction : unit -> int

	val demanderChoixActionPioche : unit -> int

	val demanderJarnac : unit -> bool 

	val demanderMot3Lettres : unit -> string

	val demanderMot4Lettres : unit -> string

	val demander3LettresEchanger : char list -> string

	val demanderligneModif : int -> char array array -> int
	
	val demandeSauvegarde : unit -> string
	
	val demandeNomSauvegarde : unit -> string
			
	val demandeVerifChargement : unit -> bool

	val demandeChargement : unit -> string

	val demandeNvMain : unit -> bool
