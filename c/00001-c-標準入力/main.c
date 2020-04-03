#include <stdio.h>
#include <unistd.h>

int main() {

    const int BUF_LEN = 255;
    char buf[BUF_LEN];

    int rc;
    rc = read(STDIN_FILENO, buf, BUF_LEN);
    if (rc == -1) {
        return 1;
    }

    fwrite(buf, 1, rc, stdout);

    return 0;
}