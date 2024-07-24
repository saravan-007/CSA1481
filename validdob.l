%{
#include <stdio.h>
#include <string.h>

void validate_dob(const char* dob);
void invalid_dob(const char* dob);
%}

%%

(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-([0-9]{4}) {
    validate_dob(yytext);
}
.* {invalid_dob(yytext);}
%%

void validate_dob(const char* dob) {
    printf("Valid DOB: %s\n", dob);
}

void invalid_dob(const char* dob) {
    printf("Invalid DOB: %s\n", dob);
}

int main() {
    yylex();   // Begin the lexical analysis
    return 0;
}

int yywrap() {
    return 1;
}
