/* mywc.l */ 

%option noyywrap nodefault yylineno

%{
%}

%%



%%

int main(int argc, char **argv)
{
   if(argc > 1) {
      if(!(yyin = fopen(argv[1], "r"))) {
         printf("error\n");
         return (1);
       }
   }
   yylex();
   printf("%8d%8d%8d %s\n", lines, words, chars, argv[1]);
}

