# Exercício 3 (E3)

MUDAR para Exercício 3 - Validador


Modifique o seu analisador léxico para compL de modo que os códigos dos tokens retornados sejam mais específicos. Por exemplo, ao invés de retornar o token SYMC para o símbolo composto "<=", retornar o token 
LEQ, ou, ao invés de retornar o token KEY para a palavra-chave "if", retornar o token IF.
Para símbolos simples, ao invés de retornar SYM, pode retornar a representação ASCII para o caracter reconhecido.

Para isso, **deve alterar os arquivos compl.l e token.h**

```
/* token.h */

typedef enum {
        ID = 256,
        NUM,
        //        remover KEY,
        IF,    // inseriir IF e outras palavras-reservadas
        //        remover SYM e ver como vai retornar símbolos simples
        //        remover SYMC,
        LEQ,   // por exemplo, incluir LEQ, "less or equal", e assim por diante.
        CHAR,
        STR,
        ERROR,
} token_t;
```


```
#include "token.h"

"if"            { return IF; }  
...
"+"             { return ... // completar }

"<="            { return LEQ; }                                                                                                      
````



## Como gerar o seu analisador léxico executável

Seguir os mesmos passos para compilar, rodar e testar usados no T1.
Observe que o arquivo ```main.c``` está modificado.

Os arquivos na pasta E3/src do repositório são
```compl.l```, ```token.h``` e ```main.c```.
Editar e modificar o arquivo _compl.l_ e o arquivo _token,h".

```
make compile
```

## Como testar

Use o script ```run_tests.sh``` para testar seu analisador léxico.
Alguns testes são fornecidos, ou seja, programas em compL com extensão ```.in``` 
(ver pasta ```tests/inputs```), e o oráculo (ver pasta ```tests/oracle```).
A saída gerada por seu analisador léxico será colocada em ```tests/outputs```.

```
$ ./run_tests.sh  # comando para rodar os casos de testes em /tests
```

## Entrega

A entrega do E3 deve ser feita no repositório 
criado pelo GitHub Classroom.


