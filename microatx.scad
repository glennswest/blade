

inch = 25.4;
holesize = (0.156 * inch) / 2;
boardsize = 9.6 * inch;
thickness = 3;
holedepth = thickness + 2;

module board(){
    translate([-20,-20,0]) cube([boardsize + 40, boardsize + 40, thickness]);  // to allow for holes around blade
    cube([boardsize, boardsize, thickness]);
}


module side_holes(){
    
    for (i = [-10 : 1 * inch : boardsize + 10]){
         translate([-10, i, -1]) cylinder(r=holesize, h=holedepth);
    }
     for (i = [-10 : 1 * inch : boardsize + 10]){
         translate([boardsize+10, i, -1]) cylinder(r=holesize, h=holedepth);
    }
      for (i = [10 : 1 * inch : boardsize + 10]){
         translate([i, -10, -1]) cylinder(r=holesize, h=holedepth);
    }
      for (i = [10 : 1 * inch : boardsize + 10]){
         translate([i, boardsize+10, -1]) cylinder(r=holesize, h=holedepth);
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
        board();
        holes();
        side_holes();
    }
}

mount_plate();