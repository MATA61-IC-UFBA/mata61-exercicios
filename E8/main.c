#include <stdio.h> 
#include <stdlib.h> 
#include "e8.tab.h"
#include "ast.h"
// #include "ast.c"

int yyparse();

/* definir e atribuir valor a parser_result em e8.y */
extern struct ast *parser_result;


int ast_evaluate( struct ast *e ){
    if(!e) return 0;

    int l = ast_evaluate(e->left);
    int r = ast_evaluate(e->right);

    switch(e->kind) {
        case AST_VALUE: return e->value;
        case AST_PLUS: return l+r;
        case AST_MINUS: return l-r;
        case AST_TIMES: return l*r;
    }
    return 0;
}


int main()
{
    if (yyparse()){

	    fprintf(stdout, "syntax error\n");
    } else {
	// fprintf(stdout,"%d\n", parser_result); /* modificar para chamar expr_evaluate */
        int evaluate = ast_evaluate( parser_result );
        fprintf(stdout, "%d\n", evaluate);
        exit(0);
    }
}
