#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int GetTlvValByTag(char *pTlvBuf, char *pTag, char *pVal,int size)
{
	int index = 0;
	int count;
	int length;
	char tag[4] = {0};
	char tmp[4] = {0};
	int ret = -1;
	
	count = strlen(pTlvBuf);

	while(index < count){
		memcpy(tag , pTlvBuf+ index, 3);
		memcpy(tmp , pTlvBuf+ index + 3, 3);
		length = atoi(tmp);
		if(memcmp(pTag, tag, 3) == 0){
			if(length + index + 6 <= count){
				if(size < length) length = size;
				memcpy(pVal, pTlvBuf + index + 6, length);
				ret = length;
				break;
			}
		}

		index += length + 6 ;
	}

	return ret;
}

void test_tlv()
{
	int ret;
	char val[128] = {0};
	
	memset(val,0x00, sizeof(val));
	ret = GetTlvValByTag("5010010", "501", val,sizeof(val));
	printf("%s\n", val);

	memset(val,0x00, sizeof(val));
	ret = GetTlvValByTag("501001050200202", "502", val, sizeof(val));

	printf("%s\n", val);

	memset(val,0x00, sizeof(val));
	ret = GetTlvValByTag("501001050200202", "503", val , sizeof(val));

	printf("%s\n", val);
}


int main()
{
	test_tlv();
	return 0;
}
