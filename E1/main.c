#include <stdio.h>
#include "token.h"

extern char *yytext;
extern int yylex();

int main(int argc, char **argv) {

	token_t tok;

	while ((tok = yylex())) {
		if (tok == ERROR)
                        printf("erro léxico: caractere inválido\n");
                else 
		   if (tok == NUM) 
			printf("categoria do token: %d, constante numérica: %s\n", tok, yytext);
		   else 
			printf("categoria do token: %d\n", tok);
	}
}
