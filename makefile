CC=gcc
CFLAGS=-z execstack -ggdb -mpreferred-stack-boundary=2 -Os -fomit-frame-pointer -fno-PIC -fno-stack-protector

all: code exploit

code: exploit-codi2.c
	$(CC) $(CFLAGS) -o $@ $^

exploit: my_exploit.c
	$(CC) -pedantic -Wall -o $@ $^

install: all
	chown root code
	chmod u+s code

clean:
	rm -rf exploit code
