# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

#
# Parameters:
#   ARG1: output file
#
if (ARGC < 1) {
    exit error ARG0.": syntax: ".ARG0." <outfile>"
}

DIA_WIDTH  = 8
DIA_HEIGHT = 3
NUM_COLS   = 8
MAX_Y      = 10

# setup terminal
if (exists('OutputPng')) {
    set terminal pngcairo dashed size DIA_WIDTH*147,DIA_HEIGHT*147 font ',13'
    set output ARG1.'.png'
}
else {
    set terminal pdfcairo dashed size DIA_WIDTH,DIA_HEIGHT font ',13'
    set output ARG1.'.pdf'
}

# setup diagram type
set style data histogram
set style histogram clustered gap 1

# setup style
load '_style.gp'
set style  fill solid noborder
set border linecolor rgb '#c0c0c0'

# setup X axis
set xtics textcolor rgb 'black'
set xtics nomirror scale 0

# setup Y axis
set ylabel "Slowdown"
set yrange [0:MAX_Y]
set ytics  textcolor rgb 'black'
set ytics  scale 100, 1
set mytics 2

# setup legend
set key autotitle columnheader samplen 2
set key under Left reverse
set key height 0.5 spacing 2

# plot marker lines
set arrow from graph 0, first 2 to graph 1, first 2 nohead lw 2 lc rgb 'red'
do for [i=1:MAX_Y:2] {
    set arrow from graph 0, first i to graph 1, first i nohead lc rgb '#c0c0c0' dt 7
}

# plot data
plot for [i=2:NUM_COLS+1] $SLOWDOWN using i:xtic(1) lt i-1

# ***** end of source *****

