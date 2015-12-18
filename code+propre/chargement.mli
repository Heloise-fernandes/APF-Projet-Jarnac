
val digit : char -> int 
val chiffre : char Stream.t -> char
val lettre : char Stream.t -> char
val chargePioche : char Stream.t -> char list * char Stream.t
val chargeTour : char Stream.t -> int * char Stream.t
val chargeNomjoueur : char Stream.t -> string * char Stream.t
val chargeTabEtLigne : char Stream.t -> int * char list * char Stream.t
val chargeScorePlusMain : char Stream.t -> int * char list * char Stream.t
val chargeNumJ: char Stream.t -> int * char Stream.t
val remplirtab : char list -> char array array
val chargerPartie : string -> char list*int*string*int*char array array*int*char list*string*int*char array array*int*char list*int
					        
