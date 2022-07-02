%option noyywrap

%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>

%}


letra [a-z]|[A-Z]
espacio [" "]
espacios_blanco [ \t \n]+
letra_digito [a-zA-Z0-9_/()=$!'&|°\-+*\{\}\[\].:,;\~\^]
digito [0-9]
decimal [1-9][digito]*
octal 0[0-7]*
hexadecimal 0[xX][0-9a-fA-F]+ 
entero {digito}+
real {entero}\.{digito}*
cadena ("[letra_digito]*")
identificador [a-zA-Z_][_a-zA-Z0-9]*
caracteres_especiales	","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$"
operador_relacional	\<|\>|"<="|">="|"=="|"!="|"&&"|"||"
palabra_reservada	"void"|"int"|"float"|"char"|"string"|"if"|"else"|"while"|"do"|"return"

%x COMMENT
%x COMMENT_LINES

%%

"/*"  BEGIN(COMMENT); 
"*/"  BEGIN(INITIAL); 
<COMMENT>. { }

"'''" { BEGIN(COMMENT_LINES); }
<COMMENT_LINES>"'''"  { BEGIN(INITIAL); }
<COMMENT_LINES>\n { }
<COMMENT_LINES>. { }


{operador_relacional} {printf("Patron Valido. %s\n",yytext);}
"  "     {}
.        {printf("Error NO valido.");}

%%

void main(){
    yylex();
}




