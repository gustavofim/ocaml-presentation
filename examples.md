# OCaml

## Primeiros Passos
### Expressões
- A expressão `1 + 2 x 4` pode ser computada da seguinte maneira:
```ocaml
# 1 + 3 * 4;;
```
para qual o interpretador *top level* retornará o tipo e o valor: `- : int = 13`.

- Também são válidas expressões booleanas:
```ocaml
# 20 > 100;;
```
`- : bool = false`

### Nomes
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

- Atenção!
```ocaml
# let a = 10;;
# a = 11;;
```
`- : bool = false`

### Funções
- Função soma:
```ocaml
# let sum a b = a + b;;
```
`val sum : int -> int -> int = <fun>`

- Recursividade e condicional `if ... then ... else` :
```ocaml
# let rec fact n =
    if n = 0 || n = 1 then
        1
    else
        n * fact (n - 1);;
```
`val fact : int -> int = <fun>`

```ocaml
# fact 5;;
```
Passo a passo:

`fact 4`

`4 * fact 3`

`4 * 3 * fact 2`

`4 * 3 * 2 * fact 1`

`4 * 3 * 2 * 1`

Então a expressão é avaliada em `24`.

- Recursão de cauda e reconhecimento de padrões:
```ocaml
# let rec inner_fact n a =
    match n with
        0 | 1 -> a
        | _ -> inner_fact (n - 1) (n * a);;

# let tail_fact n = inner_fact n 1;;
```
Paso a passo:

`tail_fact 4`

`inner_fact 4 1`

`inner_fact 3 4`

`inner_fact 2 12`

`inner_fact 1 24`

Vantagem: Complexidade de espaço não é mais proporcional a n!