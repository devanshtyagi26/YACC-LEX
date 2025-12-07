%{
    int char_count = 0;
    int line_count = 0;
%}
    
%%

\n      { line_count++; char_count++; }    // Newline is both a character and a new line
.       { char_count++; }                  // Any other character increments character count

%%
    
int main()
{
    yylex();
    printf("Total Characters: %d\n", char_count);
    printf("Total Lines: %d\n", line_count);
    return 0;
}
    
int yywrap()
{
    return 1;
}

// For Output:
// lex count_lines_char.l
// gcc lex.yy.c -o count_lines_char.out
// ./count_lines_char < input.txt