ifeq ($(OS),Windows_NT)
    uname_S := Windows
else
    uname_S := $(shell uname -s)
endif
ifeq ($(uname_S),Linux)
    CFLAGS = -Wall -DLINUX 
    LDLIBS = -levent -L/home/isodden/work/libevent/.libs
endif
ifeq ($(uname_S),Darwin)
    CFLAGS = -Wall -DMACOSX
    LDLIBS = -levent -L/Users/shanshan/work/libevent/.libs
endif


iterative: 01_iterative/main.c
		gcc -o $@ ${CFLAGS} $<

forking: 02_forking/main.c
		gcc -o $@ $<

preforked: 03_preforked/main.c
		gcc -o $@ $<

threaded: 04_threaded/main.c
		gcc -o $@ $< -lpthread

prethreaded: 05_prethreaded/main.c
		gcc -o $@ $< -lpthread

poll: 06_poll/main.c
		gcc -o $@ $<

epoll: 07_epoll/main.c
		gcc -o $@ $<

all: iterative forking preforked threaded prethreaded poll epoll

.PHONY: clean

clean:
	rm -f iterative forking preforked threaded prethreaded poll epoll
