#include <stdio.h>
#include <stdlib.h>
#include "token.h"

int yyparse();

int main()
{
   if (yyparse() == 0)
      printf("no syntax errors\n");

} 

void yyerror(char *s, ...)
{
    printf("%s\n", s);
}
