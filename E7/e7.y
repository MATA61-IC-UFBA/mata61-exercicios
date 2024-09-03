%{
#include <stdio.h>
#include <stdlib.h>

/* interface to the lexer */
 
extern int yylineno; /* from lexer */
extern char *yytext;
int yylex();

void yyerror(char *s, ...)
{
   fprintf(stdout,"%s\n",s);
}

#define YYSTYPE struct expr *  // por que é necessário?
struct expr *parser_result = 0;
%}


/* declare tokens */ 
%token NUMBER
%token ERROR
%token EOL

%start program

%%
program
: expr EOL { parser_result = $1; return 0; }
;

expr
: expr '+' term
| expr '-' term
| term
;

term
: term '*' factor
| term '/' factor
| factor
;

factor
: NUMBER 
| '(' expr ')'
;

%%

