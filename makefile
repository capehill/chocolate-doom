# Makefile for AmigaOS 4

HEADERS=../ ../src /SDK/local/newlib/include/SDL2
INCLUDES=$(addprefix -I, $(HEADERS))

DEFINES=

CFLAGS=-O0 -ggdb $(INCLUDES) $(DEFINES) -Wall

export # pass the variables to submakes

chocolate-doom: libs
	echo done

libs:
	make -C textscreen
	make -C pcsound
	make -C opl
	make -C src
	echo libs

clean:
	make -C textscreen clean
	make -C src clean
	make -C pcsound clean
	make -C opl clean
	echo cleaned
