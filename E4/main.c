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
    }
    else
       fprintf(stdout,"syntax error\n");

    exit(0);
}

void yyerror(char *s, ...)
{
    fprintf(stderr,"%s\n", s);
}
