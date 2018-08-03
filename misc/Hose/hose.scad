

union(){
color("green")import("D:/stl_files/HOSE3.STL");

difference(){rotate([90,0,0])translate([-17.5,-17.5,-14])import("D:/stl_files/garden_hose_part.STL");
    translate([-10,-23,-10])cube([20,20,20]);
};};
