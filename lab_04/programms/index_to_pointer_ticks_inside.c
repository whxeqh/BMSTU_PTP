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
#define N_REPS 1000

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

/**
 * @brief Функция присивает элемены массива src_arr элементам массива arr 
 * @param size Длина массивов
 * @param arr Массив для присваения
 * @param src_arr Исходный массив 
*/
void appropriate(const size_t size, int *arr, const int *src_arr)
{
    for (size_t i = 0; i < size; i++)
        arr[i] = src_arr[i];
}

/**
 * @brief Функция подсчёта rse из файла
 * @param file файловый дескпритор
 * @param reps Количество замеров в файле 
 * @return Значение rse 
*/
double calc_rse(FILE *file, const size_t reps)
{
    unsigned long long num;
    double avg = 0.0, s_sq = 0.0, std_err = 0.0, s = 0.0, rse = 0.0;
    
    file = fopen("output_index_to_pointer_ticks_inside.txt", "r");
    rewind(file);
    while (fscanf(file, "%llu", &num) == 1)
        avg += num;
    avg /= reps;

    rewind(file);
    while (fscanf(file, "%llu", &num) == 1)
        s_sq += (num - avg) * (num - avg);
    s_sq /= (reps - 1);

    s = sqrt(s_sq);
    std_err = s / sqrt(reps);
    rse = std_err / avg * 100;
    fclose(file);
    //printf("reps = %lu  avg = %.2lf  s_sq = %.2lf  s = %.2lf  std_err = %.2lf  rse = %.2lf\n", reps, avg, s_sq, s, std_err, rse);

    return rse;
}

int main(void)
{
    srand(time(NULL));
    size_t size = NMAX;
    int src_arr[size], arr[size];

    FILE *file = fopen("output_index_to_pointer_ticks_inside.txt", "w");

    init(size, src_arr);

    for (size_t i = 0; i < N_REPS; i++)
    {

        appropriate(size, arr, src_arr);

        unsigned long long tick_beg = __rdtsc();
        selection_sort(size, arr);
        unsigned long long tick_end = __rdtsc();

        arr[0] = arr[1];
        arr[1] = 54321;

        unsigned long long time = tick_end - tick_beg;

        printf("%llu\n", time);
        fprintf(file, "%llu\n", time);
        fflush(file);
        if (i >= 9 && calc_rse(file, i + 1) < 1.0)
            break;
    }
    fclose(file);

    return OK;
}
