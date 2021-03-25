
$fa = 5;
$fn = 20;

inner_radius = 1.25;
segment_length = 100.0;

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
    translate([-5.0, -10.0, -10.0]){
        cube( [60.0, 70.0, 120.0] );
    };

    // Tubing.
    union(){
        for(x = [ 0 : 5 : 50]){
            for(y = [ 0 : 5 : 50]){
                capillary(from = [x, y, 0.0], orien = [0.0, 0.0, 0.0], length = segment_length);
            }
        }
        
        for(x = [ 0 : 5 : 50]){
            for(y = [ 0 : 10 : 50]){
                capillary(from = [x, y, 0.0], orien = [90.0, 0.0, 0.0], length = 5);
            }
        }
        for(x = [ 0 : 5 : 50]){
            for(y = [ 5 : 10 : 50]){
                capillary(from = [x, y, segment_length], orien = [90.0, 0.0, 0.0], length = 5);
            }
        }
        
        for(x = [ 0 : 10 : 50]){
                capillary(from = [x, 50.0, segment_length], orien = [0.0, 90.0, 0.0], length = 5);
        }
        for(x = [ 5 : 10 : 45]){
                capillary(from = [x, -5.0, 0.0], orien = [0.0, 90.0, 0.0], length = 5);
        }
        
        capillary(from = [0.0, 0.0, 0.0], orien = [90.0, 0.0, 0.0], length = 20);
        capillary(from = [50.0, 50.0, segment_length], orien = [0.0, 90.0, 0.0], length = 20);
    };
};

