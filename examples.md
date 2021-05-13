# OCaml

## Primeiros Passos
### Expressões
- A expressão `1 + 2 x 4` pode ser computada da seguinte maneira:
```ocaml
# 1 + 3 * 4;;
# (1 + 3) * 4;;
```
para qual o interpretador *top level* retornará o tipo e o valor, respectivamente:

`- : int = 13`

`- : int = 16`

- Também são válidas expressões booleanas:
```ocaml
# 20 > 100;;
# 20 <= 100;;
# 20 = 100;;
# 20 <> 100;;
```
`- : bool = false`

`- : bool = true`

`- : bool = false`

`- : bool = true`

### Nomes e Funções
- Valores podem ser associados a nomes pelo uso de `let`:
```ocaml
# let a = 10;;
# a * a * a;;
```
A declaração retornará `val a : int = 10` enquanto a expressão
será avaliada `- : int = 1000`.

Podemos escrever tudo isso em apenas uma expressão usando o construto ```let ... = ... in```:
```ocaml
# let a = 10 in a * a * a;;
```
`- : int = 1000`

- Função soma:
```ocaml
# let plus a b = a + b;;
```
`val plus : int -> int -> int = <fun>`

- Atenção!

    - Estados são imutaveis.

    - Polimorfismo apenas para operadores booleanos.

### Recursividade
- Recursividade e condicional `if ... then ... else` :
```ocaml
# let rec fact n =
    if n = 0 || n = 1
    then 1
    else n * fact (n - 1);;
```
`val fact : int -> int = <fun>`

```ocaml
# fact 4;;
```
Passo a passo:

`fact 4`

`4 * fact 3`

`4 * 3 * fact 2`

`4 * 3 * 2 * fact 1`

`4 * 3 * 2 * 1`

Então a expressão é avaliada em `24`.

- Recursão de cauda e reconhecimento de padrões `match ... with`:
```ocaml
# let tail_fact n =
  let rec inner_fact n a =
    match n with
      0 | 1 -> a
      | _ -> inner_fact (n - 1) (n * a)
    in inner_fact n 1;;
```
Passo a passo:

`tail_fact 4`

`inner_fact 4 1`

`inner_fact 3 4`

`inner_fact 2 12`

`inner_fact 1 24`

Vantagem: Complexidade de espaço não é mais proporcional a n!

### Aplicação Parcial
```ocaml
# let plus a b = a + b;;
```
`val plus : int -> int -> int = <fun>`

### Map
```ocaml
# let rec map f l =
  match l with
    [] -> []
    | h :: t -> f h :: map f t;;
```
`val map : ('a -> 'b) -> 'a list -> 'b list = <fun>`

- Reduce e filter.

### Novos tipos
```ocaml
# type colour = Red | Green | Blue | Yellow;;
```

```ocaml
# type 'a bst =
    Vert of 'a * 'a bst * 'a bst
    | Null;;
```

```ocaml
# let rec add n t =
  match t with
    Null -> Vert (n, Null, Null)
    | Vert (i, l, r) ->
      if n > i
        then Vert (i, l, add n r)
      else if n < i
        then Vert (i, add n l, r)
      else t;;       
```

```ocaml
# let rec tree_list t =
  match t with
    Null -> []
    | Vert (i, l, r) -> tree_list l @ [i] @ tree_list r;;   
```

### Recursos Imperativos
- Referência
```ocaml
# let fact n =
    let t = ref 1 in
      for i = 1 to n do
        t := !t * i
      done;
    !t;;
```

```ocaml
# let swap a b =
  let t = !a in
    a := !b;
    b := t;;
```
`- : 'a ref -> 'a ref -> unit = <fun>`

- `while ... do ... done;` 

### Orientação a Objetos
`class name = object (self) ... end`

- Exemplo
```ocaml
# class stack =
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
```

### Referências
- Livro: OCaml from the Very Beginning;
- Site: ocaml.org/learn/
