
/* mywc */

%option noyywrap nodefault yylineno

%{
        int chars = 0;
        int words = 0;
        int lines = 0;
%}

%%
[a-zA-Z]+       { words++; chars+=strlen(yytext); }
\n              { lines++; chars++; }
.               { chars++; }
%%

int main(int argc, char **argv) {
        yylex();
        printf("chars: %8d\nwords: %8d\nlines: %8d\n", chars, words, lines);
}
