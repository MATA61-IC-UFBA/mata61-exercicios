# Exercício E3 (2026.1)

Este exercício tem como objetivo implementar com Bison
e ações semânticas  um interpretador para 
uma linguagem de expressões aritméticas, 
mostrando o resultado da avaliação da expressão.

## Especificação

Escrever um programa Bison com uma gramática livre de contexto para 
expressões aritméticas e ações semânticas para interpretá-las.
Expressões válidas incluem números inteiros,
e operações de adição, subtração, multiplicação 
e divisão inteira. 
As expressões aritméticas podem conter parênteses: ```( e )```.

#### Exemplos

- Entradas e saídas correspondentes:

```
737			   737
-12 			   -12
88 % 2			   syntax error (lexical error is syntax error)
6 * 8 + 2 - 3 - 4 * 5      27
40 * 5 + 1                 201
(1099 + 7) * 54            59724
60 2 - 3                   syntax error
7112 * (12341 + 8090       syntax error
200 / 4 		   50
576 * * 89                 syntax error
2 - 3 - 4 * 5              -21

```

### Arquivos

Lembre-se de que a pasta de trabalho é ```E3```.

- Copiar o arquivo E2/e2.l para E3/e3.l;
- Adaptar o arquivo E3/e3.l para as mudanças solicitadas em E3 e 
converter o lexema associado ao token __NUM__ para um valor inteiro; 
- Copiar o arquivo E2/e2.y para E3/e3.y;
- Reescrever a gramática usando apenas o não-terminal `expr` e 
testar a associatividade e precedência entre operadores, usando
diretivas do bison;
- Adaptar o arquivo E3/e3.y para as mudanças solicitadas em E3;
- Adicionar à gramática livre de contexto de e3.y 
ações semânticas para avaliar operações aritméticas.
- Os arquivos de teste estão na pasta ```E3/tests```. 

### Execução e teste

Ao executar o analisador, 
todos os testes disponibilizados em ```E3/tests``` devem passar (PASS).
O analisador deve reconhecer expressões sintaticamente válidas,
interpretá-las e mostrar o resultado na saída padrão ou
reportar a mensagem "syntax error".

#### Em sua máquina (local)

_Obs._: Teste localmente antes de subir sua resposta para o servidor.

- Para executar apenas, faça um```make compile``` ,
execute ```./interpreta``` e digite uma expressão aritmética.
- Para testar o interpretador com os testes fornecidos, 
faça um ```make compile``` seguido por um ```make test```;

#### No servidor (remoto)

- Quando fizer o ```push``` para subir a sua resposta,
todos os testes na pasta ```\tests``` serão executados.
Clique em ```details``` para ver os resultados.

## Entrega

Alterar **apenas** os arquivos ```E3/e3.l``` e ```E3/e3.y```.
Submeter sua resposta via GitHub.
