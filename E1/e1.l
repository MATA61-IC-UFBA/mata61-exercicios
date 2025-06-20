/* Calculator */
/* Recognize tokens for the calculator and print them out */

%option main

%%

"+" 	{ printf("ADD\n"); }
"-" 	{ printf("SUB\n"); }
"*" 	{ printf("TIMES\n"); }
"/" 	{ printf("DIV\n"); }
[0-9]+ 	{ printf("INTEGER %s\n", yytext); }
\n 	{ printf("NEWLINE\n"); }
[ \t]	 { }
.	{ printf("Caracter desconhecido: %s\n",yytext); }

%%

