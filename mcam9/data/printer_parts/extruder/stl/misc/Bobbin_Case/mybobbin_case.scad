
module b(){
    color("blue")rotate([0,0,0])import("C:/Mcam9/Data/Bobbin_Case/NEW BOTTOM.STL");
};

translate ([0,10,-25])b();

module a(){
import("C:/Mcam9/Data/Bobbin_Case/NEW TOP.STL");
};


difference(){
a();
color("red")translate([4,-82,-12])cube([110,76,10.5]);
};