$fa=5; $fs=0.1;

include<e3dv6 simple.scad>;

module hexagon(in_diam, height) {
  cube_x = in_diam/1.75;
  for (r = [-60, 0, 60]) rotate([0,0,r]) cube([cube_x, in_diam, height], center=true);
}

difference(){
	union(){
		cube([35, 12, 55]); // head mounting plate
		
		translate([-12.5,-15,41]) cube([31,27,9]); //e3d mount
		translate([3,-15, 45.5]) cylinder(h=9, r=15.5, center=true);

		translate([16,-15, 9]) cube([31,27,9]); //endstop mount
		translate([31.5,-15, 13.5]) cylinder(h=9, r=15.5, center=true);
	}

	union(){
	
		//head mounting holes
		translate([6.5, 6, 22.5]) rotate([90,0,0]) cylinder(h=12.1, r=1.75, center=true);
		translate([6.5, 6, 32.5]) rotate([90,0,0]) cylinder(h=12.1, r=1.75, center=true);
		translate([28.5, 6, 22.5]) rotate([90,0,0]) cylinder(h=12.1, r=1.75, center=true);
		translate([28.5, 6, 32.5]) rotate([90,0,0]) cylinder(h=12.1, r=1.75, center=true);

		// endstop mounting hole
		translate([31.5,-15, 13.5]) cylinder(h=9.1, r=9.5, center=true);

		//e3d mount 

		translate([3, -15, 45.5]) cube([31.1, 3, 9.1], center=true);
		
		translate([-8, -15, 45.5]) rotate([90,0,0]) cylinder(h=30, r=1.75, center=true); //под винты e3d
		translate([14, -15, 45.5]) rotate([90,0,0]) cylinder(h=30, r=1.75, center=true);
		translate([-8, -27, 45.5]) rotate([90,0,0]) cylinder(h=10, r=3, center=true); //вырезы под головки винтов
		translate([14, -27, 45.5]) rotate([90,0,0]) cylinder(h=10, r=3, center=true);

		translate([-8, -7, 49]) cube([6, 3, 5], center=true); // под гайки
		translate([-8, -7, 45.5]) rotate([90, 90, 0]) hexagon(6,3);
		translate([14, -7, 49]) cube([6, 3, 5], center=true);
		translate([14, -7, 45.5]) rotate([90, 90, 0]) hexagon(6,3);

		translate([3, -15, 50]) scale([1.01, 1.01, 1.01]) e3dv6(); //вырезать из всего этого экструдер

	}
}

//translate([3, -15, 50]) color([1,0,0]) e3dv6();