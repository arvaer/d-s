/** Copyright (c) 2012 MIT License by 6.172 Staff
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 **/
#include "./util.h"
// Function prototypes
static void merge_f(data_t *A, int p, int q, int r, data_t* right, int n2);
static void copy_f(data_t *source, data_t *dest, int n);
inline void sort_f(data_t *A, int p, int r);
void isort(data_t *begin, data_t *end);
void insertion_sort(data_t *A, int p, int r);

// A basic merge sort routine that sorts the subarray A[p..r]
void sort_f(data_t *A, int p, int r) {
  assert(A);
  int n2 = r - (p + r) / 2;
  data_t *right = 0;
  mem_alloc(&right, n2 + 1);
  if (right == NULL) {
      mem_free(&right);
      return;
  }


  if ((r - p) < 50) {
    insertion_sort(A, p, r);
  } else if (p < r) {
      int q = (p + r) / 2;
    sort_f(A, p, q);
    sort_f(A, q + 1, r);

    merge_f(A, p, q, r, right, n2);

  }
  mem_free(&right);
}
// A merge routine. Merges the sub-arrays A [p..q] and A [q + 1..r].
// Uses two arrays 'left' and 'right' in the merge operation.
static void merge_f(data_t *A, int p, int q, int r, data_t *right, int n2) {
  assert(A);
  assert(p <= q);
  assert((q + 1) <= r);
  int n1 = q - p + 1;


  copy_f((A + (q + 1)), right, n2);
  *(A + n1 - 1) = UINT_MAX;
  *(right + n2) = UINT_MAX;

  int i = 0;
  int j = 0;

  for (int k = p; k <= r; k++) {
    if (*(A + i) <= *(right + j)) {
      *(A + k) = *(A + i);
      i++;
    } else {
      *(A + k) = *(right + j);
      j++;
    }
  }
}

static void copy_f(data_t *source, data_t *dest, int n) {
  assert(dest);
  assert(source);

  for (int i = 0; i < n; i++) {
    *(dest + i) = *(source + i);
  }
}
