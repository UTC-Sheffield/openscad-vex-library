//example:
include <BOSL2/std.scad>
use <../VEX.scad>

test1()
    fwdh(3)
    rightangle()
        backh(4)
        test1();
