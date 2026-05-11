#include <stdio.h>
#include <stdlib.h>
#include "token.h"

extern int yyparse();
extern int parser_result;

int main()
{
   if (yyparse() == 0)
      printf("%d\n",parser_result);

} 

void yyerror(char *s, ...)
{
    printf("%s\n", s);
}
