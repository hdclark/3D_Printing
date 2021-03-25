
// Tolerances.
$fa = 5;
$fn = 10;

// Capillary inner radius.
inner_radius = 1.25;

// Length of capillaries along x, y, and z axes.
segment_x_length = 4.0;
segment_y_length = 5.0;
segment_z_length = 100.0;

grid_x = 5; // Number of capillaries along x direction.
grid_y = 5; // Number of capillaries along y direction.

module capillary(from, orien, length) {
    translate( from ){ 
        rotate( orien ){ 
            cylinder($fa = $fa, $fn = $fn, h=length, r=inner_radius, center=false);
            sphere($fa = $fa, $fn = $fn, r=inner_radius);

            translate( [0.0, 0.0, 1.00*length]){
                sphere($fa = $fa, $fn = $fn, r=1.0*inner_radius); 
            }
        }
    }
}

difference(){
    // Outer box.
    translate([-segment_x_length, -2.0*segment_y_length, -0.05*segment_z_length]){
        cube( [(grid_x + 2)*segment_x_length, (grid_y + 3)*segment_y_length, 1.10*segment_z_length] );
    };
    
    // Capillary network.
    union(){
        for(x = [ 0 : 1 : grid_x ]){
            for(y = [ 0 : 1 : grid_y ]){
                capillary(from = [x * segment_x_length, y * segment_y_length, 0.0],
                          orien = [0.0, 0.0, 0.0],
                          length = segment_z_length);
            }
        }
        for(x = [ 0 : 1 : grid_x ]){
            for(y = [ 0 : 2 : grid_y ]){
                capillary(from = [x * segment_x_length, y * segment_y_length, 0.0],
                          orien = [90.0, 0.0, 0.0],
                          length = segment_y_length);
            }
        }
        for(x = [ 0 : 1 : grid_x ]){
            for(y = [ 1 : 2 : grid_y ]){
                capillary(from = [x * segment_x_length, y * segment_y_length, segment_z_length],
                          orien = [90.0, 0.0, 0.0],
                          length = segment_y_length);
            }
        }
        for(x = [ 0 : 2 : grid_x]){
                capillary(from = [x*segment_x_length, grid_y*segment_y_length, segment_z_length],
                          orien = [0.0, 90.0, 0.0],
                          length = segment_x_length);
        }
        for(x = [ 1 : 2 : (grid_x-1)]){
                capillary(from = [x*segment_x_length, -segment_y_length, 0.0],
                          orien = [0.0, 90.0, 0.0],
                          length = segment_x_length);
        }
        
        // Ingress/egress ports.
        capillary(from = [0.0, 0.0, 0.0],
                  orien = [90.0, 0.0, 0.0],
                  length = 6*segment_x_length);
        capillary(from = [grid_x*segment_x_length, grid_y*segment_y_length, segment_z_length],
                  orien = [0.0, 90.0, 0.0],
                  length = 5*segment_y_length);
    };
};
