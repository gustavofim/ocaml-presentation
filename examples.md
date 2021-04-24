# OCaml

## Primeiros Passos
### Expressões
- A expressão ```1 + 2 x 4``` pode ser computada da seguinte maneira:
```ocaml
# 1 + 3 * 4;;
```
para qual o *top level* retornará o tipo e o valor: ```- : int = 13```.

- Também são válidas expressões booleanas:
```ocaml
# 20 > 100;;
```
   ```- : bool = false```

Valores podem ser associados a nomes pelo uso de *let*:
```ocaml
# let a = 10;;
# a * a * a;;
```
A declaração retornará ```val a : int = 10``` enquanto a expressão
será avaliada ```- : int = 1000```.

Podemos escrever tudo isso em apenas uma expressão usando o construto ```let ... = ... in```:
```ocaml
# let a = 10 in a * a * a;;
```
```- : int = 1000```