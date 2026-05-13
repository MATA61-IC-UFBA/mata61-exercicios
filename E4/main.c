#include <stdio.h>
#include <stdlib.h>
#include "ast.h"
#include "token.h"

extern int yyparse();
extern struct expr* parser_result;

int main()
{
    if (!yyparse()) {
	expr_print(parser_result);
	fprintf(stdout, "\n");
    }

    exit(0);
}

void yyerror(char *s, ...)
{
    fprintf(stdout,"%s\n", s);
}
