%{
#include "token.h"
%}

%option noyywrap

DIGIT    [0-9]
NUMBER   {DIGIT}+(\.{DIGIT}+)?

%%

{NUMBER}    { return NUM; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }
\n          { return EOL; }
[ \t\r]+    { /* Ignora espaços em branco, tabulações e retornos de carro */ }
.           { return ERROR; }

%%