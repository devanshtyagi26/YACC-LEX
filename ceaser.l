%{
#include <stdio.h>
%}

%%
[A-Z]  {
            /* Uppercase shift */
            char c = yytext[0];
            c = ((c - 'A' + 3) % 26) + 'A';
            printf("%c", c);
       }

[a-z]  {
            /* Lowercase shift */
            char c = yytext[0];
            c = ((c - 'a' + 3) % 26) + 'a';
            printf("%c", c);
       }


.      {
            printf("%s", yytext);
       }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
