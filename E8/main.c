#include <stdio.h> 
#include <stdlib.h> 
#include "e8.tab.h"

/* parser */

int yyparse();
/* definir e atribuir valor a parser_result em e8.y */

int main()
{
    if (yyparse()) 
	fprintf(stdout, "syntax error\n");
    else
	fprintf(stdout,"%d\n", parser_result); /* modificar para chamar expr_evaluate */
     
    exit(0);
}
