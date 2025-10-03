#include <iostream>
#include <iomanip>

extern "C" void show_results(double area) {
    std::cout << std::fixed << std::setprecision(10);
    std::cout << "The area of a triangle with the provided sides is " << area << " square units.\n";
    std::cout << "Have a nice day. The program will return control to the operating system.\n";
}
