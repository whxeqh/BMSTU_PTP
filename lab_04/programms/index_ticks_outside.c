// gnu99
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <string.h>
#include <x86intrin.h>
#include <math.h>

#ifndef NMAX
#error NMAX NOT ENTERED
#endif

#define OK 0

/**
 * @brief Функция сортирует массив выбором 
 * @param arr_size Длина массива
 * @param arr Массив
*/
void selection_sort(const size_t arr_size, int *arr)
{
    for (size_t i = 0; i < arr_size; i++)
    {
        int min_elem = arr[i];
        size_t new_id = i;
        for (size_t j = i + 1; j < arr_size; j++)
        {
            if (arr[j] < min_elem)
            {
                min_elem = arr[j];
                new_id = j;
            }
        }
        if (i != new_id)
        {
            int tmp = arr[i];
            arr[i] = arr[new_id];
            arr[new_id] = tmp;
        }
    }
}

/**
 * @brief Функция заполняет массив случайными числами 
 * @param size Длина массива
 * @param arr Массив для заполнения
*/
void init(const size_t size, int *arr)
{
    for (size_t i = 0; i < size; i++)
        arr[i] = rand();
}

int main(void)
{
    srand(time(NULL));
    size_t size = NMAX;
    int src_arr[size], arr[size];

    init(size, src_arr);

    unsigned long long tick_beg = __rdtsc();
    selection_sort(size, arr);
    unsigned long long tick_end = __rdtsc();

    arr[0] = arr[1];
    arr[1] = 54321;

    unsigned long long time = tick_end - tick_beg;

    printf("%llu\n", time);

    return OK;
}

