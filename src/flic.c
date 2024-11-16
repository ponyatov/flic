#include "flic.h"

#ifdef __linux__
int main(int argc, char *argv[]) {  //
#elif _WIN32
int main(int argc, char *argv[]) {  //
#else
int flic(int argc, char *argv[]) {  //
#endif
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
}

void arg(int argc, char *argv) {  //
#define ARGLINE "arg[%i] = <%s>\n", argc, argv
#ifdef __linux__
    fprintf(stderr, ARGLINE);
#else
    printf(ARGLINE);
#endif
}
