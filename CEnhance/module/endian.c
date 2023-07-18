#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define APP_VER_BASE "Q@#%Q@#%READER-V1.07"
#define APP_VER APP_VER_BASE".EN"


static int isLittleEndian()
{
	unsigned int value = 0x01020304;
	char *pValue = (char *)&value;
	int ret = -1;
	
	if (*pValue == 0x01) {
		ret = 1;
	}
	else if (*pValue == 0x04)
	{
		ret = 2;
	}
	

	for (int i = 0; i < 4; i++) {
		printf("%02x ", *pValue);
		pValue++;
	}
	
	printf("\r\n");

	return ret;
}



int main()
{
	//printf("%s\r\n", APP_VER);
	//printf("%s\r\n", "ss""dd""ee");
	
	printf("%d\r\n", isLittleEndian());
	
	return 0;
}




int main1()
{
	char* cc = (char*)malloc(100);
	memcpy(cc, "hello world", strlen("hello world"));
	//char* str = "hello world";
	char* str = cc;
	free(str);
	printf("hello\n");
	return 0;
}

