/* [Spring] */
Spring_Length = 400;			//[10:200]
Spring_Outer_Diameter = 80;		//[5:0.1:150]
Spring_Wire_Diameter = 5;		//[1:0.1:10]
Spring_Windings = 17;			//[3:20]
Spring_Coarseness = 80;		//[4, 6, 8, 10, 40, 80, 160]

//For better printing
Printing_Helper = "No";			//[Yes, No]

//Beware!!! Takes some time!!!
Proofread_Spring_Diameter = "No";		//[Yes, No]

/* [Spring Left End] */
Spring_Left_End = 1;			//[0:None, 1:Ring, 2:Full, 3:Full with hole]
Left_Hole_Diameter = 8;		//[1:0.1:140]
Left_Hole_Type = 6;			//[3:Triangle, 4:Square, 6:Hexagon, 100:Circle]

/* [Spring Right End] */
Spring_Right_End = 3;			//[0:None, 1:Ring, 2:Full, 3:Full with hole]
Right_Hole_Diameter = 8;		//[1:0.1:140]
Right_Hole_Type = 6;			//[3:Triangle, 4:Square, 6:Hexagon, 100:Circle]

/* [Hidden] */

wire_dia = Spring_Wire_Diameter;
spr_dia = Spring_Outer_Diameter / 2-wire_dia / 2;
cl_lgt = Spring_Length-wire_dia;
coils = Spring_Windings;
pitch = cl_lgt / coils / 2;
helix = asin ((pitch / 2) / (spr_dia));

union(){
	mod3 (Spring_Left_End, Left_Hole_Diameter, Left_Hole_Type);
	if (Proofread_Spring_Diameter=="Yes"){
		resize ([0, 0, spr_dia * 2+wire_dia], auto = [false, false, true])
		translate([pitch / 2, 0, 0])
		for(x = [0:2:(coils-1) * 2]){
			translate([pitch * x, 0, 0]) mod1(helix, 1);
			translate([pitch * (x+1), 0, 0]) mod1(helix, -1);
			}
		}else{
			translate ([pitch / 2, 0, -(pitch * helix) / 221.61])
				for (x = [0:2:(coils-1) * 2]){
				translate ([pitch * x, 0, 0]) mod1(helix, 1);
				translate ([pitch * (x+1), 0, 0]) mod1(helix, -1);
				}
			}
			translate ([cl_lgt, 0, 0]) mod3(Spring_Right_End, Right_Hole_Diameter, Right_Hole_Type);
			if (Printing_Helper == "Yes"){
				translate ([0, -0.5, -spr_dia-wire_dia / 2]) cube ([Spring_Length-wire_dia, 1, 0.6]);
				for (x = [0:Spring_Windings-1]){
					translate ([pitch+x * pitch * 2-pitch / 2, -10, -spr_dia-wire_dia / 2])cube([pitch, 20, 0.6]);
					}
				}
			}
			module mod1(helix, suund){
				rotate ([0, suund * helix, 0])
				difference (){mod2();
				translate ([0, suund * spr_dia, 0]) cube([wire_dia, spr_dia * 2, spr_dia * 2+wire_dia], center = true);
				}
			}
			module mod2(){
				rotate ([0, 90, 0])
				rotate_extrude (convexity  =  10, $fn = Spring_Coarseness)
				translate ([spr_dia,  0,  0])circle(d  =  wire_dia,  $fn = 30);
			}
			module mod3 (tyyp, auk = 3, kylgi = 8){
			if(tyyp==1){
				mod2();
			}
			else{if(tyyp>=2){
				difference(){
					union (){mod2();rotate([0, 90, 0])cylinder(h = wire_dia, r = spr_dia, center = true, $fn = Spring_Coarseness);
				}
				if (tyyp==3) rotate ([0, 90, 0]) cylinder (h = wire_dia+2, d = auk, center = true, $fn = kylgi);
			}
		}
	}
}