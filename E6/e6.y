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

int parser_result;

%}

/* declare tokens */ 

%%
program
: expr EOL { parser_result = $1; return 0;}
;


%%
