#include <stdio.h>
#include <stdlib.h>
#include <string.h>


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
	printf("%d\r\n", isLittleEndian());
	
	return 0;
}

