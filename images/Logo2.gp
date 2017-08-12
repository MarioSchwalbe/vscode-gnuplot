#!/usr/bin/env gnuplot

# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

# Output to 512x512px png:
set terminal pngcairo transparent size 512,512
set output ARG0[*:strlen(ARG0)-3].'.png'

# Remove unnecessary stuff:
set margins 0,0,0,0
unset colorbox
unset border
unset tics
unset key

# Setup colors:
# set palette maxcolors 8
set palette defined (   \
      0  "black",       \
     20  "blue",        \
     60  "red",         \
    100  "yellow"       \
)

BGC = hsv2rgb(0.55, 1, 0.8)
BGF = hsv2rgb(0.55, 1, 0.7)

# Draw background circles:
set style fill solid
set object circle center screen 0.5,0.5 size screen 0.50 behind fillcolor rgb BGC
set object circle center screen 0.5,0.5 size screen 0.46 behind fillcolor rgb BGF

# Setup splot:
S = 16
set pm3d depthorder hidden3d
set view 55, 35, 1.4
set origin 0.04,0.00
set samples S
set isosamples S,S

# Plot tori:
set parametric
set urange [-pi:pi]
set vrange [-pi:pi]

R = 0.35
x1(u,v) = cos(u)+R*cos(u)*cos(v)
y1(u,v) = sin(u)+R*sin(u)*cos(v)
z1(u,v) = R*sin(v)
x2(u,v) = 1+cos(u)+R*cos(u)*cos(v)
y2(u,v) = R*sin(v)
z2(u,v) = sin(u)+R*sin(u)*cos(v)

splot x1(u,v), y1(u,v), z1(u,v) with pm3d, \
      x2(u,v), y2(u,v), z2(u,v) with pm3d

# ***** end of source *****

