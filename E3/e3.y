/* e3.y */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s, ...);
int yylex();
int parser_result = 0;
%}

%token EOL 0
%token NUM

%start program

%%
program
: expr EOL { parser_result = $1; }
;

expr
: ...

%%


