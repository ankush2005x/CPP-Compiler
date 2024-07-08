%{
	#include <stdlib.h>
	#include "cucu.tab.h"		// later change to cucu_ya.tab.h
	int yyerror(char *, char *);
	FILE *lexout;
%}


%%
\/\*([^*]|(\*[^/]))*\*\/ 	{ fprintf(lexout, "COMMENTED : %s\n", yytext); }	// does non-greedy comment matching!
\/\/([^\n])*			{ fprintf(lexout, "COMMENTED : %s\n", yytext); }
(\')([^'])*(\')			{ fprintf(lexout, "STRING : %s\n", yytext); return STRING; }		// does non-greedy string matching!
(\")([^"])*(\")			{ fprintf(lexout, "STRING : %s\n", yytext); return STRING; }		// does non-greedy string matching!

int				{ fprintf(lexout, "TYPE: int\n"); return DATA_TYPE; }
char(\ )?\*(\ )?\*		{ fprintf(lexout, "TYPE: char **\n"); return DATA_TYPE; }
char(\ )?\*			{ fprintf(lexout, "TYPE: char *\n"); return DATA_TYPE; }
while				{ fprintf (lexout,"WHILE : while\n"); return WHILE; }
if				{ fprintf (lexout,"IF : if\n"); return IF; }
else				{ fprintf (lexout,"ELSE : else\n"); return ELSE; }
return				{ fprintf (lexout, "RETURN : return\n"); return RETURN; }

,				{ fprintf (lexout, "COMMA : ,\n"); return *yytext; }
;				{ fprintf (lexout, "SEMI : ;\n"); return *yytext; }

[\+\-\/\*]			{ fprintf(lexout, "ARITHMETIC OPERATOR : %s\n", yytext); return *yytext; }

\{				{ fprintf(lexout, "OPEN BRACE : %s\n", yytext); return *yytext; }
\}				{ fprintf(lexout, "CLOSE BRACE : %s\n", yytext); return *yytext; }
\(				{ fprintf(lexout, "OPEN PARENTHESIS : %s\n", yytext); return *yytext; }
\)				{ fprintf(lexout, "CLOSE PARENTHESIS : %s\n", yytext); return *yytext; }
\[				{ fprintf(lexout, "OPEN SQUARE BRACKET : %s\n", yytext); return *yytext; }
\]				{ fprintf(lexout, "CLOSE SQUARE BRACKET : %s\n", yytext); return *yytext; }

(==)|(!=)|(>=)|(>)|(<=)|(<)	{ fprintf (lexout, "RELATIONAL OPERATOR : %s\n", yytext); return RELATIONAL_OPERATOR; }	
=				{ fprintf (lexout, "ASSIGN : %s\n", yytext); return *yytext; } 

[a-zA-Z][a-zA-Z0-9_]*		{ fprintf (lexout, "ID : %s\n", yytext); return ID; }

[\|\&]				{ fprintf (lexout, "BOOLEAN : %s\n", yytext); return BOOLEAN; }

[0-9]+(\.[0-9]+)?		{ fprintf(lexout, "NUMBER : %s\n", yytext); return NUMBER; }
[ \t\n\r]			// do nothing	{ printf("%s\n", yytext); }

.				{ return yyerror("Invalid Character in Input", yytext); }

%%

int yyerror(char *error, char *errorString){
	fprintf(lexout, "%s : %s\n", error, errorString);
	return YYerror;
}

int yywrap(){
	return 1;
}



