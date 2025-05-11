#include <iostream>
#include "factorial.h"

using namespace std;

int main() {
    int number;
    cout << "Enter a positive integer: ";
    cin >> number;
    cout << "Factorial of " << number << " is " << factorial(number) << endl;
    return 0;
}
