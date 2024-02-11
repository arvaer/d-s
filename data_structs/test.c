#include "list.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>

void test_create_list() {
  List *list = create_list();
  assert(list != NULL);
  assert(list->head == NULL);
  assert(list->tail == NULL);
  free(list);
}
void test_create_node() {
  char *test_data = "Wassup baby";
  size_t len = strlen(test_data);
  Node *new_node = create_node(test_data, len);
  assert(new_node != NULL);
  assert(new_node->next == NULL);
  assert(new_node->prev == NULL);
  assert(strncmp(test_data, new_node->data, len) == 0);
  delete_node(new_node);
}

void test_append_list() {
  char *test_data = "Wassup baby";
  size_t len = strlen(test_data);
  Node *node = create_node(test_data, len);

  char *test_data2 = "Wassup baby baby";
  size_t len2 = strlen(test_data);
  Node *node2 = create_node(test_data2, len2);

  char *test_data3 = "Wassup baby baby baby";
  size_t len3 = strlen(test_data);
  Node *node3 = create_node(test_data3, len3);

  List *list = create_list();

  pushback_list(list, node);
  assert(list->head = node);
  assert(list->tail = node);

  pushback_list(list, node2);
  assert(list->head = node);
  assert(strncmp(list->head->data, test_data, len) == 0);
  assert(list->head->next = node2);
  assert(strncmp(list->head->next->data, test_data2, len2) == 0);

  assert(list->tail = node2);
  assert(strncmp(list->tail->data, test_data2, len2) == 0);
  assert(list->tail->prev = list->head);
  assert(strncmp(list->tail->prev->data, test_data, len) == 0);

  pushback_list(list, node3);
  assert(list->head = node);
  assert(strncmp(list->head->data, test_data, len) == 0);
  assert(list->head->next = node2);
  assert(strncmp(list->head->next->data, test_data2, len2) == 0);
  assert(list->head->next->next = node3);
  assert(strncmp(list->head->next->next->data, test_data3, len3) == 0);

  assert(list->tail = node3);
  assert(strncmp(list->tail->data, test_data3, len3) == 0);
  assert(list->tail->prev = node2);
  assert(strncmp(list->tail->prev->data, test_data2, len2) == 0);
  assert(list->tail->prev->prev = list->head);
  assert(strncmp(list->tail->prev->prev->data, test_data, len) == 0);
}

void test_push_list() {
  char *test_data = "Wassup baby";
  size_t len = strlen(test_data);
  Node *node = create_node(test_data, len);

  char *test_data2 = "Wassup baby baby";
  size_t len2 = strlen(test_data);
  Node *node2 = create_node(test_data2, len2);

  char *test_data3 = "Wassup baby baby baby";
  size_t len3 = strlen(test_data);
  Node *node3 = create_node(test_data3, len3);

  List *list = create_list();

  push_list(list, node);
  assert(list->head = node);
  assert(list->tail = node);
  assert(strncmp(list->head->data, test_data, len) == 0);

  push_list(list, node2);
  assert(list->head = node2);
  assert(list->head->next = node);
  assert(list->head->next->prev = node2);
  assert(list->tail = node);
  assert(list->tail->prev = node2);
  assert(list->tail->next = NULL);
  assert(strncmp(list->head->data, test_data2, len2) == 0);
  assert(strncmp(list->tail->data, test_data, len) == 0);
  assert(strncmp(list->head->next->data, test_data, len) == 0);

  push_list(list, node3);
  assert(list->head = node3);
  assert(list->head->next = node2);
  assert(list->head->next->prev = node3);
  assert(list->head->next->next = node);
  assert(list->head->next->next->prev = node2);
  assert(list->tail = node);
  assert(list->tail->prev = node2);
  assert(list->tail->next = NULL);

}

void insert_into_list() {
  char *test_data = "Wassup baby";
  size_t len = strlen(test_data);
  Node *node = create_node(test_data, len);

  char *test_data2 = "Wassup baby baby";
  size_t len2 = strlen(test_data);
  Node *node2 = create_node(test_data2, len2);

  char *test_data3 = "Wassup baby baby baby";
  size_t len3 = strlen(test_data);
  Node *node3 = create_node(test_data3, len3);

  List *list = create_list();
}

int main() {
  test_create_list();
  test_create_node();
  test_append_list();

  printf("All tests passed successfully.\n");
  return EXIT_SUCCESS;
}
