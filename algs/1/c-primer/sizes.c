// Copyright (c) 2012 MIT License by 6.172 Staff

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define SIZE_OF(x) printf("size of %s : %zu bytes \n", #x, sizeof(x));

int main() {
  // Please print the sizes of the following types:
  // int, short, long, char, float, double, unsigned int, long long
  // uint8_t, uint16_t, uint32_t, and uint64_t, uint_fast8_t,
  // uint_fast16_t, uintmax_t, intmax_t, __int128, and student

  SIZE_OF(int);
  SIZE_OF(short);
  SIZE_OF(long);
  SIZE_OF(char);
  SIZE_OF(float);
  SIZE_OF(double);
  SIZE_OF(unsigned int);
  SIZE_OF(long long);
  SIZE_OF(uint8_t);
  SIZE_OF(uint16_t);
  SIZE_OF(uint32_t);
  SIZE_OF(uint64_t);
  SIZE_OF(uint_fast8_t);
  SIZE_OF(uint_fast16_t);
  SIZE_OF(uintmax_t);
  SIZE_OF(intmax_t);
  SIZE_OF(__int128);

  // Here's how to show the size of one type. See if you can define a macro
  // to avoid copy pasting this code.
  printf("size of %s : %zu bytes \n", "int", sizeof(int));
  // e.g. PRINT_SIZE("int", int);
  //      PRINT_SIZE("short", short);

  // Alternatively, you can use stringification
  // (https://gcc.gnu.org/onlinedocs/cpp/Stringification.html) so that
  // you can write
  // e.g. PRINT_SIZE(int);
  //      PRINT_SIZE(short);

  // Composite types have sizes too.
  typedef struct {
    int id;
    int year;
  } student;

  student you;
  you.id = 12345;
  you.year = 4;

  // Array declaration. Use your macro to print the size of this.
  int x[5];

  // You can just use your macro here instead: PRINT_SIZE("student", you);
  SIZE_OF(you);
  SIZE_OF(x)

  return 0;
}
