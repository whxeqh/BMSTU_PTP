#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

NMAX="500 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 6000 6500 7000 7500 8000 8500 9000 9500 10000"

echo "Build process started..."

# Проверяю существование папки с программами
if [ ! -d "$SCRIPT_DIR/../programms" ]; then
    echo "Error: Programms directory not found."
    exit 1
fi

# Проверяю существование папки с исполняемыми файлами
if [ ! -d "$SCRIPT_DIR/../apps" ]; then
    mkdir "$SCRIPT_DIR/../apps"
fi

# Обходим каждую программу с расширением .c (разные сортировки)
for programm in "$SCRIPT_DIR"/../programms/*.c; do    
    prog_name=$(basename "$programm")

    # Проверяю существование файла .c
    if [ ! -f "$programm" ]; then
        echo "Error: Source file $programm not found."
        exit 1
    fi

    if [ -d "$SCRIPT_DIR/../apps/${prog_name%.c}/" ]; then
        rm -f "$SCRIPT_DIR/../apps/${prog_name%.c}/"*.exe
    else 
        mkdir "$SCRIPT_DIR/../apps/${prog_name%.c}/"
    fi

    # Обходим все знаечния NMAX (кол-во элементов в массиве)
    for size in $NMAX; do
        echo "Building app $prog_name, size = $size"
        gcc -std=gnu99 -Wall -Werror -Wextra -Wpedantic -o "$SCRIPT_DIR/../apps/${prog_name%.c}/$size.exe" "$programm" -DNMAX="$size" -lm
    done
    echo
done

echo "Build process completed successfully."

exit 0
