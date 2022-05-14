# scad-vex-library

Attempting to do super quick VEX Designs in code. 

This was a library to build vex parts with a 3D printer and openSCAD, so it will take a fair amount of work. I don't know how easy it will be to paramatize attachmentment points using hole distances etc. 

VEX V5 is the robotics kit we use for VEX Robotics Competetion, where 2 of our teams have Qualified for the World Championships. 


## Syntax Ideas

```openscad


1x1x35Aluminum_Angle();
translate(holes([0,2,1]))
    rotate([90,0,0])
        1x2x1x25_C_Channel();


```
