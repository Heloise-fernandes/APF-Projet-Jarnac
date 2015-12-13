# BUILD RULES
all: projet

projet: jeuinitialisation.cmo piochejarnac.cmo projet.cmo
	ocamlc jeuinitialisation.cmo piochejarnac.cmo projet.cmo -o projet

projet.cmo: jeuinitialisation.cmo piochejarnac.cmo projet.ml 
	ocamlc -c projet.ml

piochejarnac.cmi: piochejarnac.mli
	ocamlc -c piochejarnac.mli
	
piochejarnac.cmo: piochejarnac.cmi piochejarnac.ml 
	ocamlc -c piochejarnac.ml

jeuinitialisation.cmi: jeuinitialisation.mli piochejarnac.cmi
	ocamlc -c jeuinitialisation.mli
	
jeuinitialisation.cmo: jeuinitialisation.cmi piochejarnac.cmo jeuinitialisation.ml
	ocamlc -c jeuinitialisation.ml

		
	
	
clean:
	rm -f *.cmi *.cmo *~


