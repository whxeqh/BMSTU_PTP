#!/bin/bash

echo
echo "Postprocessing data"
echo

# Получаем адрес текущей папки
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Переходим в папку с скриптами для построения графиков
cd "$SCRIPT_DIR/make_plots" || exit

# Запускаем все .sh файлы в этой папке
for script in *.sh; do
    ./"$script"
done

echo
echo "Data was postprocessed successfully"
echo 
echo "Congratulations!!!!"
echo

exit 0
