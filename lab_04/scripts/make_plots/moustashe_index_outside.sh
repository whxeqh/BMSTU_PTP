#!/usr/bin/gnuplot -persist

reset
NO_ANIMATION = 1

set terminal svg size 1920, 1080
set output '../../plots/moustashe_index_outside.svg'

set xlabel "Количество элементов, шт"
set ylabel "Время, мкс"
set grid
set title "График с усами для измерений времени снаружи. Индексы"

plot "../../prepdata/index_outside/data.txt" using 1:3:2:6:5 with candlesticks notitle whiskerbars,\
     "../../prepdata/index_outside/data.txt" using 1:7 with linespoints title "Index outside",\
     "../../prepdata/index_outside/data.txt" using 1:7:7:7:7 with candlesticks lt -1 notitle
