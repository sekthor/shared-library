CC=gcc
CFLAGS=-Wall -Werror
LIBDIR=/usr/local/lib

all: libaddition.so

libaddition.so: addition.o
	$(CC) $(CFLAGS) -shared -o $@ $<

addition.o: addition.c
	$(CC) $(CFLAGS) -c -fpic $<

main: main.c
	$(CC) $(CFLAGS) -o $@ main.c -L$(LIBDIR) -laddition

install: libaddition.so
	cp libaddition.so $(LIBDIR)
	export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

uninstall: $(LIBDIR)/libaddition.so
	rm $<

clean:
	rm addition.o \
	libaddition.so \
	main
