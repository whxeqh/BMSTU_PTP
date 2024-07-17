#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo
echo "Preprocessing data..."

# Обходим каждую программу с расширением .c (разные сортировки)
for program in "$SCRIPT_DIR"/../programms/*.c; do
    prog_name=$(basename "$program" .c)
    # Создаю папку prepdata, если её ещё нет
    if [ ! -d "$SCRIPT_DIR/../prepdata/${prog_name}" ]; then
        mkdir "$SCRIPT_DIR/../prepdata/${prog_name}"
    fi

    # Удаляю файл data.txt, если он существует
    if [ -f "$SCRIPT_DIR/../prepdata/${prog_name}/data.txt" ]; then
        rm "$SCRIPT_DIR/../prepdata/${prog_name}/data.txt"
    fi

    # Создаю файл data.txt в каждой папке prepdata
    touch "$SCRIPT_DIR/../prepdata/${prog_name}/data.txt"

    # Запускаю python скрипт, которые обрабатывает данные из файла и записывает статистику в папку prepdata в файл с соответствующим названием
    python3 "$SCRIPT_DIR"/preproc.py "$SCRIPT_DIR/../data/${prog_name}/" "$SCRIPT_DIR/../prepdata/${prog_name}/data.txt"
done

echo
echo "Data was preprocessed successfully"
echo

exit 0
