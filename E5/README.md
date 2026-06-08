# E5 - Exercício 5

## Análise semântica de expressões aritméticas.

A verificação de tipos é um componente importante da análise semântica. 
Antes da verificação de tipos, deve-se determinar o tipo de cada identificador 
usado em uma expressão. 

Para o exercício E5, considere que você pode ter variáveis em
expressões, que deve declarar seu tipo (`integer` ou `float`)
antes de usá-las e que a atribuição é uma expressão válida.
Considere que os tipos `integer` e `float` de E5 
**não** são tipos compatíveis.

Considere que um programa de expressões válido consiste em
uma declaração `let-in-end`, 
com uma ou mais declarações de variável
entre `let` e `in`, 
e uma sequência não-vazia de expressões entre `in` e `end`.

Exemplos:

```
let
  x: integer;
  y: integer;
in
  x = 1;
  y = 2;
  (x + y) * 10     // expressão válida    
end
```

```
let
  x: integer;
  y: float;
in
  x = 1;
  y = 2.5;
  x + y    // erro semântico: tipos incompatíveis em E5
end
```

## Mapeamento entre os nomes das variáveis locais de armazenamento

Uma variável x em uma expressão pode se referir a 
uma variável local, 
um parâmetro de função, uma variável global, etc. 
No E5, há apenas variáveis locais, declaradas na seção `let-in`,
a serem usadas na seção `in-end`.

Cada definição de variável deve ser inserida 
em uma tabela de símbolos, referenciada 
ao longo da etapa de análise semântica.
Para E5, usaremos o código fornecido 
por D. Thain para implementar funcionalidades para
manipular tabela de símbolos
e _resolução de nomes_ (detalhes a seguir).

### Resolução de nomes

A resolução de nomes é o processo de associar 
cada uso de um nome de variável à sua definição correspondente. 
Para implementar a resolução de nomes, 
usa-se um método de resolução para cada uma das estruturas 
da AST (decl, expr, etc.). 
No exercício E5, usaremos apenas `decl_resolve()`
e `expr_resolve()`.
Esses métodos visitam nós da AST, procurando
por declarações e usos de variáveis. 
- Sempre que uma variável for declarada, 
ela deve ser inserida na tabela de símbolos 
e o link para o novo símbolo criado (ver symbol.h) 
deve ser vinculado à AST (nó do tipo `decl`).
- Sempre que uma variável for usada, 
ela deve ser buscada na tabela de símbolos,
e o link para o símbolo encontrado
deve ser vinculado à AST (nó do tipo `expr`).

### Verificação de tipos

Após a resolução de nomes, 
deve-se realizar a verificação de tipos. 
Nesta etapa, calcula-se o tipo de expressões,
combinando os tipos básicos de cada valor de acordo 
com as regras de conversão de tipos.
No caso de E5, não há conversão de tipos 
entre `integer` e `float`
e combinações que misturam os dois tipos
são consideradas como **erro semântico**.

Em E5, se um tipo for usado de uma maneira não permitida, 
o analisador semântico exibirá uma mensagem de erro,
e seguirá com a análise semântica do programa, reportando todos
os erros semânticas encontrados.

## Descrição de E5

Implemente a verificação de tipos para expressões em E5, 
com declaração de variáveis com tipo
`integer` ou `float` feita antes de seu uso.
Será permitida a atribuição de expressões a variáveis previsamente 
declaradas 
e uso de variáveis previamente declaradas 
do lado direito da atribuição.
A atribuição é tratada como expressão e não como comando.
Usaremos o ambiente `let .. in .. end` como no exemplo a seguir:

```
let 
   w: float;
   x: integer;
   y: float;
   z: integer;
in
   w = 3.14;    
   y = 2.5;
   x = 10.0;        // The '=' has lhs and rhs with incompatible types
   z = x * y * y;   // The '*' operation has operands with incompatible types
   u + z            // Missing variable declaration
end
```

Considere que expressões podem ser `integer` ou `float`.
Identificadores de variáveis só podem ter letras minúsculas. 
Use e adapte apenas os arquivos e4.y e e4.l do exercício E4,
disponíveis na sua pasta E4.
Use os arquivos `.c`, `.h` e os testes fornecidos na pasta E5.
Considere o material e exemplos do capítulo 7 de D. Thain.

A seção entre `let` e `in` contém declarações de variáveis
a serem usadas nas expressões entre `in` e `end`.
Expressões são terminadas por `;`, 
exceto a expressão que antecede o `end`.

### Funcionalidades:

1. Gerenciamento da tabela de símbolos: 
Use a implementação de tabela `hash` fornecida no arquivo `hash_table.c`
(ver diretório E5).

2. Implemente a função decl_resolve() para 
criar um novo símbolo e inserí-lo na tabela de símbolos 
para cada declaração de variável. O símbolo criado 
deverá ser associado à declaração de variável.
A função decl_resolve deve reportar um erro semântico
quando o mesmo nome for declarado duas vezes.

3. Implemente a função expr_resolve() para buscar nomes
usados em expressões na tabela de símbolos e indicar erro 
quando uma variável for usada sem declaração.

4. Implemente `typecheck` (AST) para verificação de tipos
a partir da raiz da AST de programas sintaticamente corretos.

Considere as regras descritas a seguir.

### Regras semânticas

1. declaração: uma variável deve ser declarada antes de ser usada;
2. unicidade: cada nome de variável só pode ser declarado uma vez;
3. compatibilidade de tipos: operadores binários (assign, '+', '-', etc) devem ter os mesmos tipos nos lados esquerdo e direito.

### Mensagens de erro

As mensagens de erro semântico na resolução de nomes são:

- Duplicated variable declaration
- Missing variable declaration

As mensagens de erro semântico em expressões são:

- Error: The '=' has lhs and rhs with incompatible types 
- Error: The '+' operation has operands with incompatible types
- Error: The '-' operation has operands with incompatible types
- Error: The '*' operation has operands with incompatible types
- Error: The '/' operation has operands with incompatible types

Há duas mensagens de "warning":
- Warning: Division by literal 0
- Warning: Division by literal 0.0

## Entrega

Os arquivos e5.y, e5.l, 
e funções implementadas na linguagem de programação C paranos arquivos indicados.

