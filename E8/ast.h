#ifndef AST_H
#define AST_H

typedef enum {
    AST_VALUE,
    AST_PLUS,
    AST_MINUS,
    AST_TIMES
    // AST_DIVIDE,
} ast_t;

struct ast {
    ast_t kind;
    struct ast *left;
    struct ast *right;
    int value;
};

#endif