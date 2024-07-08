%{
	#include <stdlib.h>
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
	extern FILE *yyin,*yyout,*lexout;
%}

%token RELATIONAL_OPERATOR BOOLEAN
%token ID NUMBER STRING
%token DATA_TYPE
%token WHILE IF ELSE RETURN

%%

program:
		global_stmts
		;
global_stmts:
		global_stmt global_stmts
		|
		;
global_stmt:
		DATA_TYPE ID ';'						{ fprintf(yyout,"global variable declaration\n"); }
		| DATA_TYPE ID '=' simple_stmt ';'				{ fprintf(yyout,"global variable definition\n"); }
		| DATA_TYPE ID '(' function_args ')' '{' local_stmts '}' 	{ fprintf(yyout,"Function Definition\n"); }
		| DATA_TYPE ID '(' function_args ')' ';'			{ fprintf(yyout,"Function Declaration\n"); }
		;
local_stmts:
		local_stmt local_stmts
		|
		;
		
local_stmt:
		DATA_TYPE ID ';'		{ fprintf(yyout,"Variable Defined\n"); }
		| DATA_TYPE ID '=' simple_stmt ';'	{ fprintf(yyout,"Variable Defined with Initialisation\n"); }
		| ID '(' pass_args ')' ';'	{ fprintf(yyout,"Function Called\n"); }
		| simple_stmt ';'
		| WHILE '(' simple_stmt ')' '{' local_stmts '}'				{ fprintf(yyout,"While Loop\n"); }
		| if_stmt
		| RETURN simple_stmt ';'						{ fprintf(yyout,"Return Statement\n"); }
		| RETURN ';'								{ fprintf(yyout,"Return Statement\n"); }
		| ';'	
		;
		
if_stmt:	
		IF '(' simple_stmt ')' '{' local_stmts '}' ELSE if_stmt			{ fprintf(yyout,"If Else If Statement\n"); }
		| IF '(' simple_stmt ')' '{' local_stmts '}' ELSE '{' local_stmts '}' 	{ fprintf(yyout, "If Else Statement\n"); }
	 	| IF '(' simple_stmt ')' '{' local_stmts '}'				{ fprintf(yyout,"If Statement\n"); }
	 	;
simple_stmt:		
		ID '=' expr			{ fprintf(yyout,"Variable Initialised\n"); }
		| relational_stmt
		;
relational_stmt:
		expr
		| relational_stmt RELATIONAL_OPERATOR expr	{ fprintf(yyout,"Comparison Operation\n"); }
		;
expr:		
		fact
		| expr '+' fact			{ fprintf(yyout,"Addition Operation\n"); }
		| expr '-' fact			{ fprintf(yyout,"Subtraction Operation\n"); }
		;
fact:
		fact '*' term			{ fprintf(yyout,"Multiplication Operation\n"); }
		| fact '/' term			{ fprintf(yyout,"Division Operation\n"); }
		| boolean_expr			
		;
boolean_expr:	
		boolean_expr BOOLEAN term	{ fprintf(yyout,"Boolean/Bitwise Operation\n"); }
		| term
		;
term:
		ID
		| NUMBER
		| ID '[' expr ']'
		| '(' simple_stmt ')'
		;

function_args:
		DATA_TYPE ID ',' function_args
		| DATA_TYPE ID '[' ']' ',' function_args
		| DATA_TYPE ID
		| DATA_TYPE ID '[' ']'
		| 
		;

pass_args:	
		simple_stmt ',' pass_args
		| simple_stmt
		| STRING ',' pass_args
		| STRING
		| 
		;

%%


int main(int argc, char * argv[]){
	FILE * input = fopen(argv[1], "r");
	lexout = fopen("Lexer.txt", "w");
	yyout = fopen("Parser.txt", "w");
	if(input == 0){
		printf("File could not be opened, please check input file path.\n");
		return 1;
	}

	yyin = input;
	yyparse();
	fclose(input);
	return 0;
}
