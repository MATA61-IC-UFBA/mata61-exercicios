/* recognize tokens for the calculator */

%option noyywrap
%{

#include "token.h"

void yyerror(char *s, ...);

%}


%%

[0-9]+ 			{ return NUM; }
"+"			{ return PLUS; }
"-"			{ return MINUS; }
"*"			{ return TIMES; }
"/"			{ return DIV; }
"("                     { return LPAR; }
")"                     { return RPAR; }
"\n"			{  return EOL; }
[ \t\r]+		{ /* ws */ }
. 			{ return ERROR; }

%%

