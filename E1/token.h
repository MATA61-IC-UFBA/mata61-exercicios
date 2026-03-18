/* token.h */

typedef enum {
        EOL=0,       // 0 - Final de linha
        NUM,         // 1
        PLUS,        // 2
        MINUS,       // 3
        TIMES,       // 4
        DIV,         // 5
        ERROR,       // 6 - Erro léxico
} token_t;


