include <MCAD/regular_shapes.scad>

include <config.scad>
include <modules.scad>

// Polygon
inner_angle = 360/arms/2;
outer_angle = 90 - inner_angle;
ngon_r = hub_r/sin(outer_angle);
// Hole
hole_r = hub_r - hub_w;

// Body
difference() {
    // Polygon
    linear_extrude(hub_h, center=true)
        rotate([0, 0, 360/arms/2])
        regular_polygon(arms, ngon_r);
    // Hole
    cylinder(h=hub_h*2, r=hole_r, center=true);
    // Sockets
    for(i=[0:1:arms-1]) {
        rotate([0, 0, 360/arms*i])
            translate([hub_r+0.01, 0, 0])
            connector(margin=connector_margin);
    }
}

// Loops
for (i=[0:360/4:359]) {
    rotate([0, 0, 45 + i])
        translate([hub_r - hub_w*0.75, 0, hub_h/2])
        loop();
}
