#include <iostream>

// Declaring the resistance function as an external C function
extern "C" double resistance();

int main() {
    std::cout << "Welcome to the Resistance Calculator" << std::endl;

    // Calling the resistance function and storing the result in the_resistance
    double the_resistance = resistance();

    // Outputting the calculated resistance
    std::cout << "The calculated resistance is: " << the_resistance << " ohms" << std::endl;

    return 0;
}

