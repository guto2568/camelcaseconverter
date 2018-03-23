#include "ccc_lib.h"
#include <stdio.h>
void camelcase_to_underline(char *input, char *output) {
	//Muda primeiro caractere
	output[0] = input[0] - 'A' + 'a';
	int pos_in = 1;
	int pos_out = 1;
	//Muda resto
	while(input[pos_in] != '\0'){
	  if(input[pos_in] <= 'Z' && input[pos_in] >= 'A'){
	      output[pos_out++] = '_';
	      output[pos_out++] = input[pos_in] - 'A' + 'a';
	  }
	  
	  else
	     output[pos_out++] = input[pos_in];
	  pos_in++;
	}
	output[pos_out] = '\0';
  return;
}

void underline_to_camelcase(char *input, char *output) {
	//Muda primeiro caractere	
	output[0] = input[0] - 'a' + 'A';
	int pos_in = 1;
	int pos_out = 1;
	//Muda resto
	while(input[pos_in] != '\0'){
	  if(input[pos_in] == '_'){
	      output[pos_out++] = input[++pos_in] - 'a' + 'A';
	  }
	  
	  else
	     output[pos_out++] = input[pos_in];
	  pos_in++;
	}
	output[pos_out] = '\0';
  return;
}

