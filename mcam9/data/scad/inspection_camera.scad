$fa = 5;
$fs = 0.5;

module screws(z = 0) {
  for(tx = [-19, 19], ty = [-10, 10])  translate([tx, ty, z]) children();
}

module common(r = 1.75) {
    difference() {
        union() {
            square([32 + 4.8, 26 + 4.8], center = true);
            screws() circle(r = 2.95);
        }
        square([32, 26], center = true);
        screws() circle(r = r);
    }    
}

module case() {
    difference() {
        union() {
            linear_extrude(height = 11) {
                common();
                for(tx = [-12.5,12.5], ty = [-11.5,11.5]) translate([tx, ty]) difference() {
                    circle(r = 2.2);
                    circle(r = 0.6);
                }
            }
            translate([0, 20, 2.5]) cube([32 + 4.8, 10, 5], center = true);
        }
        translate([0, 0, 10]) cube([32 + 1.6, 26 + 1.6, 2.02], center = true);
        for(tx = [-15, 15]) translate([tx, 21, -0.01]) cylinder(r = 1.25, h = 5.02);
    }
}

module cover() {
    linear_extrude(height = 8) common(r = 1.1);
    difference() {
        union() {
            translate([0, 0, 0.4]) cylinder(r = 6.9, h = 7.6);
            cylinder(r = 4, h = 0.6);
        }
        translate([0, 0, 0.8]) cylinder(r = 6.1, h = 7.21);
        translate([0, 0, -0.01]) cylinder(r = 3.2, h = 0.82);
    }
    translate([0, 20, 1.25]) cube([32 + 4.8, 10, 2.5], center = true);
}

module diffuser() {
    translate([0, 0, 1]) difference() {
        cube([32, 26, 2], center = true);
        cylinder(r = 4, h = 2.02, center = true);
        translate([0, 0, 0.4]) cylinder(r = 6.9, h = 2.02, center = true);
    }
}
module base() {
    difference() {
        union() {
          linear_extrude(height = 5) common(r = 1.1);
          screws() cylinder(r = 4.3, h = 4);    
        }
        translate([0, -14.2, 3.5]) cube([3.5, 3, 3.52], center = true);
        screws(z = -0.01) {
            cylinder(r = 3.1, h = 3.01);
            cylinder(r = 1.75, h = 5.02);    
        }
        
    }
    translate([0, 0, 0.5]) cube([32, 26, 1], center = true);
    
}

translate([-50, 0, 0]) {
    render() cover();
    color("lightblue") diffuser();
}
render() case();
render() translate([50, 0, 0]) base();
    
    