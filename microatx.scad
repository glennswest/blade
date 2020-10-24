

inch = 25.4;
holesize = 2.5 / 2;
platesize = 12 * inch;
boardsize = 9.6 * inch;
thickness = 3;
holedepth = thickness + 2;
$fn = 64;

module inverse_gearmount(th)
{  
    difference(){
      translate([-40,5.1,0]) cube([90.4+80,15,th]);
      translate([90,5,-1]) rotate([90,0,180]) gearmount(th+2);
      }
}

module gearmount(thewidth)
{
    translate([-2,0,0])   cube([14,thewidth,4.25]);
    translate([8-1.5,0,0])  cube([6,thewidth,19.6]);
    
    translate([72,0,0])  cube([15,thewidth,4.25]);
    //translate([13-1.5,0,20]) rotate([-90,0,0]) cylinder(r=5,h=thewidth); 
   
    //translate([82,0,20]) rotate([-90,0,0]) cylinder(r=5,h=thewidth); 
     
    translate([82,0,4.2])  cube([5,thewidth,15.8]);
   
    translate([14,0,15]) cube([69,thewidth,4.25]);
    
}


module plate(){
    difference(){
       translate([-20,-20,0]) cube([platesize, platesize, thickness]);  // to allow for holes around blade
       translate([0,-25.2,-1]) inverse_gearmount(thickness+2); 
    }
}

module board(){
    cube([boardsize, boardsize, thickness]);
}


module side_holes(){
    
    for (i =  [-10 + inch : 1 * inch : platesize  - 50]){
         translate([-10, i, -1]) cylinder(r=holesize, h=holedepth);
    }
     for (i = [-10 + inch : 1 * inch : platesize - 50]){
         translate([platesize - 30, i, -1]) cylinder(r=holesize, h=holedepth);
    }
      for (i = [21 : 1 * inch : platesize - 50]){
         translate([i, -10+20, -1]) cylinder(r=holesize, h=holedepth);
    }
      for (i = [10 : 1 * inch : platesize + 10]){
         translate([i, platesize-30, -1]) cylinder(r=holesize, h=holedepth);
    }
   
}

module weight_reduction()
{
    for (y = [5 * inch : 12 : 9.5 * inch]){
     for (i = [21 : .7 * inch : platesize - 50]){
         translate([i, y, -1]) cylinder(r=3, h=holedepth);
    }
   }
   

}


module holes(){
    /* Row 1 from back */ 
    translate([1.350 * inch,            boardsize - .400 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch + 1.8 * inch, boardsize - .400 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch + 8   * inch, boardsize - .400 * inch, -1]) cylinder(r=holesize,h=holedepth);
    /* Row 2 */
    translate([1.350 * inch,            boardsize - 6.500 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch + 1.8 * inch, boardsize - 6.500 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch + 8   * inch, boardsize - 6.500 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch - 0.8 * inch,            boardsize - 6.500 * inch, -1]) cylinder(r=holesize,h=holedepth);
    /* Row 3 */
    translate([1.350 * inch + 1.8 * inch, boardsize - 9.35 * inch, -1]) cylinder(r=holesize,h=holedepth);
    translate([1.350 * inch + 8   * inch, boardsize - 9.35 * inch, -1]) cylinder(r=holesize,h=holedepth);
    
}

module mount_plate(){
    difference(){
        plate();
        side_holes();
        //translate([12,25,0]) board();
        translate([12,25,0]) holes();
        //weight_reduction();
        
        }
   
}

 translate([0-platesize+20,0-platesize+20,0]) projection() mount_plate();
//inverse_gearmount(thickness);