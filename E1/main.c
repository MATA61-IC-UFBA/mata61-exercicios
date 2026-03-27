#include "token.h"

int main(int argc, char **argv) {
#include <stdio.h>
#include "token.h"

extern int yylex();
extern char* yytext;

int main(int argc, char **argv) {
    int token;
    
    while ((token = yylex()) != EOL) {
        switch (token) {
            case NUM:
                printf("categoria do token: %d, constante numérica: %s\n", token, yytext);
                break;
            case PLUS:
            case MINUS:
            case TIMES:
            case DIV:
                printf("categoria do token: %d\n", token);
                break;
            case ERROR:
                printf("erro léxico: caractere inválido\n");
                break;
            default:
                break;
        }
    }
    
    return 0;
}
}

