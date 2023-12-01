%{
#include <stdio.h>
#include <stdlib.h>
/* interface to the lexer */
#include "ast.h"
#define YYSTYPE struct ast *
struct ast * parser_result;


extern int yylineno; /* from lexer */
int yylex();

void yyerror(char *s, ...)
{
    // fprintf(stderr,"%s\n",s);
}

%}

%union{
    /* minhas variáveis */
    struct ast * ast_value;
}

/* declare tokens */ 

%token <ast_value> NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token OPENP
%token CLOSEP

%type <ast_value> expr
%type <ast_value> term
%type <ast_value> factor

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

