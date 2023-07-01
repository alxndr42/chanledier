include <config.scad>
include <modules.scad>

// Arc
arc(arm_h, strip_w, arm_r);

// Connector
translate([arm_r - hub_h/2, 0.01, 0])
    rotate([90, 0, 90])
    connector();
