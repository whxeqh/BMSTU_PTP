#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080
set output '../../plots/moustashe_index_to_pointer_inside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Время, мкс"
set grid
set title "График с усами для измерений времени внутри. Индексация заменена указателями"

plot "../../prepdata/index_to_pointer_inside/data.txt" using 1:3:2:6:5 with candlesticks notitle whiskerbars,\
     "../../prepdata/index_to_pointer_inside/data.txt" using 1:7 with linespoints title "Index to pointer inside", \
     "../../prepdata/index_to_pointer_inside/data.txt" using 1:7:7:7:7 with candlesticks lt -1 notitle
