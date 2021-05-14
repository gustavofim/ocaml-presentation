(* Basic function *)
let plus a b = a + b;;

(* Recursive factorial using if - then - else *)
let rec fact n =
  if n = 0 || n = 1 then
    1
  else
    n * fact (n - 1);;

(* Tail recursive factorial using mach - with and nested function *)
let tail_fact n =
  let rec inner_fact n a =
    match n with
      0 | 1 -> a
      | _ -> inner_fact (n - 1) (n * a)
  in inner_fact n 1;;

(* High order function that applies function f to every item of list l *)
let rec map f l =
  match l with
    [] -> []
    | h :: t -> f h :: map f t;;

(* Creating a binary search tree *)
type 'a bst =
    Vert of 'a * 'a bst * 'a bst
    | Null;;

(* Adding a vertex to the bst *)
let rec add n t =
  match t with
    Null -> Vert (n, Null, Null)
    | Vert (i, l, r) ->
      if n > i
        then Vert (i, l, add n r)
      else if n < i
        then Vert (i, add n l, r)
      else t;;       

(* Converting the bst into a list *)
let rec tree_list t =
  match t with
    Null -> []
    | Vert (i, l, r) -> tree_list l @ [i] @ tree_list r;;   

(* Imperative factorial using references (ref) and dereferencing (!) *)
let fact n =
    let t = ref 1 in
      for i = 1 to n do
        t := !t * i
      done;
    !t;;

(* Swapping ref values *)
let swap a b =
  let t = !a in
    a := !b;
    b := t;;

(* Stack of ints *)
class stack =
  object (self)
    (* Mutable variables *)
    val mutable the_list = ([] : int list)
    val mutable length = 0

    method push x =
      (* Assigning value to mutable var *)
      the_list <- x :: the_list;
      length <- length + 1

    method pop =
      match the_list with
        (* Raising exception *)
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

(* Instancing the object:
    * let my_stack = new stack;;
 * Calling methods:
    * my_stack#push 5;;
 *)
