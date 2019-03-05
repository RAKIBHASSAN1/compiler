%{
int counter=0;
%}
%%
[ \t\n]+ {}
((for(\ |\n)*\(([^\;]*\;){2}[^\;]*\)(\ |\n)*\{([^\}]*\;)*(\ |\n)*\})|(for(\ |\n)*\(([^\;]*\;){2}[^\;]*\)(\ |\n)*[^\{\;]*\;)) {printf("for block found:\n%s\n",yytext);counter++;}
. {}
%%
int main()
{
	FILE *file;
	file=fopen("forLoopCode.c","r");
	
	if(!file)
	{
		printf("Cannot Open file\n");
		exit(1);
	}
	else
		yyin=file;
		
	yylex();
	
	printf("Total for block count: %d\n",counter);
}
