(** Voici deux fonctions qui peuvent vous faciliter la tâche dans la
    création d'un dictionnaire, en particulier si vous n'êtes pas à
    l'aise avec les manipulations de chaînes de caractères ou la
    lecture dans un fichier. Leur utilisation est complètement facultative. **)

(* Permet de déterminer si une chaîne de caractères est un mot en majuscules *)

let valide s =
  ((String.length s) <> 0) &&
    begin
      let ret = ref true in
      for i = 0 to (String.length s) - 1 do
	let c = Char.code s.[i] in
	ret := (!ret) && (c >= (Char.code 'A')) && (c <= (Char.code 'Z'))
      done;
      !ret
    end

(* Permet de charger un dictionnaire en mettant tous les mots en majuscules *)
(* Les mots avec accents sont supprimés. *)
(* La fonction add du dictionnaire doit avoir été déjà implantée. *)

let charge_dico =
  let flux = open_in "dico_fr.txt" in
  let mondico = ref (Dictionnaire.dico_vide ()) in
  try
    begin
      while true do
	let l = String.uppercase (input_line flux) in
	if (valide l) then
	  mondico := Dictionnaire.add l (!mondico)
      done;
      !mondico
    end
  with
    End_of_file -> !mondico
