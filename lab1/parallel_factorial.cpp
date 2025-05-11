#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
using namespace std;

unsigned long long factorial(int start, int end) {
    unsigned long long result = 1;
    for (int i = start; i <= end; ++i) {
        result *= i;
    }
    return result;
}

int main() {
    const char* shm_name = "/factorial_shm";
    int number;
    cout << "Enter a positive integer: ";
    cin >> number;

    // ������� ����������� ������
    int shm_fd = shm_open(shm_name, O_CREAT | O_RDWR, 0666);
    ftruncate(shm_fd, sizeof(unsigned long long));
    unsigned long long* ptr = (unsigned long long*)mmap(0, sizeof(unsigned long long), PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);

    *ptr = 1; // ������������� ����������

    pid_t pid = fork();
    if (pid == 0) {
        // �������� ������� ��������� ������ ��������
        unsigned long long part = factorial(1, number/2);
        *ptr *= part; // �������� ���������
        exit(0);
    } else {
        // ������������ ������� ��������� ������ ��������
        unsigned long long part = factorial(number/2 + 1, number);
        *ptr *= part; // �������� ���������
        wait(NULL); // ���� ���������� ��������� ��������

        cout << "Factorial of " << number << " is " << *ptr << endl;

        // ����������� �������
        munmap(ptr, sizeof(unsigned long long));
        shm_unlink(shm_name);
    }

    return 0;
}
