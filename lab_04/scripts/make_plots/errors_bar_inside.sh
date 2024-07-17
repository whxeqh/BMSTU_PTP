#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080 enhanced
set output '../../plots/error_bar_inside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Время, мкс"
set grid
set title "График error-bar измерения времени внутри программы"

plot "../../prepdata/index_inside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_inside/data.txt" using 1:7 with lines lt rgb "red" title "Index Inside",\
     "../../prepdata/index_to_pointer_inside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/index_to_pointer_inside/data.txt" using 1:7 with lines lt rgb "blue" title "Index to Pointer Inside",\
     "../../prepdata/pointers_inside/data.txt" using 1:7:6:2 with yerrorbars notitle,\
     "../../prepdata/pointers_inside/data.txt" using 1:7 with lines lt rgb "green" title "Pointers Inside"
