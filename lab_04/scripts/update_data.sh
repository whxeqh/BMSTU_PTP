#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo
echo "Updating data..."
echo

# Обходим каждую программу с расширением .c (разные сортировки)
for programm in "$SCRIPT_DIR"/../programms/*.c; do 
    prog_name=$(basename "$programm")
    if [ ! -d "$SCRIPT_DIR/../data/${prog_name%.c}/" ]; then
        mkdir "$SCRIPT_DIR/../data/${prog_name%.c}/"
    fi
    echo
    # Обходим каждый исполняемый файл
    for exe in "$SCRIPT_DIR/../apps/${prog_name%.c}"/*.exe; do
        exe_name=$(basename "$exe" .exe)
        data_file="$SCRIPT_DIR/../data/${prog_name%.c}/${exe_name}.txt"
        echo "Updating data for file: ${prog_name%.c}/$exe_name.txt"
        "$exe" >> "$data_file"

        # Проверка на наличие слова "inside" в имени файла
        if [[ "$data_file" == *"inside"* ]]; then
            continue
        fi
        # Инициализация счетчика итераций
        count=1
        max_iterations=1000
        min_iterations=10

        while (( count < max_iterations )); do
            # Увеличение счетчика итераций и запуск исполняемого файла с записью в текстовый файл
            count=$((count + 1))
            "$exe" >> "$data_file"

            # Проверка на минимальное количество итераций и вычисление rse_value
            if (( count >= min_iterations )); then
                rse_value=$(python3 "$SCRIPT_DIR"/calc_rse.py "$data_file")
                #если rse < 1.0, прекращаем цикл записи данных
                if (( $(echo "$rse_value < 1.0" | bc -l) )); then
                    break
                fi
            fi

            # Проверка на максимальное количество итераций
            if (( count >= max_iterations )); then
                break
            fi
        done
    done
done

echo
echo "Data was updated successfully"
echo

exit 0
