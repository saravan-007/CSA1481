%{
#include <stdio.h>
%}

%%

^[0-9]+   { printf("The input '%s' is a digit.\n", yytext); }
.*  { printf("The input '%s' is not a digit.\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}