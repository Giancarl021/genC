/*
Environment: [[OS]]
Compile Command: gcc [[ITER]].c -o [[ITER]]
Run Command: ./[[ITER]]
*/
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL, "Portuguese");

    return 0;
}
