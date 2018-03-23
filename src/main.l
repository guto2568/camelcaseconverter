%{
#include <stdio.h>

#include "ccc_lib.h"
int erro = 0;
char saida[100];
int pos_saida = 0;
%}


%%

[A-Z]([a-z]*[A-Z][a-z]*)+([a-z]+[_][a-z]*)+ {
	//Camel Case seguida de Underline
	erro = 1;
}

([a-z]+[_][a-z]*)+[A-Z]([a-z]*[A-Z][a-z]*)+ {
	//Underline seguida de CamelCase
	erro = 1;
}

[A-Z]([a-z]*[A-Z][a-z]*)+ {
	//CamelCase
	camelcase_to_underline(yytext, saida + (pos_saida));
	
	while(saida[pos_saida] != '\0')
	  pos_saida++;
}

([a-z]+[_][a-z]*)+ {
	//Underline
	underline_to_camelcase(yytext, saida + (pos_saida));
	while(saida[pos_saida] != '\0')
	  pos_saida++;
}

[:spaces:\n] {
	//Espaços e quebras de linha
	saida[pos_saida++] = yytext[0];
	saida[pos_saida] = '\0';
} 

. {	
	//Resto dos caracteres;
	saida[pos_saida++] = yytext[0];
	saida[pos_saida] = '\0';
} 




%%

int main() {
  yylex();
  if(erro)
    printf("ERRO\n");
  else
    printf("%s", saida);
  return 0;
}

/**/