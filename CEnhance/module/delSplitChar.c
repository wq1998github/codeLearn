#include <stdio.h>
#include <string.h> //strtok
#include <stdlib.h>

// need copy a backup buffer to avoid modifying source string
// then, it will unmatch when compare writeMac with readMac
void delSplitChar(char *srcStr, const char *splitChar, char *outBuff, int outBuffSize)
{
	char *pSubStr = NULL;
	int srcStrLen = strlen(srcStr) + 1;
	char *pCopyStr = NULL; 

	if (srcStr == NULL || strlen(srcStr) == 0 || outBuffSize == 0) {
		return;
	}

	pCopyStr = (char *)malloc(srcStrLen); 
	memset(pCopyStr, 0x00, srcStrLen);
	memcpy(pCopyStr, srcStr, srcStrLen);

	memset(outBuff, 0x00, outBuffSize);
	
	pSubStr = strtok(pCopyStr, splitChar);
	while(pSubStr) {
		//printf("%s\n", pSubStr);
		memcpy(outBuff, pSubStr, strlen(pSubStr));
		outBuff += strlen(pSubStr);
		pSubStr = strtok(NULL, splitChar);
	}

	//printf("++ %s ++\n", srcStr);
	//printf("-- %s --\n", pCopyStr);
	free(pCopyStr);
	pCopyStr = NULL;
}

void splitString(char *buffer, const char *split, char *macBuf, int macLen)
{
	char *tmp = NULL;
	int i = 0;
	int buffLen =  strlen(buffer) + 1;
	char buff[buffLen];

	memset(buff, 0x00, buffLen);
	memcpy(buff, buffer, buffLen);
	memset(macBuf, 0x00, macLen);
	
	tmp = strtok(buff, split);
	while(tmp)
	{
		printf("%d, %s\n", ++i, tmp);
		memcpy(macBuf, tmp, strlen(tmp));
		macBuf += strlen(macBuf);
		tmp = strtok(NULL, split);
	}
}

int main()
{
	char *string = "hello@boy@this@is@heima";
	char mac[100] = {0x00};

	char *szData = (char *)malloc(1024);//dynamic array
	memset(szData, 0x00, 1024);
	memcpy(szData, string, strlen(string));//copy string to szData

	// helloboythisisheima
	//splitString(szData, "@", mac, sizeof(mac));
	//printf("%s\n", mac);

	//020304050607
	string = "02-03-04-05-06-07";
	memset(szData, 0x00, 1024);
	memcpy(szData, string, strlen(string));//copy string to szData
	delSplitChar(szData, "-", mac, sizeof(mac));
	printf("%s\n", mac);

	free(szData);
	szData = NULL;
	return 0;
}











