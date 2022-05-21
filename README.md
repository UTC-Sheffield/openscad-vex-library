# scad-vex-library

Attempting to do super quick VEX Designs in code. 

This was a library to build vex parts with a 3D printer and openSCAD, so it will take a fair amount of work. I don't know how easy it will be to paramatize attachmentment points using hole distances etc. 

VEX V5 is the robotics kit we use for VEX Robotics Competetion, where 2 of our teams have Qualified for the World Championships. 


## Syntax Ideas

```openscad
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
```

## Feature ideas
 
 use mirror() and maybe a half(function)  to beable to code one side of a robot. To make this work we will be taking inspiration from and using https://github.com/revarbat/BOSL2/
 
 Measure the bounding box in inches (do we need to use https://github.com/thehans/FunctionalOpenSCAD so we know how big everything is?)
