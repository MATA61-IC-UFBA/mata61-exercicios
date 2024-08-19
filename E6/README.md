# Exercício E6 (2024.1)

__Atenção__: 
Este exercício tem como objetivo implementar com Bison
e ações semânticas  um interpretador para uma linguagem de expressões aritméticas, mostrando o resultado da expressão.

## Especificação de ```interpreta```

Escrever um programa Bison com uma gramática livre de contexto para 
expressões aritméticas e ações semânticas para interpretá-las.
Expressões válidas incluem números inteiros não-negativos,
e operações de adição, subtração e multiplicação com tais números.
- Atenção:  Não incluir divisão.
As expressões aritméticas podem conter parênteses: ```( e )```.

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
```

### Arquivos

Lembre-se de que a pasta de trabalho é ```E6```.

- Copiar o arquivo E5/e5.l para E6/e6.l;
- Adaptar o arquivo E6/e6.l para converter o lexema associado ao token  NUMBER em um valor inteiro; 
- Copiar o arquivo E5/e5.y para E6/e6.y;
- Utilizar o arquivo E6/e6.y para adicionar à sua  gramática livre de contexto ações semânticas para realizar operações artitméticas.
- Adaptar E6/main.c para reportar resultado ou mensagem de "syntax error";
- Os arquivos de teste estão na pasta ```E6/tests```. 

### Execução e teste

Ao executar o analisador, 
todos os testes disponibilizados em ```E6/tests``` devem passar (PASS).
O analisador deve reconhecer expressões sintaticamente válidas,
interpretá-las e mostrar o resultado na saída padrão ou
reportar a mensagem "syntax error".

#### Em sua máquina (local)

_Obs._: Teste localmente antes de subir sua resposta para o servidor.

- Para executar apenas, faça um```make compile``` ,
execute ```./interpreta``` e digite uma expressão aritmética.
- Para testar o analisador com os testes fornecidos, 
faça um ```make compile``` seguido por um ```make test```;

#### No servidor (remoto)

- Quando fizer o ```push``` para subir a sua resposta,
todos os testes na pasta ```\tests``` serão executados.
Clique em ```details``` para ver os resultados.


## Entrega

No GitHub.
Programa bison E6/e6.y contendo uma gramática livre de contexto não-ambígua com regras de produção 
para o interpretador de expressões aritméticas ("interpreta"), arquivos E6/e6.l e E6/main.c modificados.


