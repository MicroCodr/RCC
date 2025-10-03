#include <iostream>
#include <thread>
#include <chrono>

extern "C" {
    double compute_resistance(double r1, double r2, double r3, double r4, long delay_seconds) {
        if (r1 <= 0 || r2 <= 0 || r3 <= 0 || r4 <= 0) return 0.0;

        // Introduce a delay to simulate processing time
        std::this_thread::sleep_for(std::chrono::seconds(delay_seconds));

        // Calculate the total resistance for resistors in parallel
        double total_resistance = 1 / ((1 / r1) + (1 / r2) + (1 / r3) + (1 / r4));

        return total_resistance;
    }
}

