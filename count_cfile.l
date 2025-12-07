%{
    int words = 0;
    int characters = 0;
    int spaces = 0;
    int lines = 0;
%}

%%

\n          {
                lines++;
                characters++;
            }

" "         {
                spaces++;
                characters++;
            }

\t          {characters++;}  

[a-zA-Z0-9_]+   {
                    words++;
                    characters+= yyleng;
                }

.           {characters++;}

%%

int main(){
    yylex();
    printf("Total Spaces: %d\n", spaces);
    printf("Total Lines: %d\n", lines);
    printf("Total Words: %d\n", words);
    printf("Total Characters: %d\n", characters);
    return 0;
}

int yywrap(){
    return 1;
}