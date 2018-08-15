# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

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

# plot marker lines
set arrow from graph 0, first 2 to graph 1, first 2 nohead lw 2 lc rgb 'red'
do for [i=1:MAX_Y:2] {
    set arrow from graph 0, first i to graph 1, first i nohead lc rgb '#c0c0c0' dt 7
}

# plot data
plot for [i=2:NUM_COLS+1] 'data.dat' using i:xtic(1) lt i-1
