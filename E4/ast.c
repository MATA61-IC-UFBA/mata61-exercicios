#include <stdio.h>
#include <stdlib.h>
#include "ast.h"

struct expr* expr_create_value(int value) {
	struct expr *e = expr_create(EXPR_VALUE,0,0);
	e->value = value;
    	return e;
}

struct expr* expr_create(expr_t kind, 
			 struct expr *left, 
			 struct expr *right) {
	struct expr *e = malloc(sizeof(*e));
	e->kind = kind;
	e->value = 0;
	e->left = left;
	e->right = right;
	return e;
}

void expr_print(struct expr *e) {
    if (!e) 
       return;

    fprintf(stdout,"(");
    expr_print(e->left);

    switch(e->kind) {
        case EXPR_VALUE: { fprintf(stdout,"%d", e->value); break; }
        case EXPR_ADD: { fprintf(stdout,"+"); break; }
        case EXPR_SUBTRACT: { fprintf(stdout,"-"); break; }
        case EXPR_MULTIPLY: { fprintf(stdout,"*"); break; }
        case EXPR_DIVIDE: { fprintf(stdout,"/"); break; } 
    }

    expr_print(e->right);
    fprintf(stdout,")");
}

