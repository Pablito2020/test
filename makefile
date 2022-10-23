CC=gcc
CFLAGS=-z execstack -ggdb -mpreferred-stack-boundary=2 -fno-stack-protector

all: code exploit

code: exploit-codi2.c
	$(CC) $(CFLAGS) -o $@ $^

exploit: exploit.c
	$(CC) -o $@ $^

install: all
	chown root code
	chmod u+s code

clean:
	rm -rf exploit code