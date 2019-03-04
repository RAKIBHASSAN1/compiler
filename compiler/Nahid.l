%{
int num_count=0;



%}
%% 
[ \t\n]+ {}

^(\#A[E-F][E-F][A-F](9|[A-F])([4-9]|[A-F])|\#B([0-9][A-F])[0-3]([0-9]|[A-F]){3})$ {printf("color found - %s\n",yytext); num_count++;}
\#[a-zA-Z0-9]+ {printf("Unexpected character found - %s\n",yytext);}
[0-9]+\.[0-9]+  {printf("Unexpected character found - %s\n",yytext);}
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


printf("color count- %d\n", num_count);

}

















