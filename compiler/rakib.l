%{
int num_count=0;
int vowel_count=0;
int double_count=0;
int char_count=0;

%}
%% 
[ \t\n]+ {}
([0-9]+\.[0-9]+) {printf("double found - %s\n",yytext); double_count++;}

[0-9]+ {printf("interger found - %s\n",yytext); num_count++;}

([aeiou][a-z]+) {printf("vowel found - %s\n",yytext); vowel_count++;}

[a-z][a-z]+ {printf("chracter found - %s\n",yytext); char_count++;}

. {printf("unexpected chracter\n");}
%%
int main(){

FILE *file;
file=fopen("code.c","r");
if(!file)
{printf("cann't open file");
exit(1);
}

else {
yyin=file;
}
yylex();

printf("Vowel count- %d\n", vowel_count);
printf("Chracter count- %d\n", char_count);
printf("Double count- %d\n", double_count);
printf("Interger count- %d\n", num_count);

}

















