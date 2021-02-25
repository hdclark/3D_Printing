
// This OpenSCAD file will create a 3D grid out of orthogonal cylinders.
// The number of grid lines is parameterized at the bottom.

module regulargrid( grid_width,
                    grid_height,
                    grid_length ){
  // Number of grid cells wide, tall, and long.
  
  grid_sep = 15.0; // The spacing between adjacent parallel grid lines.

  grid_line_diam = 3.0; // The diameter of grid line cylinders.

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
        translate([x, y, 0.0])
        cylinder(h=z_max, r=grid_line_r, $fn=s_frag);
      }
    }
  
    // Y-aligned lines.
    for(x = [0 : grid_sep : x_max]){
      for(z = [0 : grid_sep : z_max]){
        color("green")
        rotate([-90, 0, 0])
        translate([x, -z, 0.0])
        cylinder(h=y_max, r=grid_line_r, $fn=s_frag);
      }
    }
  
    // X-aligned lines.
    for(z = [0 : grid_sep : z_max]){
      for(y = [0 : grid_sep : y_max]){
        color("blue")
        rotate([0, 90, 0])
        translate([-z, y, 0.0])
        cylinder(h=x_max, r=grid_line_r, $fn=s_frag);
      }
    }

    // Round the corners. Only the 8 outer corners need to be rounded.
    translate([0,       0,      0    ]) sphere(r=grid_line_r, $fn=s_frag);
    translate([x_max,   0,      0    ]) sphere(r=grid_line_r, $fn=s_frag);
    translate([0,       y_max,  0    ]) sphere(r=grid_line_r, $fn=s_frag);
    translate([x_max,   y_max,  0    ]) sphere(r=grid_line_r, $fn=s_frag);
 
    translate([0,       0,      z_max]) sphere(r=grid_line_r, $fn=s_frag);
    translate([x_max,   0,      z_max]) sphere(r=grid_line_r, $fn=s_frag);
    translate([0,       y_max,  z_max]) sphere(r=grid_line_r, $fn=s_frag);
    translate([x_max,   y_max,  z_max]) sphere(r=grid_line_r, $fn=s_frag);
  }
}

// Small grid.
regulargrid(3, 4, 2);

// Medium grid.
//regulargrid(4, 8, 4);

// Extended grid.
//regulargrid(4, 16, 4);

