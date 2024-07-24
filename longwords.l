%{
#include <stdio.h>
#include <string.h>

int max_length = 0;   // To store the length of the longest word
%}

%%
[A-Za-z]+    { 
              int current_length = yyleng;
              if (current_length > max_length) {
                  max_length = current_length;
              }
            }
.|\n         { /* Ignore other characters and newlines */ }
%%

int main() {
    yylex();   // Begin the lexical analysis
    printf("The length of the longest word is: %d\n", max_length);
    return 0;
}

int yywrap() {
    return 1;
}
