#include <sys.h>

unsigned int strlength(const char* str) {
  int length = 0;
  while(str[length])
    length++;
  return length;
}

int main(int argc, char** args) {
  (void) argc;
  (void) args;

  const char* str = "Hello World!\n";

  system(1, STDOUT, str, strlength(str));
  write(STDOUT, str, strlength(str));

  return 0;
}
