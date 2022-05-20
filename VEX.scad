
//modules
module onebyoneR(){
	ext_height = 3;
	onebyoneR_points = [[4.08,-6.359],[6.359, -4.08],[6.539,4.08],[4.08,6.539],[-4.08,6.539],[-6.539,4.08],[-6.539,-4.08],[-4.08,-6.539]];
	translate([6.36, 6.36,1.5]){
		difference() {
			linear_extrude(height = ext_height, center = true, convexity = 10, twist = 0){
				polygon(onebyoneR_points);
			}
				cube([4.574, 4.574, ext_height+ 1], center = true);
		}
	}
}

module onebyoneRSide(){
	translate([0, 12.72, 0]){
		rotate([0, 0, -90]){
			translate([0, 3, 0]) onebyoneR();
			translate ([10.439, 0, 0,]) rotate([0,0,90]) cube([3, 8.16, 3]);
			translate ([0, 3, 3]) rotate([90, 0, 0]) onebyoneR();
		}
	}
}

module onebyoneR_fill(length = 1, width = 1){
	for (i=[0:1:length - 1]){
		translate([0, i * 12.72, 0,]) onebyoneR();
		for (a=[0:1:width - 1]){
			translate([a*12.72,i * 12.72, 0]) onebyoneR();
		//echo("Finished one bottom loop");
		}
		//echo("finished one top loop");
	}
}
module onebyoneRSide_fill(length = 1, height = 1){
	for (i=[0:1:length - 1]){
		translate([0, i * 12.72, 0,]) onebyoneRSide();
	}
	translate([3, 0, 3]) rotate([0, -90, 0]) onebyoneR_fill(length = length, width = height);	
}

module 1x1x35_Angle(){
    onebyoneRSide_fill(35, 1);
}

module 1x2x1x25_C_Channel(){
    onebyoneRSide_fill(25, 2);
    mirror([1,0,0]) translate(holes(-2,0,0))
        onebyoneRSide_fill(25, 2);
}

module 1x1x1x25_C_Channel(){
    onebyoneRSide_fill(25, 1);
    mirror([1,0,0]) translate(holes(-2,0,0))
        onebyoneRSide_fill(25, 1);
}

function holes(x,y,z)
    =[x*12.72, y*12.72, z*12.72];
