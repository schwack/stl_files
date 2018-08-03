
/*
    Copy of http://www.thingiverse.com/thing:38356 by Hexdoll, published Dec 18, 2012

	modified by sprue to have rounded corners, tighten up hinges (made hinge on lid fatter),
	add a catch.
*/
bobbin_diameter=21;
bobbin_height=12;
size_x=5;
size_y=5;
x_separation=2;
y_separation=5;
hinge_width=6;
walls = 3;
box_corner_radius=3;
catch_width=10;           // Make zero to disable generation of a catch
catch_height=3;
catch_socket_width=catch_width+1;
catch_socket_height=catch_height+1;

case_x = (bobbin_diameter*size_x)+(x_separation*(size_x-1))+(walls*2);
case_y = (bobbin_height*size_y)+(y_separation*(size_y-1))+walls*2;
case_z = (bobbin_diameter/2)+walls;

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}

module bobbins(size_x=4, size_y=4)
{
	#translate([bobbin_diameter/2,0,bobbin_diameter/2])
	for(x=[0:size_x-1])
	{
		for (y=[0:size_y-1])
		{
			translate([x*(bobbin_diameter+x_separation), y*(bobbin_height+y_separation), 0])
			rotate([-90,0,0])
			cylinder(r=bobbin_diameter/2, h=bobbin_height);
		}
	}
}

module top()
{
	union()
	{
		difference()
		{
            union() {
//			cube([case_x, case_y, case_z]);
                translate([box_corner_radius, box_corner_radius, 0]){
                    minkowski() {
                        cube([case_x-(box_corner_radius*2),case_y-(box_corner_radius*2),case_z-1]);
                        cylinder(r=box_corner_radius,h=1);
                    }
               }

            }

			translate([walls, walls, walls])
			cube([case_x-(walls*2), case_y-(walls*2), case_z]);

			translate([walls+(bobbin_diameter/2),(bobbin_height/2)+walls,0])
			for(x=[0:size_x-1])
			{
				for (y=[0:size_y-1])
				{
					translate([x*(bobbin_diameter+x_separation), y*(bobbin_height+y_separation), -1])
					cube([bobbin_diameter-2, bobbin_height-2, walls*3], center=true);
				}
			}
			rotate([-90,-90,0])
                translate([0,0,case_y/2])
			        fillet(box_corner_radius,case_y);
			rotate([90,-90,0])
                translate([0,-case_x,-case_y/2])
			        fillet(box_corner_radius,case_y); 
			rotate([0,-90,0])
                translate([0,0,-case_x/2])
			        fillet(box_corner_radius,case_x); 
 		    rotate([180,-90,0])
                translate([0,-case_y,case_x/2])
			        fillet(box_corner_radius,case_x); 
		}
		//hinges
		for (i=[
			hinge_width+.5+box_corner_radius,
			case_x-(hinge_width*2)-1.5-box_corner_radius])
		{
			translate([i,0,case_z])
			rotate([-90,0,-90])
			hinge(hinge_width+1);
		}
        // add a catch
		if (catch_width != 0) {
		    difference() {
		        translate([(case_x-catch_width)/2,case_y-walls,case_z])
                    cube([catch_width,walls,catch_height]);
                union() {
		            translate([(case_x-catch_width)/2,case_y-walls/2,case_z])
                        cube([catch_width,walls/2,catch_height-1]);
		            translate([(case_x-catch_width)/2,case_y-walls/3,case_z])
                        cube([catch_width,walls/2,catch_height]);
                }
            }
		}
	}
}

module bottom()
{
	union()
	{
		difference()
		{
            union() {
//			cube([case_x, case_y, case_z]);
                translate([box_corner_radius, box_corner_radius, 0]){
                    minkowski() {
                        cube([case_x-(box_corner_radius*2),case_y-(box_corner_radius*2),case_z-1]);
                        cylinder(r=box_corner_radius,h=1);
                    }
               }
            }
			translate([walls,walls,walls])
			bobbins(size_x=size_x, size_y=size_y);

			rotate([-90,-90,0])
                translate([0,0,case_y/2])
			        fillet(box_corner_radius,case_y);
			rotate([90,-90,0])
                translate([0,-case_x,-case_y/2])
			        fillet(box_corner_radius,case_y); 
			rotate([0,-90,0])
                translate([0,0,-case_x/2])
			        fillet(box_corner_radius,case_x); 
 		    rotate([180,-90,0])
                translate([0,-case_y,case_x/2])
			        fillet(box_corner_radius,case_x);
		    // add the catch socket
		    if (catch_width != 0) {
		        translate([(case_x-catch_socket_width)/2,case_y-walls,case_z-catch_socket_height])
                        cube([catch_socket_width,walls/2,catch_socket_height]);
		        translate([(case_x-catch_socket_width)/2,case_y-walls,case_z-catch_socket_height])
                        cube([catch_socket_width,walls-1,2]);
		    }
		}

		//hinges
		for (i=[
			box_corner_radius,
			(hinge_width*2)+2+box_corner_radius,
			case_x-(hinge_width*3)-2 - box_corner_radius,
			case_x-hinge_width -box_corner_radius])
		{
			translate([i,0,case_z])
			rotate([-90,0,-90])
			hinge();
		}
	}
}

module hinge(width=hinge_width, hole=2)
{
	difference()
	{
		union()
		{
			linear_extrude(height=width)
			polygon(points=[
				[-1,0],
				[hole+6,0],
				[0, case_z],
				[-1, case_z]
			]);

			translate([(hole+6)/2,0,0])
			cylinder(r=(hole+6)/2, h=width);
		}

		translate([(hole+6)/2,0,-1])
		cylinder(r=hole/2, h=width+2, $fn=12);
	}	
}

module assembled()
{
	translate([case_x,0,case_z*2])
	rotate([0,180,0])	
	top();
	
	bottom();
}

//assembled();
$fn=50;
//top();
rotate(a=[0,0,180])
translate([-case_x,10,0])
bottom();