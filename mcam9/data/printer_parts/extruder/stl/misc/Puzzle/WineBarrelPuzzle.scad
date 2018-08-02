//Wine Barrel Puzzle

//epsilon for overlap subtraction, and room to assemble
//Adjust this number if parts are too tight or too loose.
//Gap between pieces should always be 2 * e, so set this as low as your printer can handle.
e = 0.1;

//Crank these up to increase quality and slow down compile/render time
barrel_fn = 300;
ring_fn   = 300;
circle_fn = 15;

barrel_head_dia=30;
barrel_head_rad = barrel_head_dia/2;
barrel_belly_dia=45;
barrel_belly_rad=barrel_belly_dia/2;
barrel_height=45;
barrel_height_half=barrel_height/2;
barrel_line_diameter = 1.5;
barrel_line_rad = barrel_line_diameter/2;
barrel_line1_ratio = 0.75;
barrel_line2_ratio = 0.55;

barrel_height_skew=barrel_height_half / sqrt((barrel_belly_rad * barrel_belly_rad) - (barrel_head_rad * barrel_head_rad));

barrel_line1_angle = asin(barrel_line1_ratio/barrel_height_skew);
barrel_line2_angle = asin(barrel_line2_ratio/barrel_height_skew);

//Must be even number, preferably a pseudo-power of 2:
staves = 8;
stave_angle = 180/staves;
stave_d = 0.3;

//L is the length of one side of the cube, the side of any square piece.
L = barrel_height/5;
l = L/2;
h = barrel_height;
d = barrel_belly_dia;
//Just the tip
t = (d - (3 * L))/2;
2e = 2 * e;

module barrel(){
    translate([0,0,barrel_height_half])
        intersection(){
            cube([barrel_belly_dia + 1, barrel_belly_dia + 1, barrel_height], center=true);
            scale([1,1,barrel_height_skew])
                    union(){
                        difference(){
                            sphere(d=barrel_belly_dia, $fn=barrel_fn);
                            for(angle = [0:stave_angle: 179.9])
                                rotate([90,0,angle+stave_angle/2])
                                    rotate_extrude(convexity = 10, $fn=ring_fn)
                                        translate([barrel_belly_rad,0,0])
                                            rotate([0,0,45])
                                                square([stave_d,stave_d],center=true);
                        }
                        for(angle = [barrel_line1_angle, barrel_line2_angle,
                                -barrel_line1_angle, -barrel_line2_angle]){
                            translate([0,0,sin(angle) * (barrel_belly_rad)])
                                rotate_extrude(convexity = 10, $fn=ring_fn){
                                    translate([cos(angle) * (barrel_belly_rad - barrel_line_rad), 0, 0])
                                        circle(r = barrel_line_rad, $fn=circle_fn);
                                }
                        }

//staves = 16;
//stave_angle = 180/staves;

//                    }
                }
        }
}



module p1(){
    translate([e,e,0])
        difference(){
            cube([L-2e,L-2e,h]);
            translate([-e,-e, h/2 + L - e])
                cube([l+2e,L+2e, l+2e]); 
        }
}

module p2(){
    translate([e,e,-0])
        difference(){
            cube([L-2e,L-2e,h]);
            translate([-e,-e, h/2 - L - l-e])
                cube([l+2e,L+2*e,l+2*L+2e]); 
        }
}

module p3_box(){
    translate([e,0,e])
        difference(){
            cube([L-2e,d,h/2-L-e]);
            translate([-e, d/2-l-e, l-2e])
                cube([L+2e,L+2e,h]);
            translate([-e, d/2-l-e, -e])
                cube([l+2e,L+2e,h]);           
        }
}
module p3(){
    intersection(){
        p3_box();
        translate([L/2,d/2,-h/2-L])
            barrel();
    }
}

module p4_box(){
    translate([0,e,e]){
        difference(){
            cube([d,L-2e,L-2e]);
            translate([d/2-L-l-e,l-2e, -e])
                cube([3*L+2e,L,L+2e]);
        }
    }
}

module p4(){
    intersection(){
        p4_box();
        translate([d/2,L,-h/2+l])
            barrel();
    }
}

module p5_box(){
    translate([e,e,-0])
        difference(){
            cube([t+l-e,L-2e,h]);
            translate([l-2e,-e,h/2-l-e])
                cube([t+2e,L+2e,L+2e]);
        }
}

module p5(){
    intersection(){
        p5_box();
        translate([-L,l,0])
            barrel();
    }
}

module p6_box(){
    translate([0,e,0])
        difference(){
            cube([d,d/2-l-e,h]);
            translate([-e,-e,h/2-l-e])
                cube([d+2e,l+2e,L+2e]);
            translate([d/2-l-e,-e,-e])
                cube([L+2e,d/2-l+2e,h/2-l+2e]);
            translate([d/2-l-e,-e,h/2+l-e])
                cube([L+2e,d/2-l+2e,h/2-l+2e]);
            translate([d/2-l-e,-e,-e])
                cube([L+2e,l+2e,h+2e]);
            translate([d/2-l-e,2*l-2e,-e])
                cube([L+2e,d,h+2e]);
        }
}

module p6(){
    intersection(){
        p6_box();
        translate([d/2,-l,0])
            barrel();
    }
}

module p7_box(){
    translate([e,0,e])
        difference(){
            cube([L-2e,d,L-2e]);
            translate([l-2e,d/2-l-e,-e])
                cube([l+2e,L+2e,L+2e]);
            translate([-e,d/2-L-l-e,l-2e])
                cube([L+2e,L+2e,L+2e]);
            translate([-e,d/2+l-e,l-2e])
                cube([L+2e,L+2e,L+2e]);

        }
}

module p7(){
    intersection(){
        p7_box();
        translate([l,d/2,-h/2+L])
            barrel();
    }
}

//barrel();


//Shift down to touch the bed after subtracting epsilon spacing
translate([0,0,-e]){
    //Line up the Pieces:
    translate([h, h/2, L])

        rotate([90,90,0])
            p1();
    translate([h + 2 * L, h/2, L])
        rotate([90,90,0])
            p2();

    translate([h + 5 * L, d/2, 0])
        rotate([0,0,180])
            p3();
    translate([h + 7 * L, -d/2, 0])
        p3();
    translate([h, h + L, 0])
        translate([0,-d/2,0])
            rotate([90,0,90])
                p4();
    translate([h + 2 * L, h+L, 0])
        translate([0,-d/2,0])
            rotate([90,0,90])
                p4();
                
    translate([h + 4 * L, h+L, 0])
        translate([L,h/2,0])
            rotate([90,-90,0])
                p5();
    translate([h + 6 * L, h+L, 0])
        translate([L,h/2,0])
            rotate([90,-90,0])
                p5();

    translate([h, 2*(h+L)+h/2, 0])
        rotate([90,0,0])
            p6();
    translate([h+1*L + d, 2*(h+L)+h/2, 0])
        rotate([90,0,0])
            p6();
    translate([h+9*L,-h/2, 0])
            p7();
    translate([h+9*L, h+L-h/2, 0])
            p7();
}


/*
//Assembled barrel
union(){
    //barrel();
    translate([0, -L/2, 0])
        p1();
    rotate([0,0,180])
        translate([0, -L/2, 0])
            p2();
    translate([-L/2,-d/2,h/2+L])
        p3();
    rotate([0,180,0])
        translate([-L/2,-d/2,-h/2+L])
            p3();
    translate([-d/2,-L,h/2-l])
        p4();
    rotate([0,0,180])
        translate([-d/2,-L,h/2-l])
            p4();
    translate([L,-l,0])
        p5();
    rotate([0,0,180])
        translate([L,-l,0])
            p5();
    translate([-d/2,l,0])
        p6();
    translate([d/2,-l,0])
        rotate([0,0,180])
            p6();
    translate([-l,-d/2,h/2-L])
        p7();
    translate([-l,d/2,h/2+L])
        rotate([0,180,180])
            p7();
}
*/

