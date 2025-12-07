%{
    int count_vowel = 0;
    int count_consonant = 0;
%}

%%
[aeiouAEIOU]         {count_vowel++;}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]        {count_consonant++;}
.                    {;}
%%

int main()
{
    yylex();
    printf("Total Vowels: %d\n", count_vowel);
    printf("Total Consonants: %d\n", count_consonant);
    return 0;
}

int yywrap()
{
    return 1;
}