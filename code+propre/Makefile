# BUILD RULES
all: projet

projet: jeuinitialisation.cmo dictionnaire.cmo complements.cmo fonctiondebases.cmo affichage.cmo interaction.cmo lapioche.cmo projet.cmo
	ocamlc interaction.cmo fonctiondebases.cmo dictionnaire.cmo complements.cmo lapioche.cmo affichage.cmo jeuinitialisation.cmo projet.cmo -o projet

projet.cmo: projet.ml dictionnaire.cmo complements.cmo fonctiondebases.cmo affichage.cmo interaction.cmo jeuinitialisation.cmo lapioche.cmo
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
	
jeuinitialisation.cmi: jeuinitialisation.mli dictionnaire.cmi complements.cmi fonctiondebases.cmi interaction.cmi affichage.cmi lapioche.cmi
	ocamlc -c jeuinitialisation.mli
	
jeuinitialisation.cmo: lapioche.cmo fonctiondebases.cmo complements.cmo dictionnaire.cmo interaction.cmo affichage.cmo jeuinitialisation.ml jeuinitialisation.cmi 
	ocamlc -c jeuinitialisation.ml



clean:
	rm -f *.cmi *.cmo *~


