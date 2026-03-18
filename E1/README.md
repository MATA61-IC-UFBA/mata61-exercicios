# Exercício 1 (E1) 

## Análise léxica com Flex

- Implementar um analisador léxico para expressões aritméticas.

- Consultar o capítulo 2 do livro do Levine (Flex&Bison).

Fazer um analisador léxico para expressões aritméticas com números inteiros e reais
(com '.') e os operadores aritméticos ```+  -  *  e  / ```.

## Descrição

- O programa recebe uma expressão digitada na entrada padrão, 
apenas uma expressão por linha e, a cada chamada da função yylex(), 
o analisador léxico  retorna o código da categoria do token (valor inteiro) 
e, para constantes númericas, também o lexema (cadeia de caracteres).
- Usar o token ERROR para indicar erro léxico.
- Definir uma função main() que chama yylex() até final de linha (EOL).
- A mensagem de erro deve ser mostrada na saída padrão após o retorno do token ERROR.
- O programa main.c deve gerar a saída conforme mostrado abaixo.


##  Exemplos

### Entrada válida

  - Entrada:  90 * 100 / 18.0 - 48 + 77
  - Saída:

```
categoria do token: 1, constante numérica: 90
categoria do token: 4
categoria do token: 1, constante numérica: 100
categoria do token: 5
categoria do token: 1, constante numérica: 18.0
categoria do token: 3
categoria do token: 1, constante numérica: 48
categoria do token: 2
categoria do token: 1, constante numérica: 77
```

### Entrada inválida

  - Entrada:  90 * 100 / .0 
  - Saída:

```
categoria do token: 1, constante numérica: 90
categoria do token: 4
categoria do token: 1, constante numérica: 100
categoria do token: 5
erro léxico: caractere inválido
categoria do token: 1, constante numérica: 0
```

## Erros Léxicos

- Caractere inválido


## Arquivo token.h

```

/* token.h */

typedef enum {
        EOL=0,       // 0 - Final de linha
        NUM,         // 1
        PLUS,        // 2
        MINUS,       // 3
        TIMES,       // 4
        DIV,         // 5
        ERROR,       // 6 - Erro léxico
} token_t; 

```

## Entrega

Três arquivos via GitHub: 
- e1.l (programa flex)
- token.h (definição de tokens)
- main.c


