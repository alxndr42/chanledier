include <config.scad>
include <modules.scad>

arc_r = round(strip_l*2/PI);

// Arc
rotate_extrude(angle=90)
    translate([arc_r - arm_h/2, 0, 0])
    square([arm_h, strip_w], center=true);

// Connector
translate([arc_r - hub_h/2, 0.01, 0])
    rotate([90, 0, 90])
    connector();
