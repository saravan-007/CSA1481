%{
#include <stdio.h>
%}

%%
"http://"[a-zA-Z0-9.-]+"."[a-zA-Z]+  {
    printf("Valid URL: %s\n", yytext);
}
.|\n {
    // Ignore other characters and new lines
}

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
