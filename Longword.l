%{
#include <stdio.h>
#include <string.h>

int max_length = 0;   // To store the length of the longest word
int current_length = 0;  // To store the length of the current word
%}

%%
[A-Za-z]+      { 
                current_length = yyleng;
                if (current_length > max_length) {
                    max_length = current_length;
                }
              }
[^A-Za-z]+     { /* Ignore non-letters */
                current_length = 0;
              }
\n             { /* End of line - reset current length */
                current_length = 0;
              }
%%

int main() {
    yylex();   // Begin the lexical analysis
    printf("The length of the longest word is: %d\n", max_length);
    return 0;
}

int yywrap() {
    return 1;
}
