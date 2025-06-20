/* recognize tokens for the calculator */

%option noyywrap
%{
#include "token.h"

%}

%%

.       { return ERROR; }
%%

int main(int argc, char **argv) {

}


