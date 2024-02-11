// list.h
#ifndef LIST_H
#define LIST_H
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 0

#include <stdlib.h> // For size_t

typedef struct Node {
  char *data;
  struct Node *prev;
  struct Node *next;
} Node;

typedef struct {
  Node *head;
  Node *tail;
} List;

List *create_list();
Node *create_node(char *data, size_t len);
void delete_node(Node *node);
int pushback_list(List* list, Node* node);
int push_list(List* list, Node* node );
#endif

