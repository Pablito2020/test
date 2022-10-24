CC=gcc
# from g3 to down added for testing
CFLAGS=-z execstack -ggdb -mpreferred-stack-boundary=2 -Os -fomit-frame-pointer -fno-PIC -fno-stack-protector -g3 -gdwarf-2 -fvar-tracking -fvar-tracking-assignments

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
