(* Algumas variáveis *)
let ord_int = [1; 2; 3; 4; 5];;
let unord_int = [3; 4; 5; 1; 9];;
let bool_list = [true; false; true; true; false];;

let sum a b = a + b;;

(* Reverter lista usando tail recursion *)
let rec reverse_tr a b =
  match a with
    h::t -> reverse_tr t (h :: b)
    | [] -> b;;

let rec fact n =
  if n = 0 || n = 1 then
    1
  else
    n * fact (n - 1);;

(* Retornar listas com os valores de indice par de l *)
let rec evens l =
  match l with
    _::h::t -> h :: evens t
    | _ -> [];;

(* Conta o número de trues em uma lista usando tail recursion *)
let rec count_true_r l c =
  match l with
    [] -> c
    | h::t ->
      if h = true then
        count_true_r t (c + 1)
      else 
        count_true_r t c;;

let count_true l = count_true_r l 0;;
