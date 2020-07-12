#include <stdio.h>

extern int mod( int, int );

int main() {

  int n = 10;
  int d = 20;
  int m = mod(n, d);

  printf("%d mod %d = %d\n", d, n, m);

  n = 3;
  d = 20;
  m = mod(n, d);
  printf("%d mod %d = %d\n", d, n, m);

  n = 3;
  d = 133;
  m = mod(n, d);
  printf("%d mod %d = %d\n", d, n, m);

  n = 87;
  d = 981;
  m = mod(n, d);
  printf("%d mod %d = %d\n", d, n, m);
  return 0;
}
