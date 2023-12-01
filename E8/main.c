#include <stdio.h> 
#include <stdlib.h> 
#include "e8.tab.h"
#include "ast.h"

/* parser */

struct ast * ast_tree = yyparse();
/* definir e atribuir valor a parser_result em e8.y */

int main()
{
    if (!ast_tree) 
	    fprintf(stdout, "syntax error\n");
    else
	// fprintf(stdout,"%d\n", parser_result); /* modificar para chamar expr_evaluate */
        int evaluate = ast_evaluate( ast_tree );
        fprintf(stdout, "%d\n", evaluate);
        exit(0);
}
