#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool get_sides(double* side1, double* side2, double* side3) {
    printf("Enter side 1: ");
    if (scanf("%lf", side1) != 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF) {}
        return false;
    }

    printf("Enter side 2: ");
    if (scanf("%lf", side2) != 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF) {}
        return false;
    }

    printf("Enter side 3: ");
    if (scanf("%lf", side3) != 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF) {}
        return false;
    }

    return true;
}