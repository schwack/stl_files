$fn=50;

width = 5.3;
lipwidth = .9;
id = 4;
lipid = 4.75;
thickness = 1;


module lip(){
difference (){
cylinder (lipwidth,lipid+thickness,lipid+thickness);
    translate([0,0,-.5])
cylinder(lipwidth+1,lipid,lipid);
};
};
module body(){
difference (){
cylinder (width-lipwidth-lipwidth,id+thickness,id+thickness);
    translate([0,0,-.5])
cylinder(width+1,id,id);
};
};

module all(){
lip();
translate([0,0,lipwidth])body();
translate([0,0,width-lipwidth])lip();
};
module a(){
difference(){ all();
    translate([3,4,-1])
    rotate([40,0,0])
cube([18,.2,20]);
};};
translate([0,0,lipid+thickness])rotate([0,-90,0])a();

module arm(){
difference(){
    color("red")cylinder(width-lipwidth-.05,lipid+thickness+1.5,lipid+thickness);
    translate([0,0,-1])cylinder(width+2,id+thickness+.1,id+thickness+.1);
    translate([0,0,-.1])cylinder (width-lipwidth-.65,lipid+thickness+.5,lipid+thickness-.5);
   translate ([0,0,width-lipwidth-.76])color("white")cylinder(.75,lipid+thickness-.5,id+thickness+.1);
   rotate([0,10,0])translate([.4,-15,-.1])cube([15,30,15]);
   rotate([0,-10,0])translate([-15.4,-15,-.1])cube([15,30,15]);
    
};};
//difference(){
//  cylinder(.2,lipid+thickness+1.5,lipid+thickness+1.5);
//    translate([0,0,-.1])
//  cylinder(.4,lipid+thickness+.5,lipid+thickness+.5);
//    
//};
//arm();
////rotate(15)arm();
//rotate(30)arm();
////rotate(45)arm();
//rotate(60)arm();
////rotate(75)arm();
//rotate(90)arm();
////rotate(105)arm();
//rotate(120)arm();
////rotate(135)arm();
//rotate(150)arm();
////rotate(165)arm();