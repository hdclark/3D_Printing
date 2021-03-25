

$fa = 2;
$fn = 10;

inner_radius = 1.25;
current_pos = [0.0, 0.0, 0.0];
current_orien = [0.0, 0.0, 1.0];
segment_length = 10.0;

module capillary(from, orien, length) {
    rotate( orien ){
        translate( from ){
            cylinder($fa = $fa, $fn = $fn, h=length, r=inner_radius, center=false);
            sphere($fa = $fa, $fn = $fn, r=inner_radius);
        }
    }
}


capillary(from = [0.0, 0.0, 0.0],
          orien = [10.0, 0.0, 0.0],
          length = 20.0);

capillary(from = [10.0, 0.0, 0.0],
          orien = [0.0, 20.0, 0.0],
          length = 30.0);

capillary(from = [0.0, 20.0, 0.0],
          orien = [0.0, 0.0, 30.0],
          length = 10.0);



for(d_pos = [ 0 : 15 : 360]){
    
    capillary( current_pos, current_orien, segment_length );
    
    o = current_orien;
    p = [ 0.0, 0.0, 1.0 ];
    
    // Update current_pos to coincide with the end of the last segment.
    d_U = [ (cos(o.x)*cos(o.y)*p.x + (cos(o.x)*sin(o.y)*sin(o.z) - sin(o.x)*cos(o.z))*p.y + (cos(o.x)*sin(o.y)*cos(o.z) + sin(o.x)*sin(o.z))*p.z),
            (sin(o.x)*cos(o.y)*p.x + (sin(o.x)*sin(o.y)*sin(o.z) + cos(o.x)*cos(o.z))*p.y + (sin(o.x)*sin(o.y)*cos(o.z) - cos(o.x)*sin(o.z))*p.z),
            (-sin(o.y)*p.x + cos(o.y)*sin(o.z)*p.y + cos(o.y)*sin(o.z)*p.z) ];

    
      
//    current_orien = current_orien + d_orien;
    current_pos = [ current_pos.x + segment_length * d_U.x,
                    current_pos.y + segment_length * d_U.y,
                    current_pos.z + segment_length * d_U.z ];
    current_orien = [ d_pos, 0.0, 0.0 ];

    echo(d_U.x, " ", d_U.y, " ", d_U.z);
    
}