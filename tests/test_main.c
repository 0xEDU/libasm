#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../includes/libasm.h"

int main() {
  char *string = "dale";
  int ft_value = ft_strlen(string);
  int value = strlen(string);
  if (value != ft_value) {
    printf("Wrong size!");
    exit(0);
  }
  return 0;
}
