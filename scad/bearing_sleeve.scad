$fn=80;
module lip(){
difference (){
cylinder (.9,6,6);
    translate([0,0,-.5])
cylinder(2,4.8,4.8);
};
};
module body(){
difference (){
cylinder (6.25,5.05,5.05);
    translate([0,0,-.5])
cylinder(7,4.05,4.05);
};
};

module all(){
lip();
translate([0,0,.89])body();
translate([0,0,7.1])lip();
};
module a(){
difference(){ all();
    translate([3,4.5,-1])
    rotate([40,0,0])
cube([18,.25,20]);
};};
translate([0,0,6])rotate([0,-90,0])a();
