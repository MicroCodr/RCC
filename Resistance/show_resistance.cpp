#include <iostream>

extern "C" double show_resistance(unsigned long long nanoseconds, double total_resistance) {
    
    std::cout << "Frequency " << nanoseconds/1000000 << " MHZ" << std::endl;
    
    std::cout << "elapsed count of ticks: " << nanoseconds/100 << " " << std::endl;

    std::cout << "Time elapsed: " << nanoseconds << " nanoseconds" << std::endl;

    return total_resistance;
}


