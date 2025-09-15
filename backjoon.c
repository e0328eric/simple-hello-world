#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

#define TEMPLATE_START        \
    "#include <stdio.h>\n"    \
    "#include <sys/mman.h>\n" \
    "b[]={"

#define TEMPLATE_END \
    "};" \
    "main(){void*c=mmap(0,%zu,7,33,-1,0);memcpy(c,b,%zu);((int(*)())c)(&printf,&scanf);}"

int main(int argc, char** argv) {
    if (argc != 3) {
        fprintf(stderr, "USAGE: backjoon <shellcode.o> <output.c>");
        return 1;
    }

    FILE* shellcode_handle = fopen(argv[1], "rb");
    fseek(shellcode_handle, 0, SEEK_END);
    size_t shellcode_len = ftell(shellcode_handle);
    rewind(shellcode_handle);

    size_t len = shellcode_len;
    if (shellcode_len & 3) len += 4 - shellcode_len % 4;
    char* shellcode = malloc(len);
    fread(shellcode, 1, shellcode_len, shellcode_handle);
    memset(shellcode + shellcode_len, 144, len - shellcode_len);

    FILE* output = fopen(argv[2], "w+");
    fprintf(output, TEMPLATE_START);

    for (int i = 0; i < len >> 2; ++i) {
        fprintf(output, "%"PRIu32",", i[(uint32_t*)shellcode]);
    }

    fprintf(output, TEMPLATE_END, len, len);

    free(shellcode);
    fclose(output);
    fclose(shellcode_handle);
}
