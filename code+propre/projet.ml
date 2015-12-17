type actionTour = Former|Transformer|Passer
type actionPioche = Tirer|Echanger

(*type plateaujoueur = {grille : char array array; mutable numLigne : int; mutable fini : bool;}
type joueur = {mutable nom : string; mutable plateau : plateaujoueur; mutable score : int; mutable lettre : char list;}
type partie = {mutable pioche : piocheJeu; mutable tour : int; mutable joueur1 : joueur; mutable joueur2 : joueur; mutable numJoueurTour : int}
*)

(*INITIALISATION*)

let partieJanac = Jeuinitialisation.charger ()

(*PREMIER TOUR*)
let _ = Jeuinitialisation.premierTour partieJanac

(*N TOUR*)
let _ = Jeuinitialisation.nEmeTour partieJanac

(*Resultat*)
let _ = Jeuinitialisation.resultat partieJanac 

(*

1 - Netoyer le code!
2 - problème d aléatoire de la pile tjr le meme fucking ordre aléatoire => plus problème
3 - verifier que le programme termine
4 - ajouter dico
5 - faire sauvagarde
6 - _O/ HEY! \O_ HEY! \O/ HEY!*)
