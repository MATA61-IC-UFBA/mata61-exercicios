/* recognize tokens for the calculator */ 

%option noyywrap nodefault yylineno
%{
#include <stdio.h>
#include "e7.tab.h"

void yyerror(char *s, ...);


int custom_atoi(const char *str) {
    return atoi(str);
}

%}


%%

"+" 	{ return PLUS; }
"-" 	{ return MINUS; }
"*" 	{ return TIMES; }
"(" 	{ return OPENP; } 
")" 	{ return CLOSEP; } 

[0-9]+ 	{ yylval = atoi(yytext); return NUMBER; }  
[ \t] 	{ /* ignore white space */ }
\n      { return EOL; }
.   	{ return ERROR; }
%%

