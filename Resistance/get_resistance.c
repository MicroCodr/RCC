#include <stdio.h>
#include <iostream>


extern "C" double compute_resistance(double r1, double r2, double r3, double r4);

extern "C" double get_resistance(double r1, double r2, double r3, double r4) {
    printf("Enter resistance for R1: ");
    std::cin >> r1;
    printf("Enter resistance for R2: ");
    std::cin >> r2;
    printf("Enter resistance for R3: ");
    std::cin >> r3;
    printf("Enter resistance for R4: ");
    std::cin >> r4;

    double total_resistance = compute_resistance(r1,r2,r3,r4);
    
    return total_resistance;
}



