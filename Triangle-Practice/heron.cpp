#include <iostream>
using namespace std;




extern "C" void process_triangle();

int main() {
    cout << "Welcome to the Triangle Area Calculator using Heron's Formula.\n";
        process_triangle();

    return 0;
}
