diameter = 20;          //
minor_dia = 15.5;
taper_length = 15;
hole_position = 25;

r = diameter * .5025;


module hole(){
    $fn = 30;
 rotate([0,0,90])
    translate([0,0,-1])
        cylinder (17, 1.65, 1.65);
}

module csk(){
    $fn = 30;
 rotate([0,0,90])
    translate([0,0,-1])
        cylinder (7.5, 3.4, 3.4);
} 
module csk2(){
    $fn = 6;
 rotate([0,0,90])
    translate([0,0,-1])
        cylinder (7.5, 3.3, 3.3);
}  


module n(){   
    $fn = 40;
    cylinder (3, 4, 1);
    translate([0,50,0])
       cylinder (6, 2.5, 2.5); 
}


module frame(){
    difference(){
        cube([60,40,15]);
        {
            rotate([0,90,0])
                translate([-15, 20, -1])
                    cylinder (46.01, 10.05, 10.05);
            rotate([0,90,0])
                translate([-15, 20, 45])
                    cylinder (16, 10, 7.75);
            translate([7, 5, 0])
                hole();
            translate([7, 35, 0])
                hole();
            translate([53, 5, 0])
                hole();
            translate([53, 35, 0])
                hole();
        }
        translate ([-.1,-.78,-3])
            rotate([30,0,0])
                cube([62,5,10]);
        translate ([57,-1,0])
            rotate([0,28,0])
                cube([5,42,10]);
        translate ([0,-1,-5])
            rotate([0,-28,0])
                cube([5,42,10]);
        translate ([-.1,36.75,0])
            rotate([-30,0,0])
                cube([62,5,10]);
    }
}



difference (){
    translate([0,90,14.5]){
        rotate([180,0,0]){
            difference (){
                frame();
                translate([7, 5, 0])
                    csk();
                translate([7, 35, 0])
                    csk();
                translate([53, 5, 0])
                    csk();
                translate([53, 35, 0])
                    csk();
                //lock pin hole
                translate([53, 20, 0]){
                        $fn = 30;
                        rotate([0,0,90])
                        translate([0,0,-1])
                        cylinder (10, 2, 2);
                    }
            }
            translate([0, 50, 0]){
                difference (){
                    frame();
                    translate([7, 5, 0])
                    csk2();
                    translate([7, 35, 0])
                    csk2();
                    translate([53, 5, 0])
                    csk2();
                    translate([53, 35, 0])
                    csk2();
                    translate([10,20,0]){
                        hole();
                    }
                    translate([40,20,0]){
                        hole();
                    }
                }
            }
        }
    }
    
    translate([10,20,9])
       n();        
    translate([40,20,9])
       n();
}

