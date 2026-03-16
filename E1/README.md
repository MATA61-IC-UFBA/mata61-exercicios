# Exercício 1 (E1) 

Análise léxica com Flex. 

- Implementar um analisador léxico para expressões aritméticas.

Olhar o capítulo 2 do livro do Levine (Flex&Bison).

Fazer um analisador léxico para expressões aritméticas para números inteiros e reais
(com '.') e os operadores ```+  -  *  e  / ```.

## Descrição

- O programa recebe uma expressão digitada na entrada padrão, apenas uma expressão por linha e, 
a cada chamada da função yylex(), 
o analisador léxico  retorna o código do token (valor inteiro) e, 
para constantes, também o seu valor. 
- Usar o token ERROR para indicar erro léxico.
- A mensagem de erro deve ser mostrada após o retorno do token ERROR.
- Definir uma função main() que chama yylex() até final de linha (EOL).
- O programa main.c deve gerar a saída conforme mostrado abaixo.


##  Exemplos

### Entrada válida

  - Entrada:  90 * 100 / 18.0 - 48 + 77
  - Saída:

```
constante decimal: 90
código do token: 4
constante decimal: 100
código do token: 5
constante real: 18.0
código do token: 3
constante decimal: 48
código do token: 2
constante decimal: 77
código do token: 0
```

### Entrada inválida

  - Entrada:  90 * 100 / .0 
  - Saída:

```
constante decimal: 90
código do token: 4
constante decimal: 100
código do token: 5
erro léxico: . 
constante decimal: 0
```

## Erros Léxicos

- Caracter inválido
- (outros a discutir)


## Arquivo token.h

```

/* token.h */

typedef enum {
        EOL=0,       // Final de linha
        INTEGER,     
        REAL,        
        PLUS,        
        MINUS,       
        TIMES,       
        DIV,         
        ERROR,       // Erro léxico
} token_t; 

```

## Entrega

Três arquivos via GitHub: 
- e1.l (programa flex), 
- token.h (definição de tokens) e 
- main.c (chama yylex() até final de linha).


