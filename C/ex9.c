#include <stdio.h>

typedef struct NODE
{
	int data;
	struct NODE *next = NULL;
} node;

int list_append(**node head, int n)
{
	node *tmp = malloc(sizeof(node));
	if (*head == NULL){
		*head = tmp;
	}
	*tmp = **head;
	*head->next = tmp;
	*head->data = n;
}

int print_list(*node head)
{
	node *cur = malloc(sizeof(node)); 
	cur = *node;
	while (cur)
	{
		printf("%d\n", cur->data);
		cur = cur->next;
	}
}

int main(int argc, char const *argv[])
{
	node *head = malloc(sizeof(node));
	int n = 1;
	while (n != 0)
	{
		printf("Value: \n");
		scanf("%d", n);
		list_append(&head, n);
	}
	print_list(head);
	return 0;
}