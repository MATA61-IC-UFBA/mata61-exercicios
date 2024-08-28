%{
#include <stdio.h>
#include <stdlib.h>

/* interface to the lexer */
 
extern int yylineno; /* from lexer */
int yylex();

void yyerror(char *s, ...)
{
   fprintf(stderr,"%s\n",s);
}

int parser_result = 0;
%}

/* declare tokens */ 
%token NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token OPENP
%token CLOSEP

%start program

%%
program
: expr EOL { parser_result = $1; return 0; }
;

expr
: expr PLUS term
| expr MINUS term
| term
;

term
: term TIMES factor
| factor
;

factor
: NUMBER 
| OPENP expr CLOSEP
;

%%

