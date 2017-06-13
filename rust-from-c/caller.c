#include <stdio.h>

extern int __addvdi3(int lhs, int rhs);

int main() {
  printf("add(40,2) = %d\n", __addvdi3(40,2));

  return 0;
}
