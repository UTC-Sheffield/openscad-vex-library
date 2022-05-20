//example:
include <BOSL2/std.scad>
include <VEX.scad>



scale(2) cube(10, center=true);

1x1x1x25_C_Channel();
translate(holes(2,0,0)) rotate([0, 90, 90])
    1x2x1x25_C_Channel();
color("green") translate(holes(2,25,0)) rotate([0, 90, 90]) mirror([0,0,1])
    1x2x1x25_C_Channel();


