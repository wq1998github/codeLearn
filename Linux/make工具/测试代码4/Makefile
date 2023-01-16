############################## 定义变量 ##############################
TARGET = main.out
SOURCE = main.c test.c foo.c
## 使用交叉编译的时候打开下面的注释
# CROSS_COMPILER = arm-linux- # 定义交叉编译器
CC = $(CROSS_COMPILER)gcc # 定义使用的编译器

## 找到头文件的位置
CUR_DIR = $(shell pwd)
HEAD_DIR = $(CUR_DIR)/inc

## 定义 $(CC) 的编译选项
CCFLAGS = -I $(HEAD_DIR)

## $(SOURCE:.c=.o)表示的是SOURCE中所有的 .c 文件生成的 .o 文件
$(TARGET): $(SOURCE:.c=.o)
	$(CC) $^ $(CCFLAGS) -o $@

## 模式规则：%会匹配 .c 文件前面的部分
%.o: %.c
	$(CC) $< $(CCFLAGS) -c

## 下面的规则用来说明头文件的更新，使得所有依赖它的文件被重新生成
## 这里的 .d 文件是随意指定的，表示用 .c 文件生成对应的 .d 文件
## "> $@" 表示将 $(CC) -MM $< 执行的结果重定向到 $@ 中，$@ 是对应的 .d 文件
%.d: %.c
	$(CC) -MM $(CCFLAGS) $< > $@

## 下面的命令用来告诉make，将上面的模式规则中的命令执行结果包含进当前文件
#include $(SOURCE:.c=.d)
#-include $(SOURCE:.c=.d)
include $(SOURCE:.c=.d) # 这三行命令作用一样，推荐使用这种
## 这里的include会展开成,这些展开的内容变成新的规则
## foo.o: foo.c
## test.o: test.c
## main.o: main.c .inc/all.h

## 清理中间文件和最终文件
clean:
	rm -vf $(TARGET) $(SOURCE:.c=.o) $(SOURCE:.c=.d)

## PHONY 后面的东西会被声明成伪目标
## 伪目标：不是真正的目标，仅仅是为了执行其所在规则下面的命令，不应该让make来判断它是否存在，或者应该被生成
## 一般将伪目标叫做标签，真正生成东西的叫目标
.PHONY:clean