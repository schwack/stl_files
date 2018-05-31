module hole(){
    $fn = 30;
 rotate([0,0,90])
    translate([0,0,-4])
        cylinder (19, 1.65, 1.65);
}

module csk(){
    $fn = 30;
 rotate([0,0,90])
    translate([0,0,-1])
        cylinder (8.5, 3.4, 3.4);
} 
module csk2(){
    $fn = 6;
 rotate([0,0,90])
    translate([0,0,-3])
        cylinder (10, 3.3, 3.3);
}  
module csk3(){
    $fn = 40;
 rotate([0,0,90])
    translate([0,0,5.75])
        cylinder (2.5, 3.32, .9);
    translate([0,0,2.2])
        cylinder (3, 3.5, 3.5);
} 



module frame(){
difference(){

translate([0, 0, -2])cube([60,40,17]);
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
 rotate([30,0,0])translate ([-.1,-27,-20])cube([62,30,30]); 
 
}   
translate ([53,-1,-7.2])
 rotate([0,28,0])cube([62,50,20]); 



translate ([-47,-1,-38])
 rotate([0,-28,0])cube([62,50,30]); 


 translate ([-.1,31.5,-9])rotate([-30,0,0])cube([62,5,30]);    
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
   translate([0, 0, -5])
    cube([62,40,5]);  
}





translate([0, 50, 0]) {
 
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
      translate([0,0,3.55])csk3();
   } 
   translate([40,20,0]){
   hole(); 
      translate([25,0,4.55])
       
        cylinder (5.5, 3, 1);

       ;}
}
   
}
  }  
  }
translate ([-2,-2,-5])
 cube([64,150,5]); 
  
   translate([10,20,9])
       n();
   translate([40,20,9])
       n();
  $fn = 20;

    translate([50,70,7])cylinder (15, 2, 2);
  
  //rem
  
  
}
///n();

module n(){
    
    $fn = 40;

        cylinder (3, 4.5, 1);
    translate([0,50,0])cylinder (6, 3, 3);
        
}
