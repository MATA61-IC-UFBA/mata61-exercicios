/* recognize tokens for the calculator */ 

%option noyywrap nodefault yylineno
%{

#include <stdio.h>
#include "e7.tab.h"

void yyerror(char *s, ...);

%}


%%

[0-9]+			{ return NUMBER; }
"+"|"-"|"*"|"/"|"("|")" { return yytext[0]; } 
[\n]			{ return EOL; }
[ \t]			{ /* skip */ }
.   			{ return ERROR; }

%%
