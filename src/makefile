# Makefile for AmigaOS 4

HEADERS= $(addprefix -I../, $(HEADER_PATHS))

SRC= $(wildcard *.c)
OBJS= $(SRC:.c=.o)
GAME_OBJS= $(filter-out z_native.o, $(OBJS))

DEHACKED_OBJS= deh_text.o deh_main.o deh_io.o deh_mapping.o
HEXEN_OBJS= $(filter-out $(DEHACKED_OBJS), $(GAME_OBJS))

SETUP_OBJS= deh_str.o d_mode.o d_iwad.o i_main.o i_system.o i_timer.o m_argv.o m_misc.o \
m_config.o m_controls.o net_io.o net_packet.o net_sdl.o net_query.o net_structrw.o z_native.o

LIBS= ../textscreen/libtextscreen.a ../opl/libopl.a ../pcsound/libpcsound.a
EXT_LIBS= -lSDL2_mixer -lSDL2_net -lSMPEG2 -lSDL2 -lvorbisfile -lvorbis -logg -lFLAC -lmikmod -lmodplug -lpthread -lauto

all: libs chocolate-doom chocolate-strife chocolate-heretic chocolate-hexen chocolate-setup

DOOM_LIB= doom/libdoom.a
STRIFE_LIB= strife/libstrife.a
HEXEN_LIB= hexen/libhexen.a
HERETIC_LIB= heretic/libheretic.a
SETUP_LIB= setup/libsetup.a

chocolate-doom: $(GAME_OBJS) $(DOOM_LIB)
	g++ -o $@ $(GAME_OBJS) $(LIBS) $(DOOM_LIB) $(EXT_LIBS)

chocolate-strife: $(GAME_OBJS) $(STRIFE_LIB)
	g++ -o $@ $(GAME_OBJS) $(LIBS) $(STRIFE_LIB) $(EXT_LIBS) 

chocolate-heretic: $(GAME_OBJS) $(HERETIC_LIB)
	g++ -o $@ $(GAME_OBJS) $(LIBS) $(HERETIC_LIB) $(EXT_LIBS)

chocolate-hexen: $(HEXEN_OBJS) $(HEXEN_LIB)
	g++ -o $@ $(HEXEN_OBJS) $(LIBS) $(HEXEN_LIB) $(EXT_LIBS)

chocolate-setup: $(SETUP_OBJS) $(SETUP_LIB)
	g++ -o $@ $(SETUP_OBJS) $(SETUP_LIB) $(LIBS) $(EXT_LIBS)

%.o:%.c
	gcc -o $@ -c $< $(CFLAGS) $(HEADERS)

libs:
	make -C doom
	make -C strife
	make -C hexen
	make -C heretic
	make -C setup

clean:
	delete $(OBJS)
	make -C doom clean
	make -C strife clean
	make -C hexen clean
	make -C heretic clean
	make -C setup clean