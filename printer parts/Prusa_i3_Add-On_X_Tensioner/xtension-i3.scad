/*
 * Prusa i3 Instant X Tensioner Add-On
 * by Thinkyhead
 * 18 Nov 2014
 *
 * This is a simple add-on tensioner for the X-axis
 * made to fit most Prusa i3 printers, so you don't
 * have to waste plastic printing a whole new X-idler!
 *
 * Add an M3 nut and screw to make the part
 */

include_groove = true;
stronger_print = false;

idler_z_offset = -0.5;

x = 0; y = 1; z = 2;

xend_hole = [39,9.5,30];

slop = 0.1;
r3mm = 3/2;
r4mm = 4/2;
hole_3mm = r3mm + slop;
hole_4mm = r4mm + slop;
nut_3mm = 6/2 + slop;
nut_4mm = 7.7/2 + slop;
nutd_3mm = 2.4 + slop;
nutd_4mm = 3.2 + slop;
nut_ratio = 0.88;

nut_cube_3mm = [nutd_3mm, nut_3mm * nut_ratio * 2, nut_3mm * 2];
nut_cube_4mm = [nutd_4mm, nut_4mm * nut_ratio * 2, nut_4mm * 2];

// The size of the 624 or other bearing
bearing_diameter = 13;
bearing_depth = 5;
bearing_hole_radius = r4mm;

cap_thickness = 2;
xcap_inner = xend_hole + [-xend_hole[x]+cap_thickness,0,0];
xcap_outer = xcap_inner + [0,4,4];

xten_block_depth = 8;

xten_extra = 4;
xten_narrow = 0;
xten_cutout = bearing_depth+1.5;
xten_height = 10;
xten_size = xend_hole + [xten_extra,-xten_narrow,-xend_hole[z]+xten_height];
xten_wall = xten_size + [0, -(xten_size[y]+xten_cutout)/2, 0];

module screw_hole() {
	rotate([0,90]) cylinder(r=hole_3mm, h=100, center=true, $fn=18);
}

module bolt(r=r3mm, h=15) {
	$fn = 24;
  translate([0,0,-h/2]) {
	  translate([0,0,h/2+0.5]) cylinder(r1=r+1,r2=r+0.5, h=1, center=true);
    cylinder(r=r, h=h, center=true);
  }
}
module washer(od=7,id=3.2,h=0.5) {
	$fn = 16;
  translate([0,0,h/2]) {
  	difference() {
	    cylinder(r=od/2, h=h, center=true);
			cylinder(r=id/2, h=h+0.2, center=true);
  	}
  }
}

module round_box(size=[1,1,1], r=0.1, center=false) {
	minkowski() {
		cube(size-[0,r*2,r*2], center=center);
		rotate([0,90]) cylinder(r=r, h=0.01, center=center, $fn=24);
	}
}

module endpiece() {
	difference() {
		union() {
			translate([xcap_outer[x]/2,0]) round_box(xcap_outer, r=2, center=true);
			translate([-xcap_inner[x]/2,0]) round_box(xcap_inner, r=1, center=true);
		}
		translate([0,0,idler_z_offset]) {
			screw_hole();
			// for(z=[-1,1]) translate([0,0,z*8]) rotate([0,90]) cylinder(r=xend_hole[y]/2,h=cap_thickness*2+0.1,center=true);
			s=xcap_inner+[10,-2,-xcap_inner[z]*2/3];
				for(z=[1,-1]) translate([0,0,z*8]) round_box(s,r=1,center=true);
		}
	}
}

module tensioner() {
	support_thickness = 0.4;
	xten_block = xten_size + [-xten_size[x] + xten_block_depth, xten_narrow, 0];
	ddiff = (xten_size[y] - bearing_depth) / 2;
	difference() {

		// + POSITIVE SPACE

		union() {
			// Nut Trap block
			translate([(xten_size[x]-xten_block_depth)/2, 0]) cube(xten_block, center=true);

			// Two sides of the holder
			for(m=[0,1]) mirror([0,m]) {
				translate([0,(xten_size[y]-xten_wall[y])/2]) {
					cube(xten_wall, center=true);
					translate([-xten_size[x]/2, 0])
						rotate([90,0])
							cylinder(r=xten_size[z]/2, h=xten_wall[y], center=true, $fn=24);
				}
				// Bearing center grips
				cone_h=(xten_cutout-bearing_depth)/2;
					translate([-xten_size[x]/2, xten_cutout/2-cone_h/2, 0])
						rotate([90,0])
							cylinder(r1=xten_size[z]/2, r2=bearing_hole_radius+1, h=cone_h, center=true, $fn=24);
			}
		}

		// - NEGATIVE SPACE

		// nut trap
		translate([(xten_size[x]-xten_block_depth)/2, 0]) {
			rotate([0,90]) cylinder(r=nut_3mm, h=nutd_3mm, center=true, $fn=6);
			translate([0,0,nut_3mm]) cube(nut_cube_3mm, center=true);
		}

		// bearing screw hole
		translate([-xten_size[x]/2, 0]) rotate([90,0]) cylinder(r=bearing_hole_radius, h=xten_size[y]+1, center=true, $fn=18);

		// M4 groove for alignment
		if (include_groove) {
			translate([-7,0]) rotate([90,0]) hull() {
				for(n=[-1,1]) translate([n*3,0]) cylinder(r=hole_4mm, h=xten_size[y]+10, center=true, $fn=18);
			}
		}

		screw_hole();
	}

	// supports if needed
	if (stronger_print) {
		color([0.5,0.8,0.8]) {
			translate([-xten_size[x]/2, xten_cutout/2-cone_h/2, 0])
				rotate([90,0]) difference() {
					cylinder(r=r4mm+0.8,h=bearing_depth,center=true, $fn=12);
					cylinder(r=r4mm+0.3,h=bearing_depth+0.1,center=true, $fn=12);
				}

			assign(supp=[xten_wall[x]-xten_block_depth-10,xten_cutout+0.1,support_thickness],zpos=(xten_height-support_thickness)/2)
				translate([-xten_block_depth/2,0])
					for(n=[-1,1]) translate([0,0,zpos*n]) cube(supp, center=true);
		}
	}

}

module assemble() {
	// Align to the center of the idler
	translate([-10,14,30.25]) {
		// Draw the endpiece in place
		translate([xend_hole[x]/2,0]) {
			color([0.2,0.9,0.4]) endpiece();
			translate([2.05,0, idler_z_offset]) rotate([0,90]) {
				translate([0,0,0.55]) color([0.5,0.5,0.5,0.5]) bolt(h=20);
				color([0.8,0.8,0.8,0.5]) washer();
			}
		}

		// Draw the tensioner in place
		translate([-10+cap_thickness*2-xten_extra/2,0,idler_z_offset]) {
			tensioner();

			// Show where the 624 bearing goes
			translate([0,0,idler_z_offset]) color([1,1,1,0.4]) translate([-xten_size[x]/2,0]) rotate([90,0]) {
				difference() {
					cylinder(r=bearing_diameter/2, h=bearing_depth, center=true, $fn=48);
					cylinder(r=bearing_hole_radius, h=bearing_depth+0.1, center=true, $fn=24);
				}
			}
		}
	}

	// Show the x-idler
	color([1,1,1,0.25]) translate([0,0,60]) rotate([0,180,90]) import("x-idler.stl");
}

module print() {
	translate([0,0,xcap_outer[x]]) rotate([0,90]) endpiece();
	if (stronger_print)
		translate([0,15,xten_size[y]/2]) rotate([90,0]) tensioner();
	else
		translate([0,15,xten_size[z]/2]) tensioner();
}

assemble();
// print();
// for(x=[-10:10],y=[-10:10],z=[-10,10]) translate([x*2,y*2,z*2]) %cube(1);

