# vim: set tabstop=4 shiftwidth=4 expandtab filetype=gnuplot:

# *************************************************************************************************
# ******************************************* Comments ********************************************
# *************************************************************************************************

# FIXME: Incorrect 2nd line highlight (comments) \
print "Still a comment"

# Comment before statement
PRINT = 'print'             # Comment after statement
@PRINT 'Hi there!'          # Comment after statement
MyInc(x) = x + 1            # Comment after statement
print MyInc(1)              # Comment after statement

# *************************************************************************************************
# ******************************************* Literals ********************************************
# *************************************************************************************************

N = .5
N = .5e2
N = .5e+2
N = .5e-2
N = 0.5
N = 0.5e2
N = 0.5e+2
N = 0.5e-2
N = 0.5e-2
N = 0xdeadbabe
N = 0XCAFEface
N = 00
N = 01234567
# N = 0123456789
N = 123456789

# Not a number but an expression
N = 0x1e-2

# FIXME: Missing support for complex number literals
N = { 1, 2 }

# Some strings
print 'Hallo Welt\''\"_\a\b\c_\n2nd line'
print "Hallo Welt\''\"_\a\b\c_\n2nd line"

print 'Unterminated string literal
print "Unterminated string literal

# FIXME: Incorrect 2nd line highlight (strings)
print 'Quoted newline string literal \
    2nd line'
print "Quoted newline string literal \
    2nd line"

print '`hostname -s`: '."`hostname -s`"

# *************************************************************************************************
# ******************************************* Operators *******************************************
# *************************************************************************************************

# Some custom vars
a = b = c = 0
b = 1
A = 'A'
B = 'B'

# Unary operators
print 'Unary ops:'
R = +a
R = -a
R = ~a
R = !a
R = a!

# Binary operators
print 'Binary ops:'
R = a**b
R = a*b
R = a/b
R = a%b
R = a+b
R = a-b
R = a==b
R = a!=b
R = a<b
R = a<=b
R = a>b
R = a>=b
R = a<<1
R = b>>1
R = a&b
R = a|b
R = a^b
R = a&&b
R = a||b
R = a=b
R = A.B
R = A eq B
R = A ne B

# *************************************************************************************************
# ******************************************* Built-ins *******************************************
# *************************************************************************************************

# Constants/Variables
print 'GPVAL_TERM: ', GPVAL_TERM
print 'NaN: ', NaN
print 'pi: ', pi

# # Flagged as invalid
# GPVAL_XX = 0
# MOUSE_XX = 0

# Functions
strlen = strlen('Hello World')
print strlen
print strlen('Hello World')

# # FIXME: Flag functions as invalid
# strlen(x) = x
# print strlen('Called user-defined function')

# *************************************************************************************************
# ************************************* Expressions/Toplevels *************************************
# *************************************************************************************************

print "\nExpressions:"

# data blocks
$DATA << END        # works
    1 2 3
    4 5 6
END

print $DATA

# Macros
PRINT = 'print "I''m a macro!"'
@PRINT, " ... and some other text!"

# Function decls
MyLen(x) = strlen(x)
print MyLen('Mario')

MyAdd(x, y) = x + y
print MyAdd(1, 2)

# Ternary & Summation
N = 2 > 1 ? 'foo' : 'bar'
N = sum [i=1:strlen('0123456789')] i
N = sum [i=1:int(sum [j=1:3] j)] i
N = sum [i=1:3] sum [j=1:i*10] j
N = (1 > 0) ? sum [i=1:3] i : 0
N = sum [i=1 : (1 > 0) ? 3 : 2] i

# *************************************************************************************************
# ******************************************* Commands ********************************************
# *************************************************************************************************

print "\nCommands:"

#
# Simple commands
#
pwd
reset
undefine N*

print = "Test1"
print print ; print print

print(x) = x
print print("Test2")

#
# Compound statement
#
{
    print "Inside block"
}

#
# if-else & while commands
#
if ((if = 0) == 0) {
    print "if is 0: ", if
}

if(x, y) = x + y
if (if(0, 0) == 0) {
    print "if(0, 0) is 0: ", if
}
else {
    print "if(0, 0) is not 0: ", if
}

if (strlen('Mario') < 2) print 'Impossible' ; print 'Still impossible'
print 'Should work'

while (if < 3) {
    print "Still in loop: ", if(1,2)
    if = if + 1
}

#
# do for command
#
do for [do=1:4:(2>1)?2:1] {
    print do
}

text(x) = 'A B C _' . strlen('Mario')
do for [name in text(0x00).strlen('Mario')] {
    print name
}

# Gnuplot 5.0 supports this!
do for [do=strlen('abc') : end=sum [j=1:4] j : for=(2 > 1)?2:1] {
    print do, end, for
}

#
# show, set & unset commands
#
show linetype 1
show functions
set title 'Some Title'
set style data histogram
set linetype 1 linecolor rgb '#a50f15'
set linetype 2 linecolor rgb "#4292c6"
set linetype 3 linecolor rgb 'gray50'
unset x2tics
unset mxtics

# set with for-iteration
set for [i=1:9] for [j=1:sum [k=1:3] k] label i*10+j sprintf("%d", i*10+j) at i,j

exit # quit here

#
# Plot commands
#
plot sin(x) with lines
plot $DATA using 1:3 with points, $DATA using 1:2 with impulses

plot 'data.dat' index 1 using 1:2 with linespoints linetype 1
plot 'data.dat' using ($3+$8+$21):xtic(1) lt 9 title "Total"
plot 'data.dat' using ($1/100.):3:0 lc var lw 2 title 'Silver'

plot for [i=2:NUM_COLS+1] $DATA using i:xtic(1) lt i-1
plot newhistogram "NoSTM", for [i=2:2+numClasses-1] 'NoSTM.dat' using i:xticlabels(1) title columnhead lt i-1

plot "-" using 1:5,"-"
#
# Input data ncmain.d4 generated by genpat2.f:Tx antenna pattern
#   theta(deg)    phi(deg)  E-theta(dB)  phase     E-phi(dB)    phase
#
    176	0	-200	0	-200	0
    178	0	-200	0	-200	0
    180	0	-200	0	-200	0
e
    176	0	-200	0	-200	0
    178	0	-200	0	-200	0
    180	0	-200	0	-200	0
e

splot '++' using 1:2:(fn($1,$2)):(color($1,$2)) with pm3d title "4 data columns x/y/z/color"

#
# Import command
#
import func(x,y) from 'nonexistent:foobar'

# ***** end of source *****

