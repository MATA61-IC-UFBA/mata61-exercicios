#include <stdio.h>
#include <stdlib.h>
#include "token.h"
#include "decl.h"
#include "typecheck.h" 
#include "hash_table.h"

extern int yyparse();
extern struct program* parser_result;
struct hash_table *ts; 

int main() {

   if (!yyparse()) {
      ts = hash_table_create(0,0);
      int n_errors = semantic_check(parser_result);
      fprintf(stdout,"%d semantic error(s)\n", n_errors);
      fprintf(stderr,">>> %d semantic error(s)\n", n_errors);
    }
    else
      fprintf(stdout,"syntax error\n");

    exit(0);
}

void yyerror(char *s, ...)
{
    fprintf(stderr,"%s\n", s);
}

