orx = -80;
ory = -40;
orz = 0;
blx = 75;
bly = 0;
blz = 35;
rex = 8;
rey = 42;
rez = 2;
grx = -205;
gry = -0;
grz = -190;
vix = 88;
viy = 0;
viz = 20;
yex = 75;
yey = -20;
yez = -55;
rox = 0;
roy = -90;
roz = 32;


drawit();

module drawit(){
//translate([orx,ory,orz])or();
//translate([blx,bly,blz])bl();
//translate([rex+roz,rey+roz,rez+roz])re();
//translate([vix,viy,viz])vi();
//translate([grx,gry,grz])gr();
//translate([yex,yey,yez])rotate([rox,roy,roz])ye();
};





module or(){
    color("orange")translate([0,0,10])rotate([0,180,90])import("C:/Mcam9/Data/KNOT_O.STL");
};
module gr(){
    color("green")translate([-10,0,0])rotate([90,90,90])import("C:/Mcam9/Data/KNOT_G.STL");
};
module vi(){
    color("violet")translate([10,0,0])rotate([90,-90,90])import("C:/Mcam9/Data/KNOT_P.STL");
};
module bl(){
    color("blue")translate([0,0,-10])rotate([0,0,-90])import("C:/Mcam9/Data/KNOT_B.STL");
};
module ye(){
    translate([0,10,0])color("yellow")rotate([90,0,180])import("C:/Mcam9/Data/KNOT_Y.STL");
};
module re(){
    translate([0,-10,0])color("red")rotate([90,180,180])import("C:/Mcam9/Data/KNOT_R.STL");
};


