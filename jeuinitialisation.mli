type plateaujoueur = {grille : string array array; numLigne : int; fini : bool;}
type joueur = {nom : string; plateau : plateaujoueur; score : int; lettre : string list;}
type partie = {pioche : Piochejarnac.piocheJeu; tour : int; joueur1 : joueur; joueur2 : joueur;}

val nouveauPlateau : plateaujoueur

val ajouterUnJoueur : string -> joueur

val nouvellePartie : partie

