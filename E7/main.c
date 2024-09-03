#include <stdio.h> 
#include <stdlib.h> 
#include "e7.tab.h"
#include "ast.h"

/* parser */

int yyparse();

extern struct expr* parser_result;

int main()
{
    if (!yyparse()) {
	fprintf(stdout, "%d\n", expr_evaluate(parser_result));
    }
    else
	fprintf(stderr, "syntax error\n");

    exit(0);
}


