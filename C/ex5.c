#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
	int data;
	struct Node *next;
} node;

void append(node** head_ref, int newData)
{
	node *new_node = malloc(sizeof(node));
	node *last = *head_ref;

	new_node->data = newData;

	new_node->next = NULL;

	if (*head_ref == NULL){
		*head_ref = new_node;
		return;
	}

	while (last->next != NULL){
		last = last->next;
	}
	last->next = new_node;
	return;
}

void push(node** head_ref, int newData)
{
	node *new_node = NULL;
	new_node = malloc(sizeof(node));

	new_node->data = newData;

	if (*head_ref == NULL){
		*head_ref = new_node;
		return;
	}

	node *first = *head_ref;
	new_node->next = first;
	*head_ref = new_node;
	return;
}

void insertAfter(node* pre_node, int newData)
{
	node *new_node = malloc(sizeof(node));
	new_node->data = newData;
	new_node->next = pre_node->next;
	pre_node->next = new_node;
	return;
}

int main(int argc, char const *argv[])
{
	node *head = NULL;
	append(&head, 15);
	append(&head, 10);
	insertAfter(head->next, 7);
	//push(&head, 5);
	printf("%d\n", head->next->next->data);
}