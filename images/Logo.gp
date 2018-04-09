#!/usr/bin/env gnuplot

# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

# Output to 512x512px png:
set terminal pngcairo transparent rounded size 512,512 font ",55"
set output ARG0[*:strlen(ARG0)-3].'.png'

# Remove unnecessary stuff:
set margins 0,0,0,0
unset border
unset tics
unset key

# Setup colors:
AC  = '#f7f7f7'
FG  = hsv2rgb(0.10, 1, 1.0)
BGC = hsv2rgb(0.55, 1, 0.6)
BGF = hsv2rgb(0.55, 1, 0.7)

# Draw background circles:
set style fill solid
set object circle center screen 0.5,0.5 size screen 0.50 behind fillcolor rgb BGC
set object circle center screen 0.5,0.5 size screen 0.46 behind fillcolor rgb BGF

# Setup tic marks:
set border linecolor rgb AC linewidth 20
set rtics axis 2 textcolor rgb AC right
set grid rtics front polar linecolor rgb BGF linewidth 0

# Plot spiral:
set polar
set rrange [0:4]
set xrange [-4.5:5.25]
set yrange [-4.0:4.80]

O = pi / 3
rotate(t) = abs(pi*2 - (t - O))
spiral(t) = log(rotate(t)+1)*1.5

plot [O:pi*2+O] spiral(t) linecolor rgb FG linewidth 80

# ***** end of source *****
