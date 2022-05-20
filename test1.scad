//example:
include <BOSL2/std.scad>
use <VEX.scad>

//#bounding_box()
module oneside(){
    1x2x1x25_C_Channel(spin=90, anchor=CENTER)
        position(FRONT+RIGHT) 1x2x1x25_C_Channel(orient=DOWN, spin=-90)
        union(){
            position(FRONT+RIGHT) back(hole(3)) spacer() position(RIGHT) wheel();
            position(FRONT+LEFT) back(hole(3)) spacer() position(RIGHT) gear36();
            position(BACK+RIGHT) fwd(hole(3)) spacer() position(RIGHT) wheel();
        }
}

oneside();
xflip() oneside();

//

