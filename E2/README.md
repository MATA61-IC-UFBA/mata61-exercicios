# Exercício 2 (E2) via GitHub Classroom

Análise sintática de expressões aritméticas.
Bison e análise sintática, com integração entre Flex e Bison.

__Atenção__:
Este exercício tem como objetivo _apenas_ analisar a sintaxe de
expressões aritméticas.
Não avaliar a expressão para mostrar seu resultado.

## Especificação

Escrever um programa Bison com uma gramática livre de contexto para
expressões aritméticas.
Expressões válidas incluem números inteiros não-negativos,
e operações de adição, subtração, multiplicação e divisão com tais números. 
** Expressões aritméticas podem conter parênteses**: ```( e )```.

### Exemplos

```
1 + 2 - 3 - 4 * 5      (expressão válida)
40 * 5 / 8 + 1         (expressão válida)
(1099 + 7) * 54        (expressão válida)
60 2 / 3               (expressão mal-formada)
7112 * (12341 + 8090   (expressão mal-formada)
576 * / 89             (expressão mal-formada)
```

## Passos

A pasta de trabalho é ```E2```. Usar apenas essa pasta.

- Copiar o arquivo do exercício E1, ```e1.l```, para a pasta E2 e renomear o arquivo para ```e2.l```;
- Modificar E2/e2.l para reconhecer parênteses;
- Utilizar o arquivo E2/main.c (não modificar);
   - Observar que o arquivo ```main.c``` agora inclui bibliotecas e declara variáveis relacionadas ao bison, e chamada para a função de análise sintática gerada;
- Utilizar o arquivo E2/e2.y para colocar a sua gramática livre de contexto
   - Definir os tokens usados pelo analisador léxico (%token). O token EOL deve ser definido assim:
```%token EOL 0```
   - Não modificar a primeira regra de produção (associada a ```program```);
   - Editar E2/e2.y e colocar as regras de produção para análise de expressões aritméticas;
- Rodar ```bison -d e2.y'''; bison --defines=token.h --output=e2.c e2.y
- Rodar flex, compilar arquivos .c, gerar executável ```e2```e testar (assumir entrada padrão).

Alterar **apenas** os arquivos ```E2/e2.l``` e ```E2/e2.y```.
Submeter sua resposta via GitHub.


