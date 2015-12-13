# BUILD RULES
all: projet

projet: jeuinitialisation.cmo projet.cmo
	ocamlc jeuinitialisation.cmo projet.cmo -o projet

projet.cmo: jeuinitialisation.cmo projet.ml 
	ocamlc -c projet.ml

jeuinitialisation.cmi: jeuinitialisation.mli
	ocamlc -c jeuinitialisation.mli
	
jeuinitialisation.cmo: jeuinitialisation.cmi jeuinitialisation.ml
	ocamlc -c jeuinitialisation.ml
	
clean:
	rm -f *.cmi *.cmo *~


