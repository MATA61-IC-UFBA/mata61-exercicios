#include "ast.h"
#include <stdlib.h>

AstNode* createValueNode(int value) {
    AstNode* node = (AstNode*)malloc(sizeof(AstNode));
    node->type = VALUE;
    node->value = value;
    node->left = NULL;
    node->right = NULL;
    return node;
}

AstNode* createAddNode(AstNode* left, AstNode* right) {
    AstNode* node = (AstNode*)malloc(sizeof(AstNode));
    node->type = ADD;
    node->left = left;
    node->right = right;
    return node;
}

AstNode* createSubNode(AstNode* left, AstNode* right) {
    AstNode* node = (AstNode*)malloc(sizeof(AstNode));
    node->type = SUB;
    node->left = left;
    node->right = right;
    return node;
}

AstNode* createMulNode(AstNode* left, AstNode* right) {
    AstNode* node = (AstNode*)malloc(sizeof(AstNode));
    node->type = MUL;
    node->left = left;
    node->right = right;
    return node;
}

AstNode* createParenNode(AstNode* child) {
    return child;
}

int evaluate(AstNode* root) {
    if (root->type == VALUE) {
        return root->value;
    } else if (root->type == ADD) {
        return evaluate(root->left) + evaluate(root->right);
    } else if (root->type == SUB) {
        return evaluate(root->left) - evaluate(root->right);
    } else if (root->type == MUL) {
        return evaluate(root->left) * evaluate(root->right);
    }
    return 0;  // Handle error case
}

void freeTree(AstNode* root) {
    if (root == NULL) {
        return;
    }
    freeTree(root->left);
    freeTree(root->right);
    free(root);
}
