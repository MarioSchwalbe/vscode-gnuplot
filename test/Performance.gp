#!/usr/bin/env gnuplot

# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

#
# Host:      sylvester
# Processor: AMD E-450 APU with Radeon(tm) HD Graphics
# Memory:    7 GiB (7585 MiB)
# OS:        Ubuntu 16.04.3 LTS
#
# Compilers:
#   /usr/bin/gcc-5:      gcc-5 (Ubuntu 5.4.1-11ubuntu2~16.04) 5.4.1 20170519
#   /usr/bin/gcc-6:      gcc-6 (Ubuntu/Linaro 6.3.0-18ubuntu2~16.04) 6.3.0 20170519
#   /usr/bin/gcc-7:      gcc-7 (Ubuntu 7.1.0-5ubuntu2~16.04) 7.1.0
#   /usr/bin/clang-4.0:  clang version 4.0.0-1ubuntu1~16.04.1 (tags/RELEASE_400/rc1)
#
$SLOWDOWN << END_OF_DATA

# This is a comment.
___             "GCC 5 (O2)"    "GCC 5 (O3)"    "GCC 6 (O2)"    "GCC 6 (O3)"    "GCC 7 (O2)"    "GCC 7 (O3)"    "Clang (O2)"    "Clang (O3)"
BubbleSort      2.613920        2.612947        2.470333        2.475110        2.366453        2.349563        4.630142        4.664049
QuickSort       2.750887        2.543996        2.086715        2.086612        2.273168        2.324120        2.648276        3.279741
Interpolation   2.575103        2.637591        2.640353        2.594237        2.544861        2.569393        2.574792        2.568322
Crc32           3.065144        2.168255        3.056917        2.170632        1.533575        1.658482        3.290630        3.275555
Crc32Tab        2.144936        2.284162        2.133306        2.141150        2.462478        2.467702        2.725014        2.730938
Crc32File       1.292078        1.292413        1.265462        1.241673        1.253237        1.252629        1.272512        1.995706
Rc4             1.626192        1.642764        1.777957        1.782536        1.429561        1.377554        2.239092        2.269883
Sha256          2.417874        2.444171        2.352167        2.369296        2.516748        2.538450        5.423133        5.419723
MatMult         3.866186        3.409035        3.901018        3.876722        3.535655        3.718169        5.702128        5.454841

END_OF_DATA

set title 'AMD E-450 \@ 1.65GHz'
call '_slowdown.gp' ARG0[*:strlen(ARG0)-3]
print "done"

# ***** end of source *****
