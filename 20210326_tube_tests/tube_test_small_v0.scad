
$fa = 3;
$fn = 50;

union(){
translate([-1.5, -1.5, 0.0]){
    cube([21.0, 17.5, 1.0]);
}
    
for(i = [ 0 : 1 : 5]){
    for(j = [ 0 : 1 : 4]){
        inner_radius = 0.15 + i * 0.1;
        outer_radius = (inner_radius + 0.3) + 0.05 * j;
        translate( [ i * 3.5, j * 3.5, 0.0] ){
            difference(){
                cylinder($fa = $fa, $fn = $fn, h = 2.0, r = outer_radius);
                cylinder($fa = $fa, $fn = $fn, h = 100.0, r = inner_radius);
            }
        }
    }
}
}
