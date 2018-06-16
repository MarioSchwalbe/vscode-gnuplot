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

# FIXME: Wrong highlighting of attribute defined
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
S = 32
set pm3d depthorder hidden3d
set view 122, 357, 1.3
set origin 0.07,-0.02
set samples S
set isosamples S,S

# Plot Kuen's surface:
set parametric
set urange [-4.5:4.5]
set vrange [0.05:pi-0.05]

R = 1.0
x(u,v) = 2.*R*(cos(u)+u*sin(u))*sin(v) / (1+u**2.*sin(v)**2)
y(u,v) = 2.*R*(sin(u)-u*cos(u))*sin(v) / (1+u**2.*sin(v)**2)
z(u,v) =    R*log(tan(v/2.))+2.*cos(v) / (1+u**2.*sin(v)**2)

splot x(u,v), y(u,v), z(u,v) with pm3d linewidth 2

# ***** end of source *****
