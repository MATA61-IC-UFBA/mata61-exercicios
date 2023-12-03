#ifndef FUNC_AST
#define FUNC_AST
struct ast * ast_create( 
    ast_t kind,
    struct ast *left,
    struct ast *right )
{
    struct ast *e = malloc(sizeof(*e));
    e->kind = kind;
    e->value = 0;
    e->left = left;
    e->right = right;
    return e;
}

struct ast * ast_create_value( int value ){
    struct ast *e = ast_create(AST_VALUE,0,0);
    e->value = value;
    return e;
}

/*
int ast_evaluate( struct ast *e ){
    if(!e) return 0;

    int l = ast_evaluate(e->left);
    int r = ast_evaluate(e->right);

    switch(e->kind) {
        case AST_VALUE: return e->value;
        case AST_PLUS: return l+r;
        case AST_MINUS: return l-r;
        case AST_TIMES: return l*r;
        // case AST_DIVIDE:
        //     if(r==0) {
        //         printf("runtime error: divide by zero\n");
        //         exit(1);
        //     }
        //     return l/r;
    }
    return 0;
}
*/

void ast_print( struct ast *e ){
    if(!e) return;

    printf("(");
    ast_print(e->left);

    switch(e->kind) {
        case AST_VALUE: printf("%d",e->value); break;
        case AST_PLUS: printf("+"); break;
        case AST_MINUS: printf("-"); break;
        case AST_TIMES: printf("*"); break;
        // case AST_DIVIDE: printf("/"); break;
    }

    ast_print(e->right);
    printf(")");
}

#endif