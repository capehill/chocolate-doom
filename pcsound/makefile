# Makefile for AmigaOS 4

SRC=$(wildcard *.c)
OBJS= $(SRC:.c=.o)

libpcsound.a: $(OBJS)
	ar ru $@ $(OBJS)
	ranlib $@
	echo done

%.o:%.c
	gcc -o $@ -c $< $(CFLAGS)

clean:
	delete $(OBJS)
	echo cleaned
