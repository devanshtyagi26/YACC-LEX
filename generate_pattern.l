%{
    #include <stdio.h>
    #include <string.h>
%}

%%

[a-zA-Z0-1]       {
            int len = strlen(yytext);
            for(int i = len; i>0; i--){
                for(int j = 0; j<i; j++){
                    printf("%c", yytext[j]);
                }
                printf("\n");
            }
        }

. | \n          {}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}