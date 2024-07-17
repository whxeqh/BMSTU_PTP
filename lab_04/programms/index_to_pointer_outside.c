// gnu99
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <string.h>

#ifndef NMAX
#error NMAX NOT ENTERED
#endif

#define OK 0

// Функция подсчитывает время между двумя моментами в микросекундах

unsigned long long calc_elapsed_time(const struct timespec *beg, const struct timespec *end)
{
    return ((unsigned long long)
        (end->tv_sec - beg->tv_sec) * 1000 * 1000 * 1000 +
                        (end->tv_nsec - beg->tv_nsec)) / 1000; 
}

/**
 * @brief Функция сортирует массив выбором 
 * @param arr_size Длина массива
 * @param arr Массив
*/
void selection_sort(const size_t arr_size, int *arr)
{
    for (size_t i = 0; i < arr_size; i++)
    {
        int min_elem = *(arr + i);
        size_t new_id = i;
        for (size_t j = i + 1; j < arr_size; j++)
        {
            if (*(arr + j) < min_elem)
            {
                min_elem = *(arr + j);
                new_id = j;
            }
        }
        if (i != new_id)
        {
            int tmp = *(arr + i);
            arr[i] = *(arr + new_id);
            *(arr + new_id) = tmp;
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
    struct timespec t_beg, t_end;
    size_t size = NMAX;
    int arr[size]; 

    init(size, arr);

    clock_gettime(CLOCK_MONOTONIC_RAW, &t_beg);
    selection_sort(size, arr);
    clock_gettime(CLOCK_MONOTONIC_RAW, &t_end);

    arr[0] = arr[1];
    arr[1] = 54321;

    printf("%llu\n", calc_elapsed_time(&t_beg, &t_end));

    return OK;
}

