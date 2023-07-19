#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//unsigned char hexArr[100] = {0x22, 0x33, 0x51, 0x15, 0x66, 0xee, 0xff, 0x01, 0x02, 0x00};
//hexArr -> 2233511566eeff010200
void hexArr2Str(unsigned char *hexArr, int arrSize, unsigned char *strBuf)
{
	int i = 0;
	unsigned char *pStrBuf = strBuf;

	for(i = 0; i < arrSize; i++) {
		sprintf((char *)pStrBuf++, "%x", hexArr[i] >> 4);
		sprintf((char *)pStrBuf++, "%x", hexArr[i] & 0x0f);
	}

	//printf("\n=== hexArr2AscStr: %s ===\n", strBuf);
}

//"1234" -> 31323334
void ascii2AscStr(unsigned char *asc, unsigned char *outBuf)
{
	unsigned int ascLen = strlen(asc);//(strlen(ascStr) + 1) & 0xfffffffe;
	int i;
	for(i = 0; i < ascLen; i++) {
		sprintf(outBuf + i*2, "%02X", asc[i]);
	}
	//printf("== %s ==\n", asc);
}

//"313233343536373839414243444546" -> "123456789ABCDEF"
void ascStr2Ascii(unsigned char *ascStr, unsigned char *outBuf)
{
	unsigned int ascStrLen = strlen(ascStr);//(strlen(ascStr) + 1) & 0xfffffffe;
	int i = 0;
	
	//length must be even
	if (ascStrLen % 2) {
		return;
	}

	for(i = 0; i < ascStrLen; i+=2) {
		outBuf[i/2] = ((ascStr[i] - '0') << 4) | ((ascStr[i+1] - '0') & 0x0F);
	}

	//printf("=== ascStr2Ascii: %s ===\n", outBuf);
}


int main()
{
	unsigned char hexArr[100] = {0x22, 0x33, 0x51, 0x15, 0x66, 0xee, 0xff, 0x01, 0x02, 0x00};
	unsigned char ascStr[100] = {"313233343536373839414243444546"};
	unsigned char buffer[200] = {0x00};

	memset(buffer, 0x00, sizeof(buffer));
	hexArr2Str(hexArr, /*sizeof(hexArr)*/10, buffer);
	printf("\n---- hexArr2Str: %s ----\n", buffer);
	
	memset(buffer, 0x00, sizeof(buffer));
	ascStr2Ascii(ascStr, buffer);
	printf("\n---- ascStr2Ascii: %s ----\n", buffer);
	
	memset(ascStr, 0x00, sizeof(ascStr));
	ascii2AscStr(buffer, ascStr);
	printf("\n---- ascii2AscStr: %s ----\n", ascStr);
		

	return 0;
}



