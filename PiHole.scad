//Shut your Pi Hole! 
//An OpenSCAD library to assist with designing Raspberry Pi accessories

//This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
//© 2016 Dale Price

//Pi dimensions sourced from https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/README.md

//Mounting holes for a Raspberry Pi of the specified version
//	Parameters
//		board: the version of the raspberry pi to generate holes for
//			supports "1B+", "2B", "3B", and "Zero"
//		depth: the depth of the holes in mm
module piHoles (board, depth) {
	hd = 2.8; //radius of pi mounting holes plus a tiny bit extra to account for shrinkage when 3D printing
	hr = hd/2;

	//preview of the board itself
	% piBoard(board);
	
	if(board == "1B+" || board == "2B" || board == "3B") {
		//mounting holes
		translate([3.5, 3.5, -depth]) cylinder(d=hd, h=depth);
		translate([61.5, 3.5, -depth]) cylinder(d=hd, h=depth);
		translate([3.5, 52.5, -depth]) cylinder(d=hd, h=depth);
		translate([61.5, 52.5, -depth]) cylinder(d=hd, h=depth);
	}
	else if(board == "Zero") {
		translate([3.5, 3.5, -depth]) cylinder(d=hd, h=depth);
		translate([61.5, 3.5, -depth]) cylinder(d=hd, h=depth);
		translate([3.5, 26.5, -depth]) cylinder(d=hd, h=depth);
		translate([61.5, 26.5, -depth]) cylinder(d=hd, h=depth);
	}
}

//Preview of board dimensions for Raspberry Pi of the specified version
module piBoard (board) {
	if(board == "1B+" || board == "2B" || board == "3B") {
		cube([85, 56, 1], center=false);
	}
	else if(board == "Zero") {
		cube([65, 30, 1], center=false);
	}
}
