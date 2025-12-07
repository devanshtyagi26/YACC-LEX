%{
#include <stdio.h>
#include <string.h>

char longest_word[1024] = "";  /* store the longest word */
int max_length = 0;
%}

%%
[A-Za-z]+  {
              int len = yyleng;          /* length of the matched word */
              if (len > max_length) {
                  max_length = len;
                  /* Copy the current word into longest_word */
                  if (len < sizeof(longest_word))
                      strncpy(longest_word, yytext, len);
                  longest_word[len] = '\0';
              }
           }

/* All other characters (spaces, punctuation, digits, newline, etc.) are ignored */
.|\n       { /* skip */ }
%%

int main()
{
    yylex();

    if (max_length > 0) {
        printf("Longest word: %s\n", longest_word);
        printf("Length: %d\n", max_length);
    } else {
        printf("No words found in input.\n");
    }
    return 0;
}

int yywrap()
{
    return 1;
}
