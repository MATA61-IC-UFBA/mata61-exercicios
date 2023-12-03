%{
#include <stdio.h>
#include <stdlib.h>
/* interface to the lexer */
#include "ast.h"
#include "ast.c"
#define YYSTYPE struct ast *


int yylex();
extern int yylineno; /* from lexer */
extern char *yytext;

void yyerror(char *s, ...)
{
    // fprintf(stderr,"%s\n",s);
}
struct ast * parser_result = 0;

%}

    /* minhas variáveis */
/*
%union{
    struct ast * ast_value;
}
*/

/* declare tokens */ 

//%token <ast_value> NUMBER
%token NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token OPENP
%token CLOSEP

/*
%type <ast_value> expr
%type <ast_value> term
%type <ast_value> factor
*/
%start program

%%
program
: expr EOL { parser_result = $1; return 0; } // Atribui o resultado a parser_result
;

expr
: expr PLUS term { $$ = ast_create(AST_PLUS, $1, $3); }  // Adição
| expr MINUS term { $$ = ast_create(AST_MINUS, $1, $3); } // Subtração
| term { $$ = $1; } // Termo sozinho
;

term
: term TIMES factor { $$ = ast_create(AST_TIMES, $1, $3); } // Multiplicação
| factor { $$ = $1; } // Fator sozinho
;

factor
: NUMBER { $$ = ast_create_value( atoi( yytext ) ); } // Número
| OPENP expr CLOSEP { $$ = $2; }      // Expressão entre parênteses
;

%%

