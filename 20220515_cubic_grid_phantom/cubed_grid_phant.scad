
// This OpenSCAD file will create a 3D grid out of orthogonal cylinders.
// The number of grid lines is parameterized at the bottom.

module regulargrid( grid_width,
                    grid_height,
                    grid_length ){
  // Number of grid cells wide, tall, and long.
  
  grid_sep = 15.0; // The spacing between adjacent parallel grid lines.

  grid_line_diam = 2.5; // The diameter of grid line cylinders.

  s_frag = 45; // Number of linear fragments (i.e., edges) in round structures.

  // Derived quantities.
  grid_line_r = grid_line_diam / 2.0;

  x_max = grid_width  * grid_sep;
  y_max = grid_height * grid_sep;
  z_max = grid_length * grid_sep;

  union(){
  
    // Z-aligned lines.
    for(x = [0 : grid_sep : x_max]){
      for(y = [0 : grid_sep : y_max]){
        color("red")
        rotate([0, 0, 0])
        translate([-grid_line_r, -grid_line_r, -grid_line_r])
        translate([x, y, 0.0])
        cube([grid_line_diam, grid_line_diam, z_max + grid_line_diam]);
      }
    }
  
    // Y-aligned lines.
    for(x = [0 : grid_sep : x_max]){
      for(z = [0 : grid_sep : z_max]){
        color("green")
        rotate([-90, 0, 0])
        translate([-grid_line_r, -grid_line_r, -grid_line_r])
        translate([x, -z, 0.0])
        cube([grid_line_diam, grid_line_diam, y_max + grid_line_diam]);
      }
    }
  
    // X-aligned lines.
    for(z = [0 : grid_sep : z_max]){
      for(y = [0 : grid_sep : y_max]){
        color("blue")
        rotate([0, 90, 0])
        translate([-grid_line_r, -grid_line_r, -grid_line_r])
        translate([-z, y, 0.0])
        cube([grid_line_diam, grid_line_diam, x_max + grid_line_diam]);
      }
    }
    
    // Fill some cells.
    //translate([-grid_line_r, -grid_line_r, -grid_line_r])
    translate([2*grid_sep, 2*grid_sep, 2*grid_sep])
    cube(grid_sep);// + grid_line_r);
    
    //translate([-grid_line_r, -grid_line_r, -grid_line_r])
    translate([(grid_width-3)*grid_sep, (grid_height-3)*grid_sep, (grid_length-3)*grid_sep])
    cube(grid_sep);// + grid_line_diam);
  }
}

// Small grid.
//union(){
   regulargrid(5, 10, 6);
//   translate([, 15.0, 15.0]) sphere(15.0);
//}

// Medium grid.
//regulargrid(4, 8, 4);

// Extended grid.
//regulargrid(4, 16, 4);

