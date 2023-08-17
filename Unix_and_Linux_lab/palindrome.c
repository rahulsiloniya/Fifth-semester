#include <stdio.h>
#include <string.h>

int main() {
  char word[100];
  scanf("%s", word);
  int len = strlen(word);
  int i = 0, j = len - 1;
  while (i < j) {
    if (word[i] != word[j]) {
      printf("Not a palindrome\n");
      return 0;
    }
    i++; j--;
  }
  printf("Palindrome\n");
  return 0;
}
