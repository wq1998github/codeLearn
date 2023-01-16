########## 定义变量 ##########
TARGET = main.out
SOURCE = main.c test.c
#OBJECT = main.o test.o
CC = gcc # 定义使用的编译器

## 使用特殊变量 $@ 和 $^ 来代替 $(TARGET) 和 $(OBJECT)
#$(TARGET):$(OBJECT)
#	$(CC) $^ -o $@

## $(SOURCE:.c=.o)表示的是SOURCE中所有的 .c 文件生成的 .o 文件
$(TARGET):$(SOURCE:.c=.o)
	$(CC) $^ -o $@


## 模式规则：%会匹配 .c 文件前面的部分
## 模式规则执行时，是一个循环取出的过程，每次取出一个 .c ，调用下面的command，直到取出所有的 .c 文件
%.o:%.c
	$(CC) $< -c

clean:
#	rm -f $(TARGET) $(OBJECT)
	rm -f $(TARGET) $(SOURCE:.c=.o)