########## 定义变量 ##########

TARGET = main.out
TARGET1 = a.out
SOURCE = main.c test.c

## 可以这么写，但是重复使用了$(TARGET1)和$(SOURCE)变量
$(TARGET1):$(SOURCE)
	gcc $(SOURCE) -o $(TARGET1)

## 简化的写法，使用特殊变量 $@ 和 $^ 来代替$(TARGET1)和$(SOURCE)
$(TARGET):$(SOURCE)
	gcc $^ -o $@

## clean只是一个标签，类似的还有install，都是约定俗成的定义
## clean一般用于删除生成的中间文件和最终的可执行文件
clean:
	rm -f *.out
