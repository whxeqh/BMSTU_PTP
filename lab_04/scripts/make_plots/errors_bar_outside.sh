#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080 enhanced
set output '../../plots/error_bar_outside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Время, мкс"
set grid
set title "График error-bar измерения времени снаружи"

plot "../../prepdata/index_outside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_outside/data.txt" using 1:7 with lines lt rgb "red" title "Index outside",\
     "../../prepdata/index_to_pointer_outside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_to_pointer_outside/data.txt" using 1:7 with lines lt rgb "blue" title "Index to Pointer outside",\
     "../../prepdata/pointers_outside/data.txt" using 1:7:6:2 with yerrorbar notitle,\
     "../../prepdata/pointers_outside/data.txt" using 1:7 with lines lt rgb "green" title "Pointers outside"
