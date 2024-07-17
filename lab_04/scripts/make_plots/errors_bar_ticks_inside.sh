#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080 enhanced
set output '../../plots/error_bar_ticks.svg'

set xlabel "Количество элементов, шт"
set ylabel "Тики"
set grid
set title "График error-bar измерения тиков"

plot "../../prepdata/index_ticks_inside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_ticks_inside/data.txt" using 1:7 with lines lt rgb "red" title "Index Inside",\
     "../../prepdata/index_to_pointer_ticks_inside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_to_pointer_ticks_inside/data.txt" using 1:7 with lines lt rgb "blue" title "Index to Pointer Inside",\
     "../../prepdata/pointers_ticks_inside/data.txt" using 1:7:6:2 with yerrorbar notitle,\
     "../../prepdata/pointers_ticks_inside/data.txt" using 1:7 with lines lt rgb "green" title "Pointers Inside"
