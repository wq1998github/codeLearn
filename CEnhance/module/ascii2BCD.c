#include <stdio.h>
#include <string.h>
#include <stdlib.h>


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

//"1234567890" -> { 0x12, 0x34, 0x56, 0x78, 0x90 }
void ascii2CompressBCD(unsigned char* ascStr, unsigned char *bcdBuf, int bcdBufSize)
{
	int ascStrLen = strlen((char *)ascStr);
	
	memset(bcdBuf, 0x00, bcdBufSize);
	
	for (int i = 0; i < ascStrLen; i += 2) {
		bcdBuf[i/2] = (char2Number(ascStr[i], 16) << 4) | \
					  (char2Number(ascStr[i+1], 16) & 0x0f);
	}

	for (int i = 0; i < ascStrLen / 2; i++) {
		printf("0x%02x ", bcdBuf[i]);
	}
	printf("\n");
}


void compressBCD2ascii(unsigned char *bcdArr, int arrSize, unsigned char *strBuf)
{
	int i = 0;
	unsigned char *pStrBuf = strBuf;

	for(i = 0; i < arrSize; i++) {
		sprintf((char *)pStrBuf++, "%x", bcdArr[i] >> 4);
		sprintf((char *)pStrBuf++, "%x", bcdArr[i] & 0x0f);
	}

	printf("\n--- bcd2Ascii: %s ---\n", strBuf);
}



int main()
{
	unsigned char ascStr[100] = {"12345678900987654321abcdef"};
	unsigned char bcd[100] = {0x00};
	unsigned char outBuf[100] = {0x00};

	ascii2CompressBCD(ascStr, bcd, 100);
	compressBCD2ascii(bcd, 13, outBuf);
	return 0;
}



