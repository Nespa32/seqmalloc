#
# Copyright (C) 2019 Ricardo Leite. All rights reserved.
# Licenced under the MIT licence. See COPYING file in the project root for details.
#

CC=gcc
DFLAGS=-ggdb -g -fno-omit-frame-pointer
CFLAGS=-shared -fPIC -std=gnu11 -O2 -Wall $(DFLAGS)
LDFLAGS=-ldl -pthread $(DFLAGS)

default: seqmalloc.so seqmalloc.a

seqmalloc.so: seqmalloc.c
	$(CC) $(LDFLAGS) $(CFLAGS) -o seqmalloc.so seqmalloc.c

seqmalloc.a: seqmalloc.o
	ar rcs seqmalloc.a seqmalloc.o

seqmalloc.o: seqmalloc.c
	$(CC) $(LDFLAGS) $(CFLAGS) -c -o seqmalloc.o seqmalloc.c

clean:
	rm -f *.so *.o *.a
