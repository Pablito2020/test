
#include <stdio.h>	
int saluda(char *temp1,char *temp2)
{ 
char name[400];	
strcpy(name, temp2);	
printf("Hello %s %s\n", temp1, name); 
} 




int main(int argc, char * argv[])
{	

char buff[1024], buff2[1024];
strcpy(buff, argv[1]);
strcpy(buff2, argv[2]);

saluda(buff,buff2);
printf("Goodbye %s %s\n", argv[1], argv[2]); 
}	
