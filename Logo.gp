#!/usr/bin/env gnuplot

# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

# Output to png 512x512px file:
set terminal pngcairo transparent rounded size 512,512 font ",55"
set output "Logo.png"

# Remove unnecessary stuff:
set margins 0,0,0,0
unset border
unset xtics
unset ytics

# Setup colors:
AC  = '#f7f7f7'
FG  = hsv2rgb(0.11, 1, 1.0)
BGC = hsv2rgb(0.55, 1, 0.5)
BGF = hsv2rgb(0.55, 1, 0.6)

# Background circle:
set style fill solid
set object circle center graph 0.5,0.5 size graph 0.50  behind fillcolor rgb BGC
set object circle center graph 0.5,0.5 size graph 0.47 behind fillcolor rgb BGF

# Tic marks:
set border linecolor rgb AC linewidth 20
set rtics axis 2 textcolor rgb AC right
set grid rtics front polar linecolor BGF linewidth 0

# Plot spiral:
set polar
set rrange [0:4]
set xrange [-4.5:5.25]
set yrange [-4.0:4.80]

offset = pi / 3
rot(t) = abs(pi*2 - (t - offset))
plot [offset:offset+pi*2] log(rot(t)+1)*1.5 linecolor rgb FG linewidth 80 notitle

# ***** end of source *****
