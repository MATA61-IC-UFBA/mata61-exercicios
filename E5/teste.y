/* e5.y */

%{
#include <stdio.h>
#include <stdlib.h>

/* interface to the lexer */
 
extern int yylineno; /* from lexer */
void yyerror(char *s, ...);
int yylex();
%}

/* declare tokens */ 
%token EOL
%token NUM
%token ERROR

%left '+' '-'
%left '*'

/* Outros tokens  aqui */

%start program

%%
program
: expr EOL { return 1; }
;

expr
: expr '+' expr
| expr '-' expr
| expr '*' expr
| NUM
;


%%






