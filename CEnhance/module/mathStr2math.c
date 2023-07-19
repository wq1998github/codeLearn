#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>


unsigned char decChar2Number(unsigned char c)
{
	return c - '0';
}


unsigned char hexChar2Number(unsigned char c)
{
	unsigned char ret = 0xff;

	if (c >= 'a' && c <= 'f') {
		ret = c - 'a' + 10;
	}
	else if (c >= 'A' && c <= 'F') {
		ret = c - 'A' + 10;
	}
	else if (c >= '0' && c <= '9') {
		ret = c - '0';
	}

	return ret;
}

//base:10 or 16
//it's unnecessary, hexadecimal character including all of decimal character.
unsigned char char2Number(unsigned char c, int base)
{
	unsigned char ret = 0xff;

	if (base != 10 && base != 16) return ret;

	switch(base)
	{
		case 10:
			ret = decChar2Number(c); break;
		case 16:
			ret = hexChar2Number(c); break;
		default:
			break;
	}
	
	return ret;
}


// gcc  mathStr2math.c -lm -o  mathStr2math1~
// need "-lm" to linking math library
// "233" -> 233    "5f" -> 0x5f
int mathStr2Value(const char *mathStr, int base)
{
	int strLen = strlen(mathStr);
	char curChar = 0;
	int value = 0;

	for(int i = 0; i < strLen; i++) {
		curChar = mathStr[strLen-i-1];
		//printf("%c ", curChar);
		value += char2Number(curChar, base) * pow(base, i);
		//printf("0x%x ", value);
	}
	//printf("\n++ 0x%x ++\n", value);
	return value;
}



int main()
{
	int value = 0;
	value = mathStr2Value("233", 10);
	printf("\n== %d ==\n", value);
	value = mathStr2Value("ef1", 16);
	printf("\n== 0x%x ==\n", value);
	return 0;
}

