
// Interlocking QA plate, v1.
//
// This code builds a 3D model that can be 3D printed or machined.
//

function in_to_mm(x) = x * 25.4;

x_slope = 1.5; // Degrees.
y_slope = 2.5; // Degrees.

base_width = in_to_mm(10.0);
base_height = in_to_mm(1.0);

// The drop at the centre of the cube (along [0,0,1]) due to the x and y slopes.
z_drop = (base_width * 0.5) * tan(x_slope) 
       + (base_width * 0.5) * tan(y_slope);

union() {

difference() {
    // The base cube.
    translate([0, 0, 0])
      linear_extrude(height = base_height)
          square([base_width*0.5, base_width*0.5], center = true);

    // The part at the top being subtracted off.
    translate([0, 0, base_height - z_drop])
      rotate([x_slope, y_slope, 0.0])
        linear_extrude(height = base_height*10.0)
          square([base_width*10.0, base_width*10.0], center = true);

}

translate([0, 0, base_height - z_drop
                             - ( in_to_mm(1.5) * tan(x_slope)
                               + in_to_mm(1.5) * tan(y_slope) ) ])
translate([in_to_mm(1.5), -in_to_mm(1.5)])
rotate([x_slope, y_slope, 0.0])
linear_extrude(height = in_to_mm(0.25))
circle(d=in_to_mm(0.25), $fn=50);

translate([0, 0, base_height - z_drop
                             + ( in_to_mm(1.5) * tan(x_slope)
                               + in_to_mm(1.5) * tan(y_slope) ) ])
translate([-in_to_mm(1.5), in_to_mm(1.5)])
rotate([x_slope, y_slope, 0.0])
linear_extrude(height = in_to_mm(0.25))
circle(d=in_to_mm(0.25), $fn=50);

}
