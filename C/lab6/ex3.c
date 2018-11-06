#include <stdio.h>
#include <stdlib.h>

/* Returns a pointer the start of the user's input.
** Returns NULL if there is an error.
** Caller is responsible for freeing returned memory*/
char *prompt(const char *mesg, const int limit)
{
   char *name;
   name = malloc(sizeof(char) * (limit + 1));
   if(name == NULL)
   {
      return NULL;
   }

   printf("%s", mesg);

   int pos = 0;
   while(pos < limit)
   {
      char ch;
      scanf("%c", &ch);
      if(ch == '\n') // User pressed return/enter.
      {
	 name[pos] = '\0';  // Terminate the string here.
	 break;
      }
      name[pos] = ch;
      pos++;
   }

   name[limit] = '\0'; // Make sure last element is \0.
   
   return name;
}

int main(int argc, char *argv[])
{
   char *name = prompt("Who are you?\n", 20);
   if(name == NULL)
   {
      printf("Error\n");
   }
   else
   {
      printf("Hello %s!\n", name);
      free(name);
   }
}