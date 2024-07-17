#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080
set output '../../plots/linear_ticks_outsidee.svg'

set xlabel "Количество элементов, шт"
set ylabel "Тики"
set grid
set title "Линейный график для измерений тиков снаружи"

plot "../../prepdata/index_ticks_outside/data.txt" using 1:7 with linespoints pt 9 lt rgb "red" title "Indix outside",\
     "../../prepdata/index_to_pointer_ticks_outside/data.txt" using 1:7 with linespoints pt 8 lt rgb "blue" title "Index to pointer outside",\
     "../../prepdata/pointers_ticks_outside/data.txt" using 1:7 with linespoints pt 7 lt rgb "green" title "Pointers Outside"
