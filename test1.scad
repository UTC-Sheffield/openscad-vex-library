//example:
include <BOSL2/std.scad>
use <VEX.scad>

module oneside(){
    1x2x1x25_C_Channel(anchor=CENTER, spin=90)
        position(BACK+LEFT) color("orange") 1x2x1x25_C_Channel(anchor=BACK+LEFT, orient=DOWN, spin=-90);
        /*union(){
            position(FRONT+RIGHT) back(hole(3)) spacer() position(RIGHT) wheel();
            position(FRONT+LEFT) back(hole(3)) spacer() position(RIGHT) gear36();
            position(BACK+RIGHT) fwd(hole(3)) spacer() position(RIGHT) wheel();        }
        }
        */
}

module postest(){
    1x2x1x25_C_Channel()
        //leftangle() 
        1x2x1x25_C_Channel(orient=DOWN, spin=90);
}

postest();
//oneside();
//xflip() oneside();
//18x18x18(60, 20);
