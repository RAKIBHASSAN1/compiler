%{
int ip_count=0;


%}
%% 
[ \t\n]+ {}
^((12[0-6]|1[0-1][0-9]|[1-9][0-9]|[1-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])){3})$ {printf("IP found - %s\n",yytext); ip_count++;}
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

printf("IP count- %d\n", ip_count);

}

















