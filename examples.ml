let plus a b = a + b;;

let rec fact n =
  if n = 0 || n = 1 then
    1
  else
    n * fact (n - 1);;

let tail_fact n =
  let rec inner_fact n a =
    match n with
      0 | 1 -> a
      | _ -> inner_fact (n - 1) (n * a)
  in inner_fact n 1;;

let rec map f l =
  match l with
    [] -> []
    | h :: t -> f h :: map f t;;

type 'a bst =
    Vert of 'a * 'a bst * 'a bst
    | Null;;

let rec add n t =
  match t with
    Null -> Vert (n, Null, Null)
    | Vert (i, l, r) ->
      if n > i
        then Vert (i, l, add n r)
      else if n < i
        then Vert (i, add n l, r)
      else t;;       

let rec tree_list t =
  match t with
    Null -> []
    | Vert (i, l, r) -> tree_list l @ [i] @ tree_list r;;   

let fact n =
    let t = ref 1 in
      for i = 1 to n do
        t := !t * i
      done;
    !t;;

let swap a b =
  let t = !a in
    a := !b;
    b := t;;

class stack =
  object (self)
    val mutable the_list = ([] : int list)
    val mutable length = 0

    method push x =
      the_list <- x :: the_list;
      length <- length + 1

    method pop =
      match the_list with
        [] -> raise Not_found
        | h :: t ->
          the_list <- t;
          length <- length - 1;
          h

    method peek =
      match the_list with
        [] -> raise Not_found
        | h :: t -> h

    method len =
      length
  end;;