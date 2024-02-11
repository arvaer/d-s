#include "list.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

List *create_list() { return (List *)malloc(sizeof(List)); }
Node *create_node(char *data, size_t len) {
  Node *node = malloc(sizeof(Node));
  node->data = malloc(len + 1);
  memcpy(node->data, data, len);
  node->data[len] = '\0';
  (*node).next = NULL;
  (*node).prev = NULL;
  return node;
}

void delete_node(Node *node) {
  free(node->data);
  free(node);
}

int pushback_list(List *list, Node *node) {
  if (list->head == NULL) {
    list->head = node;
    list->tail = node;
    return EXIT_SUCCESS;
  }

  Node *tail = list->tail;
  tail->next = node;
  node->prev = tail;
  list->tail = node;

  return EXIT_SUCCESS;
}
int push_list(List *list, Node *node) {
  if (list->head == NULL) {
    list->head = node;
    list->tail = node;
    return EXIT_SUCCESS;
  }
  Node *head = list->head;
  node->next = head;
  head->prev = node;
  list->head = node;

  return EXIT_SUCCESS;
}
