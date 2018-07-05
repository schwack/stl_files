$fn=50;

import("C:/Mcam9/Data/SHARPENING_STONER.STL");
difference (){
translate([-47.5,-20])cube([95,40,2]);

translate([.5,0,-.5])tube();
rotate(270,0,0)translate([28,0,-.5])tube();
    rotate(180,0,0){
translate([.5,0,-.5])tube();
rotate(270,0,0)translate([28,0,-.5])tube();
    };
};
module tube(){
    translate([-47.5,50,2])rotate([90,0,0])
    difference(){cylinder (100,1.2,1.2);
       translate([0,0,-1])cylinder(102,.5,.5);
         translate([2,0,-1])rotate([90,-90,0])cube([104,4,1.5]);
         translate([1.5,0,-1.1])rotate([0,-90,0])cube([104,4,1.5]);
        };
    
}