#ifndef AST_H
#define AST_H

enum NodeType {
    VALUE,
    ADD,
    SUB,
    MUL,
    PAREN
};

struct AstNode {
    enum NodeType type;
    int value;
    struct AstNode* left;
    struct AstNode* right;
};

typedef struct AstNode AstNode;

AstNode* createValueNode(int value);
AstNode* createAddNode(AstNode* left, AstNode* right);
AstNode* createSubNode(AstNode* left, AstNode* right);
AstNode* createMulNode(AstNode* left, AstNode* right);
AstNode* createParenNode(AstNode* child);
int evaluate(AstNode* root);
void freeTree(AstNode* root);

#endif
