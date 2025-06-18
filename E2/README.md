# Exercício E2 - Expressões com Flex - 2024.1


Análise léxica com Flex. 

- Implementar um analisador léxico para expressões aritméticas.

Olhar o capítulo 2 do livro do Levine (Flex&Bison).

- Fazer um analisador léxico para expressões aritméticas sobre números inteiros e os operadores +  -  *  e  / .
O programa recebe uma expressão digitada na entrada padrão -- apenas uma expressão por linha e, a cada chamada da função yylex(), o analisador léxico  retorna o código do token (valor inteiro) e, para dígitos, também o seu valor. Usar o token ERROR para indicar erro léxico.
O programa main.c deve chamar yylex() e imprimir a saída conforme mostrado abaixo.

#  Exemplo. 
  - Entrada:  90 * 100 / 18 - 48 + 77
  - Saída:
```
constante decimal: 90
código do token: 4
constante decimal: 100
código do token: 5
constante decimal: 18
código do token: 3
constante decimal: 48
código do token: 2
constante decimal: 77
código do token: 0
```
```
## Arquivo token.h

/* token.h */

typedef enum {
        EOL=0,          // newline (final de linha)   
        NUMBER,      // 1
        PLUS,            // 2
        MINUS,         // 3
        TIMES,          // 4
        DIV,               // 5
        ERROR,        // 6
} token_t; 
```

- Entrega: Três arquivos via GitHub: e2.l (programa flex), token.h (definição de tokens) e main.c (chama yylex() até final de linha).
