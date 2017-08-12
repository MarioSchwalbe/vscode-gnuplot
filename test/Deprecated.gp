# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

# old-style params $n
print $0, "$1", "number of args = $#"

# $n still works here as column index
plot 'file.dat' thru 1:($2+$3)

# read-only:
GPVAL_xxx = 0
MOUSE_xxx = 0

# now: set fit ...
FIT_LIMIT   = 0
FIT_MAXITER = 0

# now: set style data/function ...
set data ...
set function ...

# now: set linetype
set style increment user

# FIXME: Flag as deprecated
set pm3d hidden3d 1
set pm3d map

# ***** end of source *****

