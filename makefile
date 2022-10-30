CC=gcc
CFLAGS=-z execstack -ggdb -mpreferred-stack-boundary=2 -fomit-frame-pointer -fno-stack-protector -g3 -gdwarf-2 -fvar-tracking -fvar-tracking-assignments -Os
INFO_FLAGS=-pedantic -Wall 
BINARIES=./bin/
SOURCE=./src/

all: code payload_generator

code: $(SOURCE)code.c
	$(CC) $(CFLAGS) -o $(BINARIES)$@ $^

payload_generator: $(SOURCE)payload_generator.c
	$(CC) $(INFO_FLAGS) -o $(BINARIES)$@ $^

install: all
	chown root $(BINARIES)$(code)
	chmod u+s $(BINARIES)$(code)
	./payload/disable-stack-protection.sh

clean:
	rm -rf $(BINARIES)*
