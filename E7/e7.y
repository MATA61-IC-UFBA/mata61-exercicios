%{
#include <stdio.h>
#include <stdlib.h>

/* interface to the lexer */
 
extern int yylineno; /* from lexer */
int yylex();

int parser_result;


void yyerror(char *s, ...)
{
    fprintf(stderr,"%s\n",s);
}

%}

%union{
    /* minhas variáveis */
    int integer_value;
}

/* declare tokens */ 
%token <integer_value> NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token OPENP
%token CLOSEP

// %error-verbose
%type <integer_value> expr
%type <integer_value> term
%type <integer_value> factor


%start program

%%
program
: expr EOL { parser_result = $1; return 0; } // Atribui o resultado a parser_result
//| ERROR    { yyerror("Erro léxico na entrada"); }
;

expr
: expr PLUS term { $$ = $1 + $3; }  // Adição
| expr MINUS term { $$ = $1 - $3; } // Subtração
| term { $$ = $1; } // Termo sozinho
;

term
: term TIMES factor { $$ = $1 * $3; } // Multiplicação
| factor { $$ = $1; } // Fator sozinho
;

factor
: NUMBER { $$ = $1; } // Número
| OPENP expr CLOSEP { $$ = $2; }      // Expressão entre parênteses
;

%%

