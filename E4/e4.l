/* recognize tokens for the calculator */

%option noyywrap
%{

#include "token.h"
#include "ast.h"

void yyerror(char *s, ...);

%}


%%

. 			{ return ERROR; }

%%

