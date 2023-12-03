/* recognize tokens for the calculator */

%option noyywrap nodefault yylineno
%{
#include "e7.tab.h"

void yyerror(char *s, ...);
%}

%%

"+" 	{ return PLUS; }
"-" 	{ return MINUS; }
"*" 	{ return TIMES; }
"(" 	{ return OPENP; } 
")" 	{ return CLOSEP; } 

[0-9]+ 	{   yylval.integer_value = atoi(yytext);
            return NUMBER; }  /* fazer conversão para int aqui */
[ \t] 	{ /* ignore white space */ }
\n      { return EOL; }
.   	{ return ERROR; }
%%

