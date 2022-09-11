#include <stdio.h>
#include <stdlib.h>

static int tarai(const int x, const int y, const int z){
  if (x > y){
    return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) );
  } else {
    return y;
  }
}

int main(int argc, char* argv[]){
  if (argc != 4) return 1;
  int x = atoi(argv[1]), y = atoi(argv[2]), z = atoi(argv[3]);
  printf("%d\n", tarai(x, y, z));
  return 0;
}
