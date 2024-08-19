/* recognize tokens for the calculator */ 

%option noyywrap nodefault yylineno
%{

#include <stdio.h>
#include "e6.tab.h"

void yyerror(char *s, ...);


%}


%%

.   	{ return ERROR; }

%%
