# BUILD RULES
all: jeu

jeu: jeu.cmo chargement.cmo dictionnaire.cmo complements.cmo fonctiondebases.cmo affichage.cmo interaction.cmo lapioche.cmo projet.cmo
	ocamlc affichage.cmo chargement.cmo interaction.cmo fonctiondebases.cmo dictionnaire.cmo complements.cmo lapioche.cmo jeu.cmo projet.cmo -o jeu

projet.cmo: projet.ml chargement.cmo dictionnaire.cmo complements.cmo fonctiondebases.cmo affichage.cmo interaction.cmo jeu.cmo lapioche.cmo
	ocamlc -c projet.ml

lapioche.cmi: lapioche.mli
	ocamlc -c lapioche.mli
	
lapioche.cmo: lapioche.cmi lapioche.ml
	ocamlc -c lapioche.ml

interaction.cmi: interaction.mli
	ocamlc -c interaction.mli
	
interaction.cmo: interaction.cmi interaction.ml
	ocamlc -c interaction.ml

affichage.cmi: affichage.mli
	ocamlc -c affichage.mli

affichage.cmo: affichage.ml affichage.cmi
	ocamlc -c affichage.ml

complements.cmi: complements.mli dictionnaire.cmi
	ocamlc -c complements.mli
	
complements.cmo: complements.ml complements.cmi  dictionnaire.cmo
	ocamlc -c complements.ml

fonctiondebases.cmi: fonctiondebases.mli
	ocamlc -c fonctiondebases.mli

fonctiondebases.cmo: fonctiondebases.ml fonctiondebases.cmi
	ocamlc -c fonctiondebases.ml

dictionnaire.cmi:dictionnaire.mli 
	ocamlc -c dictionnaire.mli
	
dictionnaire.cmo: dictionnaire.ml dictionnaire.cmi
	ocamlc -c dictionnaire.ml
	
chargement.cmi: chargement.mli affichage.cmi
	ocamlc -c -pp camlp4o chargement.mli
	
chargement.cmo:	chargement.ml chargement.cmi affichage.cmo
	ocamlc -c -pp camlp4o chargement.ml
	
jeu.cmi: jeu.mli chargement.cmi dictionnaire.cmi complements.cmi fonctiondebases.cmi interaction.cmi affichage.cmi lapioche.cmi
	ocamlc -c jeu.mli
	
jeu.cmo: lapioche.cmo chargement.cmo fonctiondebases.cmo complements.cmo dictionnaire.cmo interaction.cmo affichage.cmo jeu.ml jeu.cmi 
	ocamlc -c jeu.ml



clean:
	rm -f *.cmi *.cmo *~


