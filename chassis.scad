//example:
//chassis();
module chassis() {
	height = 3;
	width = 9;
	top_depth = 10;
	//front left side
	onebyoneRSide_fill(length = 7, height = height);
	//back center fill
	translate([12.72 + 3, 0, 0]) onebyoneR_fill(length = 7, width = 11);
	//back left right wall
	translate([12.72 * 11 + 12.72 + 6, 12.72 * 7, 0]) rotate([0, 0, 180]) onebyoneRSide_fill(length = 7, height = height);
	//front right side wall
	translate([2 * 12.72,7 * 12.72 ,0]) onebyoneRSide_fill(length = top_depth, height = height);
	// front left side wall
	translate([10 * 12.72 + 6, (top_depth + 7) * 12.72, 0]) rotate([0, 0, 180]) onebyoneRSide_fill(length = top_depth, height = height);
	//front center fill
	translate([12.72 * 3 + 3, 7*12.72, 0]) onebyoneR_fill(length = top_depth, width = 6); 
	//fin holder for makeshift transmittion
	translate([6 * 12.72 + 3, 0, 3]) rotate([0, -90, 0]) onebyoneR_fill(length = 3, width = 2);
	translate([ 3 + 12.72 * 2,0 * 12.72,  3]) rotate([0, -90, 0]) onebyoneR_fill(length = 2, width = 3);
	translate([ 3 + 12.72 * 10,0 * 12.72,  3]) rotate([0, -90, 0]) onebyoneR_fill(length = 2, width = 3);
	translate([ 3 + 12.72 * 8,15 * 12.72,  3]) rotate([0, -90, 0]) onebyoneR_fill(length = 2, width = 3);
	translate([ 3 + 12.72 * 4,15 * 12.72,  3]) rotate([0, -90, 0]) onebyoneR_fill(length = 2, width = 3);
}
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
