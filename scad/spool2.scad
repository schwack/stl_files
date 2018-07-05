$fn=70;


module a(){
import("C:/Mcam9/Data/WALL.STL");

difference (){
translate([0,-6.25,0])import("C:/Mcam9/Data/FOOT.STL");
    translate([33,-6,-1])cylinder(5,1.5,1.5);
    translate([-33,-6,-1])cylinder(5,1.5,1.5);
    translate([33,-6,1])cylinder(3,1.5,3.5);
    translate([-33,-6,1])cylinder(3,1.5,3.5);
};
};

a();
rotate ([0,0,180])translate([0,50,0])a();
translate ([0,0,2.5])b();
translate ([-1,-35,0])cube([2,20,2.5]);

difference (){
  rotate([90,0,0])translate([0,20,0])cylinder(50,5,5); 
  rotate([90,0,0])translate([0,20,-1])cylinder(52,4.25,4.25); 
    
};

difference (){
  rotate([90,0,0])translate([0,20,0])cylinder(2,7.5,7.5); 
  rotate([90,0,0])translate([0,20,-1])cylinder(52,4.75,4.75); 
    
};
difference (){
  rotate([90,0,0])translate([0,20,48])cylinder(2,7.5,7.5); 
  rotate([90,0,0])translate([0,20,-1])cylinder(52,4.75,4.75); 
    
};
module b(){
difference (){
    union(){rotate([90,0,0])translate([0,11.730,3])cylinder(44,.73,.73); 
  color("white")translate([-.5,-47.5,0])cube([1,45,11]);}; 
  rotate([45,0,0])translate([-2,-20,-1])cube([4,45,12.5]);
  rotate([-45,0,0])translate([-2,-63,-36])cube([4,45,12.5]); 
    };
    
};