#include <stdio.h>
#include <stdlib.h>

typedef struct NODE
{
	int data;
	struct NODE *next;
} node;

void list_insert(node** head, int n)
{
	node *tmp = malloc(sizeof(node));
	node *cur = *head;
	if (cur == NULL){
		tmp->data = n;
		tmp->next = NULL;
		*head = tmp;
		return;
	}
	*tmp = *cur;
	cur->next = tmp;
	cur->data = n;
}

void print_list(node* head)
{
	node *cur = malloc(sizeof(node)); 
	cur = head;
	while (cur)
	{
		printf("%d\n", cur->data);
		cur = cur->next;
	}
}

int main(int argc, char const *argv[])
{
	node *head = NULL;
	int n = 1;
	while (n != 0)
	{
		printf("Value: ");
		scanf("%d", &n);
		if (n != 0){
			list_insert(&head, n);
		}
	}
	print_list(head);
	return 0;
}