#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080
set output '../../plots/linear_outside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Время, мкс"
set grid
set title "Линейный график для измерений времени внешней инфраструктуры"

plot "../../prepdata/index_outside/data.txt" using 1:7 with linespoints pt 9 lt rgb "red" title "Index outside", \
     "../../prepdata/index_to_pointer_outside/data.txt" using 1:7 with linespoints pt 8 lt rgb "blue" title "Index to pointer outside", \
     "../../prepdata/pointers_outside/data.txt" using 1:7 with linespoints pt 7 lt rgb "green" title "Pointers outside"
