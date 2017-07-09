#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

#define SIZE 1000000

void initVecs(int *a, int *b) {
  int i;
  for (i = 0; i < SIZE; i++) {
    a[i] = i + 1;
    b[i] = i + 2;
  }
}

int main() {
  unsigned long i = 0;
  int accum = 0;
  int *a = (int *)malloc(sizeof(int) * SIZE);
  int *b = (int *)malloc(sizeof(int) * SIZE);
  void (*addVec)(int *, int *, int *, int);

  void *c_handle = dlopen("addVec.dylib", RTLD_LAZY);
  if (c_handle == NULL) {
    printf("Error opening adVec.dylib");
    return 1;
  }
  addVec = dlsym(c_handle, "addVec");

  initVecs(a, b);
  initVecs(a, b);
  for (i = 0; i < 1000; i++) {
    addVec(a, b, a, SIZE);
  }
  for (i = 0; i < SIZE; i++) {
    accum = a[i];
  }
  printf("%d", accum);
  return 0;
}
