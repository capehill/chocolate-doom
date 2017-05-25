# Makefile for AmigaOS 4

HEADER_PATHS= . src textscreen opl pcsound
DEFINES=
CFLAGS= -O3 -ggdb $(DEFINES) -Wall -I/SDK/local/newlib/include/SDL2

export # pass the variables to submakes

chocolate-doom: libs

libs:
	make -C textscreen
	make -C pcsound
	make -C opl
	make -C src

clean:
	make -C textscreen clean
	make -C src clean
	make -C pcsound clean
	make -C opl clean
