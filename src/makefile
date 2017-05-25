# Makefile for AmigaOS 4

HEADERS= $(addprefix -I../, $(HEADER_PATHS))

SRC= $(wildcard *.c)
OBJS= $(SRC:.c=.o)

DEHACKED_OBJS= deh_text.o deh_main.o deh_io.o deh_mapping.o
HEXEN_OBJS= $(filter-out $(DEHACKED_OBJS), $(OBJS))

LIBS= ../textscreen/libtextscreen.a ../opl/libopl.a ../pcsound/libpcsound.a
EXT_LIBS= -lSDL2_mixer -lSDL2_net -lSMPEG2 -lSDL2 -lvorbisfile -lvorbis -logg -lFLAC -lmikmod -lmodplug -lpthread -lauto

all: libs chocolate-doom chocolate-strife chocolate-heretic chocolate-hexen

DOOM_LIB= doom/libdoom.a
STRIFE_LIB= strife/libstrife.a
HEXEN_LIB= hexen/libhexen.a
HERETIC_LIB= heretic/libheretic.a

chocolate-doom: $(OBJS) $(DOOM_LIB)
	g++ -o $@ $(OBJS) $(LIBS) $(DOOM_LIB) $(EXT_LIBS)

chocolate-strife: $(OBJS) $(STRIFE_LIB)
	g++ -o $@ $(OBJS) $(LIBS) $(STRIFE_LIB) $(EXT_LIBS) 

chocolate-heretic: $(OBJS) $(HERETIC_LIB)
	g++ -o $@ $(OBJS) $(LIBS) $(HERETIC_LIB) $(EXT_LIBS)

chocolate-hexen: $(HEXEN_OBJS) $(HEXEN_LIB)
	g++ -o $@ $(HEXEN_OBJS) $(LIBS) $(HEXEN_LIB) $(EXT_LIBS)

%.o:%.c
	gcc -o $@ -c $< $(CFLAGS) $(HEADERS)

libs:
	make -C doom
	make -C strife
	make -C hexen
	make -C heretic

clean:
	delete $(OBJS)
	make -C doom clean
	make -C strife clean
	make -C hexen clean
	make -C heretic clean
