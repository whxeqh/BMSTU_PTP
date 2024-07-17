#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo
echo "Deleting all texts files..."
echo

# Удаляю все txt файлы из папки с подготовленными данными о времени сортировок
if [ -d "$SCRIPT_DIR/../prepdata" ]; then
    for app_dir in "$SCRIPT_DIR/../prepdata"/*/; do
        rm -f "$app_dir"/*.txt
    done
fi

# Удаляю все txt файлы из папки с неподготовленными данными о времени сортировок
for app_dir in "$SCRIPT_DIR/../data"/*/; do
    rm -f "$app_dir"/*.txt
done

# Удаляю тектсовые файлы, которые были нужны для замеров времени внутри
rm -f "$SCRIPT_DIR"/*.txt

echo
echo "All texts files were deleted successfully."
echo

exit 0
