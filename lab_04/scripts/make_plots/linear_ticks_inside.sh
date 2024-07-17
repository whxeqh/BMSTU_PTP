#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080
set output '../../plots/linear_ticks_inside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Тики"
set grid
set title "Линейный график для измерений тиков внутри"

plot "../../prepdata/index_ticks_inside/data.txt" using 1:7 with linespoints pt 9 lt rgb "red" title "Indix inside",\
     "../../prepdata/index_to_pointer_ticks_inside/data.txt" using 1:7 with linespoints pt 8 lt rgb "blue" title "Index to pointer inside",\
     "../../prepdata/pointers_ticks_inside/data.txt" using 1:7 with linespoints pt 7 lt rgb "green" title "Pointers Inside"
