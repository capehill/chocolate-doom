# Makefile for AmigaOS 4

SRC= $(wildcard *.c)
OBJS= $(SRC:.c=.o)

LIBS= ../textscreen/libtextscreen.a ../opl/libopl.a ../pcsound/libpcsound.a doom/libdoom.a
EXT_LIBS= -lSDL2_mixer -lSDL2_net -lSMPEG2 -lSDL2 -lvorbisfile -lvorbis -logg -lFLAC -lmikmod -lmodplug -lpthread -lauto

chocolate-doom: $(OBJS) libs
	g++ -o $@ $(OBJS) $(LIBS) $(EXT_LIBS)
	echo done

%.o:%.c
	gcc -o $@ -c $< $(CFLAGS)

libs:
	make -C doom

clean:
	delete $(OBJS)
	make -C doom clean
	echo cleaned
