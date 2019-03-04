%{
int num_count=0;
int double_count=0;


%}
%% 
[ \t\n]+ {}


242[0-2]\.[0-9]*|24[0-1][0-9]\.[0-9]*|2[0-3][0-9][0-9]\.[0-9]*|1[0-9][0-9][0-9]\.[0-9]*|[1-9][0-9][0-9]\.[0-9]*|[8-9][0-9]\.[0-9]*|7[6-9]\.[0-9]* {printf("double found - %s\n",yytext); double_count++;}
242[0-3]|24[0-1][0-9]|2[0-3][0-9][0-9]|1[0-9][0-9][0-9]|[1-9][0-9][0-9]|[8-9][0-9]|7[6-9] {printf("int found %s\n",yytext); num_count++;}
[0-9]+ {printf("Unexpected character found - %s\n",yytext);}
[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ {printf("Unexpected character found - %s\n",yytext);}
[a-zA-Z]+ {printf("Unexpected character found - %s\n",yytext);}
[\\\+\-\*\<\>\?\:\{\}\(\)\%\^\&\,\"\'\$\#]+  {printf("Unexpected character found - %s\n",yytext);}
 
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


printf("Double count- %d\n", double_count);
printf("Interger count- %d\n", num_count);

}

















