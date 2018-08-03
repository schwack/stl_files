use <bushing.scad>

$fa = 5;
$fs = 0.5;

function center(T, C = "") = [
    search("X", C) == [] ? 0 : -T[0]/2,
    search("Y", C) == [] ? 0 : -T[1]/2,
    search("Z", C) == [] ? 0 : -T[2]/2
];

module ccube(S, C = "") {
    translate(center(S, C)) cube(S);
}

module LRSym() {
    for(m = [0,1]) mirror([m, 0, 0]) children();
}

module FBSym() {
    for(m = [0,1]) mirror([0, m, 0]) children();
}

module UDSym() {
    for(m = [0,1]) mirror([0, 0, m]) children();
}

module joint() {
    LRSym() for(tz = [-40, 12]) translate([-20, 0, tz]) children();
}

module E3DV6() {
    translate([0, 0, 21.7]) cylinder(r = 2, h = 30);
    translate([0, 0, 6.7]) cylinder(r = 5.5, h = 15);
    translate([0, 0, 3]) cylinder(r = 8, h = 3.7);
    translate([0, 0, -3]) cylinder(r = 6, h = 6);
    translate([0, 0, -6]) cylinder(r = 8, h = 3);
    translate([0, 0, -36]) cylinder(r = 11, h = 30);
    translate([0, 0, -43.1]) cylinder(r = 3, h = 7.1);
    translate([0, -15.5, -49.7]) ccube([16, 20, 11.5], C = "X");
    translate([0, 0, -52.7]) cylinder(r = 3.5, h = 3, $fn = 6);
    translate([0, 0, -54.7]) cylinder(r1 = 0.5, r2 = 2, h = 2);
}

module E3D_cutout() {
    translate([0, 0, 21.7]) cylinder(r = 2.1, h = 30);
    translate([0, 0, 6.7]) cylinder(r = 5.5, h = 15);
    translate([0, 0, -3.2]) cylinder(r = 6.1, h = 6.4);
    translate([0, 0, 3]) cylinder(r = 8.1, h = 3.9);
    translate([0, 0, -6.2]) cylinder(r = 8.1, h = 3.2);
    translate([0, 0, -36]) cylinder(r = 12.5, h = 31);
    for(tx = [-9, 9]) translate([tx, 0, 0]) rotate([90, 0, 0]) 
        cylinder(r = 1.65, h = 29.4, center = true);

} 

module chamfer(C = 0.5) {
    minkowski() {
        union() children();
        UDSym() cylinder(r1 = C, r2 = 0, h = C, $fn = 4);
    }
}

module pin(tol = 0.15) {
    rotate([0, 90, 0]) difference() {
        union() {
            {
                UDSym() translate([0, 0, -2.9])
                    cylinder(r1 = 0.8 - tol/2, r2 = 2 - tol/2, h = 1, center = true);
                cylinder(r = 2 - tol/2, h = 4.8, center = true);
            }
            translate([0, -10, 0]) chamfer(C = 1) ccube([0.4 - tol, 10, 4.8], C = "XZ");
        }
        for(ty = [-1.7, -4]) LRSym() translate([1.3, ty, 0]) 
            cylinder(r = 0.4, h = 7, center = true);
    }
}

module hole(tol = 0.15) {
    translate([0, 4, 0]) {
        rotate([45, 0, 0]) intersection() {
            ccube([11, 4 + tol, 4 + tol], C = "XYZ");
            rotate([0, 90, 0]) cylinder(r = 2.3, h = 6, center = true);                    
        }
        translate([0, -10, 0]) ccube([6, 10, 2.4 + tol], C = "XZ");
        LRSym() translate([5, -0.05, 0]) {
            intersection() {
                rotate([45, 0, 0]) ccube([5, 6/sqrt(2), 6/sqrt(2)], C = "XYZ");
                rotate([0, 90, 0]) cylinder(r2 = 4, r1 = 2.3, h = 5, center = true);
            }
            translate([0, -3, 0]) ccube([5, 6, 6], C = "XYZ");
        }
    }
}

module front_pilar(bushing = false, pilar = false) {
    translate([0, -26.6, 0]) union() {
        if(pilar) difference() {
            ccube([10, 26.6, 12], C="XZ");
            rotate([90, 0, 0]) translate([0, 0, -26.4]) {
                bushing(r = 1.95, h = 10, N = 8, outside_only = true, outside_extra_height = 0.2);
                cylinder(r = 2.5, h = 14);
            }
            hole();
        }
        if(bushing)
            rotate([90, 0, 0]) translate([0, 0, -26.4]) bushing(r = 1.95, h = 10, N = 8);
    }
}
    
module hotend_front() {
    %E3DV6();
    %translate([0, -20, -33]) ccube([25, 10, 25], C = "XY");
    
    color([1, 0.5, 0.5]) {
        joint() front_pilar(bushing = false, pilar = true);   
                
        LRSym() translate([-20, -26.6, -37]) ccube([2.4, 10, 44], C="X");
        
        difference() {
            translate([0, -26.6, -33]) union() {
                *ccube([50, 3, 28], C = "X");
                translate([0, 0, -3]) ccube([50, 6, 44], C = "X");
                *translate([0, 0, -2]) ccube([27, 10, 2], C = "X");
            }
            translate([0, -20, -20.4]) {
                ccube([26, 10.2, 26], C = "XYZ");
                rotate([90, 0, 0]) {
                    cylinder(r = 12, h = 15, center = true);
                    LRSym() FBSym() translate([10, 10, 0]) cylinder(r = 1, h = 15, center = true);
                }
            }
        }
        
        difference() {
            union() {
                translate([0, -26.6, 1]) ccube([27, 26.4, 11], C = "XZ");
                translate([0, -26.6, 1]) ccube([50, 11, 11], C = "XZ");
                translate([0, -26.6, 4.5]) ccube([50, 20.6, 4], C = "XZ");
            }
            E3D_cutout();
            LRSym() translate([-9, -12, -3]) ccube([6, 3, 12], C = "X");
            translate([0, -20, -6]) ccube([6, 5, 15], C = "X");
            LRSym() translate([-15, -20, -6]) rotate([0, 20, 0]) ccube([6, 4, 15], C = "X");
        }
    }
}

module hotend_back() {
    %E3DV6();
    
    color([0.5, 1, 0.5]) difference() {
        union() {
            hull() {
                translate([0, 9.6, 0]) ccube([23, 0.2, 10], C = "XZ");
                translate([0, 0.2, 0]) ccube([27, 0.2, 10], C = "XZ");
            }
            translate([0, 0, 30]) {
                ccube([8, 10, 15], C = "XZ");
                cylinder(r = 4, h = 15, center = true);
            }
            translate([0, 6, 0]) hull() {
                ccube([23, 4, 10], C = "XZ");
                translate([0, 0, 30]) ccube([8, 4, 15], C = "XZ");
            }
        }
        E3D_cutout();
        LRSym() translate([-9, 10.01, 0]) 
            rotate([90, 0, 0]) cylinder(r = 3.2, h = 3);
    }
}

module rest(print = false) {
    color([1, 1, 0.5]) difference() {
        union() {
            for(tz = [-40, 12]) translate([0, -22.6, tz]) {
                pin();
                translate([0, -10, 0]) ccube([8, 10, 0.8], C="XZ");
                rotate([0, 90, 0]) {
                    cylinder(r = 0.8, h = 8, center = true);
                    if(print) translate([0, 0, 3.9]) cylinder(r = 4, h = 0.2, center = true);
                }
            }
            translate([0, -50, -14]) ccube([8, 21, 90], C = "XZ");     
        }
        
        D = 4; H = 14; R = 0.5; W = 0.8;
        for(tz = [12, -40], n = [0:1:2]) translate([0, -28.5, tz]) {
            UDSym() translate([0, -n * D, H/2 + 1]) 
                hull() FBSym() UDSym() translate([0, D/2-R-W/2, H/2-R]) 
                    rotate([0, 90, 0]) cylinder(r = R, h = 9, center = true);
            translate([0, -2.5*D, 0]) ccube([9, D/2, 3], C = "XZ");
        }
        
        for(tz = [31, -59]) translate([0, -50, tz]) {
            ccube([9, 15.5, 2], C="XZ");
            translate([0, -0.1, 0]) ccube([9, 2.1, 15.5], C="XZ");
            translate([0, 8, 0]) cylinder(r = 1.3, h = 35, center = true);
        }
    }
}

module carrigae() {
    %LRSym() translate([-20, 0, -29]) ccube([10, 30, 30], C = "XY");
    %joint() rotate([90, 0, 0]) translate([0, 0, -10]) cylinder(r = 2, h = 22);
    %for(T = [[-17.55, 21], [17.55, 21], [-15, -10], [15,-10], [-17.55,-41], [17.55,-41]])
        translate([T[0], 18.5, T[1]]) rotate([90, 0, 0]) cylinder(r = 1.65, h = 5);
    
    color([0.5, 0.5, 1]) difference() {
        union() {
            translate([0, 15, -10.5]) ccube([50, 3,  71], C = "XZ");
            
            joint() difference() {
                ccube([10, 18, 12], C = "XZ");
                rotate([-90, 0, 0]) translate([0, 0, -0.1]) {
                    cylinder(r = 2.15, h = 4);
                    translate([0, 0, 3.9]) cylinder(r1 = 2.15, r2 = 2.05, h = 10.2);
                    ccube([3.6, 3.6, 14.2], C = "XY");
                }
            }
            
            LRSym() translate([-20, 0, -29]) difference() {
                translate([5.8, 8, -7]) ccube([1.6,10, 45], C = "X");
                translate([0, 0, 15]) rotate([0, 90, 0]) {
                    cylinder(r = 12, h = 15, center = true);
                    LRSym() FBSym() translate([12, 12, 0]) cylinder(r = 1.7, h = 15, center = true);
                }
            }
        }
        
        for(T = [[-17.55, 21], [17.55, 21], [-15, -10], [15,-10]])
            translate([T[0], 4.99, T[1]]) rotate([-90, 0, 0]) {
                cylinder(r = 3.2, h = 12.01);
                cylinder(r = 1.7, h = 13.02);
            }
        
        for(tx = [-17.55, 17.55]) translate([tx, 13, -41]) {
            translate([-3*sign(tx), 0, 0]) ccube([12.2, 3, 6.2], C = "XZ");
            rotate([-90, 0, 0]) translate([0, 0, 1.5]) cylinder(r = 1.65, h = 4);
        }
    }
}

module drill_template() {
    translate([10, 0, 0]) difference() {
        ccube([68, 20, 20], C = "XYZ");
        translate([0, -10, 0])  {
            ccube([72, 15.5, 2], C="XZ");
            translate([0, -0.1, 0]) ccube([72, 2.1, 15.5], C="XZ");
        }
        for(tx = [-30, 10, 30]) translate([tx, -2, 0]) 
            cylinder(r = 1.7, h = 21, center = true);
    }
}

module rest_mount() {
    color([1, 0.5, 1]) difference() {
        union() {
            translate([ 0, -0.8, 0]) ccube([31, 0.8, 110], C = "XZ");
            UDSym() {
                translate([0, 0, 42.5]) ccube([31, 20, 10], C="XZ");
                translate([0, 0, 45]) ccube([31, 5, 20], C="XZ");
                translate([0, -0.8, 65]) ccube([31, 5.8, 20], C="XZ");
            }
        }
        for(tz = [45, -45]) translate([0, 0, tz]) {
            ccube([32, 15.5, 2], C="XZ");
            ccube([32, 2, 15.5], C="XZ");
        }
        UDSym() translate([0, 0, 62.5]) hull() 
            UDSym() translate([0, 5.5, -3]) rotate([90, 0, 0]) cylinder(r = 2.4, h = 6.8);
    }
}

module wiper() {
       
    color([0.5, 1, 1]) union() {
        LRSym() translate([-20, 0, 0]) difference() {
            ccube([8, 55, 3], C = "X");
            translate([0, 5, -0.5]) cylinder(r = 1.7, h = 4);
        }
        translate([0, 30, 0]) difference() {
            ccube([40, 25, 10], C = "X");
            translate([0, 1.5, 8]) ccube([36, 25, 2.01], C = "X");
            for(ty = [6:7:20]) translate([0, ty, 3.01]) ccube([33, 3.5, 7], C = "XY");
            for(tx =[-15:6:15]) translate([tx, 14.5, 3.01]) ccube([3, 17, 7], C = "XY");
            hull() for(tx = [-7, 7], ty = [16, 26]) 
                translate([tx, ty, -0.01]) cylinder(r = 4, h = 10.02);
        }        
        translate([0, 30, 0]) {
            ccube([2.4, 23, 3], C = "X");
            translate([0, 22.6, 0]) ccube([2.4, 2.4, 7], C = "X");
        }
    }
}

module wiper_mold1() {
    
    module nozzle() {
        cylinder(r1 = 0.25, r2 = 1.5, h = 2.02);
    }
    
    module path_element(corners) {
        hull() for(T = corners) translate(T) children();
    }
    
    difference() {
        union() {
            translate([0, -2.4, 0]) ccube([41 + 3.2, 26 + 4.8, 7], C = "X");
        }
        translate([0, 12.5, -0.01]) difference() {
            ccube([41, 26, 7.02], C = "XY");
            translate([0, 4.5, 4]) {
                path_element([[-7, 9, 2.7], [-7, 0, 2.7]]) cylinder(r = 0.4, h = 0.32);
                path_element([[-7, 9, 3.5], [-7, 0, 1.5]]) nozzle();
                path_element([[-7, -1, 1.5], [-7, 1, 1.5], [-1.5, 0, 1.5]]) nozzle();
                translate([0, 0, 1.5]) nozzle();
                path_element([[1.5, 0, 1.5], [7, 0, 1.5]]) nozzle();
                hull() {
                    translate([7, 0, 1.5]) cylinder(r = 2.5, h = 2);
                    translate([7, 8, 1.5]) nozzle();
                }
                translate([7, 0, 0]) cylinder(r = 2.5, h = 3.01);
            }
        }
    }
}

module wiper_mold2() {
    union() {
        difference() {
            hull() {
                LRSym() translate([-7, 16, 0]) cylinder(r = 3.5, h = 5);
                translate([0, 25, 0]) ccube([21, 0.5, 5], C = "X");
            }
            translate([0, 12, -0.01]) ccube([3, 14, 5.02], C = "X");
        }            

        translate([0, 25.5, 0]) ccube([41 + 3.2, 2.4, 3], C="X");
        translate([ 7, 14, 3.99]) ccube([6, 6, 3.02], C = "X");
        translate([-7, 14, 3.99]) {
            ccube([5, 11, 3.02], C = "X");
            intersection() {
                hull() {
                    translate([0, 12, 3]) cylinder(r = 2, h = 2.02);
                    translate([0, 3, 3]) cylinder(r2 = 0.5, r1 = 2, h = .502);
                }
                ccube([5, 11, 5], C = "X");
            }
        }
    }
}
    
module print() {
    translate([55, 0, 26.6]) rotate([90, 0, 0]) {
        // for dual extrusion render both parts separately
        hotend_front(); 
        joint() front_pilar(bushing = true, pilar = false);
    }
    translate([55, -15, 10]) rotate([-90, 0, 180]) hotend_back();
    
    translate([110, 0, 18]) rotate([-90, 0, 180]) carrigae();
    
    translate([-56, 28, 4]) rotate([0, 90, 90]) rest(print = false);
    translate([ 48,  0, 4]) rotate([0, 90, -90]) rest(print = false);
    
    translate([-65, -50, 0]) wiper();
    translate([-65, 26, 7]) rotate([0, 180, 0]) wiper_mold1();
    translate([-65, 35, 0]) rotate([0, 0, 180]) wiper_mold2();

    // only here for reference
    *for(ty = [4]) translate([0, -ty, 15.5]) rotate([0, 90, 0]) rest_mount();
    *translate([-10, 12, 10]) rotate([-90, 0, 0]) drill_template();
}

module test() {
    color("red") {
        translate([0, 0, 3]) wiper_mold1();
        wiper_mold2();
    }
    translate([0, -30, 0]) wiper();
}

module animate() {
    
    module interpolate(ts, ps, te, pe) {
        translate(ps + (pe - ps)*($t - ts)/(te - ts)) children();
    }
    
    module hotend_path() {
        if($t < 0.2) {
            interpolate(0, [-7, 15, 0], 0.2, [-7, 0, 0]) children();
        } else if($t < 0.4) {
            interpolate(0.2, [-7, 0, 0], 0.4, [0, 0, 0]) children();
        } else if($t < 0.6) {
            children();
        } else if($t < 0.8) {
            interpolate(0.6, [0, 0, 0], 0.8, [7, 0, 0]) children();
        } else {
            interpolate(0.8, [7, 0, 0], 1.0, [7, 15, 0]) children();
        } 
    }
    
    module carrigae_path() {
        hotend_path() {
            if($t < 0.4) { 
                children(); 
            } else if($t < 0.5) {
                interpolate(0.4, [0, 0, 0], 0.5, [0, 15, 0]) children();
            } else if($t < 0.6) {
                interpolate(0.5, [0, 15, 0], 0.6, [0, 0, 0]) children();
            } else {
                children();
            }
        }
    }
    
    translate([-20 , 0, 0]) rest();
    hotend_path() {
        hotend_front();
        hotend_back();
    }
    carrigae_path() carrigae();
}

module preview() {
    carrigae();
    hotend_front();
    hotend_back();

    *translate([0, -50.8, -14]) rest_mount();
    for(tx = [-20, 20]) 
        translate([tx , 0, 0]) rest();


    translate([0, -47, -63]) {
        wiper();
        color("gray") translate([0, 30, 5]) difference() {
            ccube([32, 24.99, 4.98], C = "X");
            translate([0, 0, -2]) wiper_mold1();
            translate([0, 0, -5]) wiper_mold2();
        }
    }
}


*test();
*animate();
print();
!preview();

