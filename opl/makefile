# Makefile for AmigaOS 4

HEADERS= $(addprefix -I../, $(HEADER_PATHS))
SRC= $(wildcard *.c)
OBJS= $(SRC:.c=.o)

libopl.a: $(OBJS)
	ar ru $@ $(OBJS)
	ranlib $@

%.o:%.c
	gcc -o $@ -c $< $(CFLAGS) $(HEADERS)

clean:
	delete $(OBJS)

