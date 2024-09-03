# Exercício E7 - Avalia (2024.1) 
   - Individual

__Atenção__: 
Este exercício tem como objetivo implementar com Bison e ações semânticas em C, um avaliador para uma linguagem de expressões aritméticas.
Para uma expressão aritmética sintaticamente correta, constrói a árvore sintática abstrata (AST),  
percorre a AST a partir da sua raiz, avaliando seus nós,
e mostra o resultado da expressão da saída padrão. 
Em caso de erro sintático, a mensagem "syntax error" deve mostrada na saída padrão.

## Especificação

Expressões válidas incluem números inteiros não-negativos,
e operações de adição, subtração, multiplicação e divisão 
com tais números.
As expressões aritméticas podem conter parênteses: ```( e )```.

Recomenda-se ler a seção 5.4 Expression Trees do capítulo 5 do livro de Douglas Thain (pdf no Google Classroom).

#### Exemplos

- Entradas e saídas correspondentes:

```
6 * 8 + 2 - 3 - 4 * 5      27
40 * 5 + 1                 201
(1099 + 7) * 54            59724
60 2 - 3                   syntax error
7112 * (12341 + 8090       syntax error
576 * * 89                 syntax error
2 - 3 - 4 * 5              -21
8 * 9 / (7 - 7)            runtime error: divide by zero
```

### Arquivos

Lembre-se de que a pasta de trabalho é ```E7```.

- Usar o analisador léxico  E7/e7.l;
- Usar E7/main.c que chama a função ```int expr_evaluate```, com argumento do tipo ```struct expr *e```.  ```expr_evaluate``` percorre a AST gerada e mostra o resultado da expressão; 
em caso de erro sintático, mostra a mensagem de ```syntax error``` e em caso de divisão por zero, mostra a mensagem de ```runtime error: divide by zero```
- Utilizar o arquivo E7/e7.y para colocar a sua gramática livre de contexto com ações semânticas;
- Usar o código para manipulação de AST para expressões mostrado no capítulo 5 do livro do Douglas Thain (ver Seção 5.4 - Expression Trees). 
- Usar os arquivos ast.h e ast.c;
- Os arquivos de teste estão na pasta ```E7/tests```. 

### Execução e teste

Ao executar o analisador, 
todos os testes disponibilizados ```E7/tests``` devem passar (PASS).

#### Em sua máquina (local)

_Obs._: Teste localmente antes de subir sua resposta para o servidor.

- Para executar um teste apenas, faça um```make compile``` ,
execute ```./avalia``` e digite uma expressão aritmética.

- Para testar o analisador com os testes fornecidos, 
faça um ```make compile``` seguido por um ```make test```;

#### No servidor (remoto)

- Quando fizer o ```push``` para subir a sua resposta,
todos os testes na pasta ```\tests``` serão executados.
Clique em ```details``` para ver os resultados.


## Entrega

Arquivos-fonte no GitHub.
Programa bison ```E7/e7.y```, contendo uma gramática livre de contexto não-ambígua com regras de produção para o avaliador de expressões.

