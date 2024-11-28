#include <stdio.h>
#include <assert.h>

FILE *fh = nullptr;

uint8_t buf[0x10000];

int main(int argc, char *argv[]) {
    assert(argc == 2);
    fprintf(stderr, "\n%s\t", argv[1]);
    assert(fh = fopen(argv[1], "rb"));
    size_t rd = 0;
    do {
        rd = fread(buf, sizeof(buf), 1, fh);
        fprintf(stderr, "%i\t", rd);
        if (!rd) break;
    } while (rd);
    fclose(fh);
    fh = nullptr;
    fprintf(stderr, "\n");
    return 0;
}
