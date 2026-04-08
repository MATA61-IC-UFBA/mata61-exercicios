/* e2.y */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s, ...);
int yylex();
%}

%token EOL 0

%%
program
: expr EOL
;


%%

