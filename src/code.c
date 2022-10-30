#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int search_config(char *argv, char *ptr)
{
    char config_section[20];
    strcpy(ptr, argv);
    return 0;
}

int server(int ct, char **inputs, char *p)
{
    char name[12];
    char init[12], buff[42];
    int tmp, i;
    int ret1, ret2;

    for (i = 0; i < 12; i++)
        buff[i] = 0;

    p = buff;
    tmp = ct;

    ret1 = search_config("init", init);
    ret2 = search_config(p, buff);

    printf("%s\n", inputs[1]);
    for (i = 1; i<tmp; i++) {
        strcpy(p, inputs[i]);
        printf("i = %d; p = %s; \n", i, p);

        p += strlen(inputs[i]);

        if ( i + 1 != tmp )
          *p++ = ' ';
    }

    printf("%s\n", buff);
    return ret1 | ret2;
}

int main(int argc, char **argv){
    char *ptr;
    ptr = (char *)malloc(sizeof(char)*12);
    search_config(argv[1], ptr);
    server(argc, argv, ptr);
    exit(0);
}