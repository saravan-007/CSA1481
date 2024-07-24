%{ 
#include<stdio.h>
#include<string.h>
int max=0;
int c=0;
%}
%% 
[\t\n]+ {
	 if(c>max){
		max=c;
	 }
	 c=0;
        }
[a-zA-Z]+ {
		c+=yyleng;
	  }
. 	  {
		c=0;
	  }
%%
int main() {
	yylex();
	if(c>max){
		max=c;
	}
	printf("Length: %d\n",max);
	return 0;
}
int yywrap(){
	return 1;
}