%{
#include <stdio.h>
#include <string.h>
%}

%%
"foo" { printf("bar"); }

.|\n { putchar(yytext[0]); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
