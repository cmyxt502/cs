#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
	int data;
	struct Node *next;
} node;

int main(int argc, char const *argv[])
{
	node *list = NULL;
	list = malloc(sizeof(node));
	list -> data = 1;
	list -> next = malloc(sizeof(node));
	list -> next -> data = 2;
	printf("%d\n", list->next->data);
}