include <config.scad>
include <modules.scad>

// Add a cap on one end
cap = false;

cap_h = rail_w*2 + strip_w;
rail_r = arm_r + rail_h;
rail_t = arm_h + rail_h;

// Arc
translate([0, 0, rail_w/2])
    arc(rail_t, rail_w, rail_r);

// Cap
if (cap) {
    translate([-rail_w/2 + 0.01, rail_r - rail_t/2, cap_h/2])
        cube([rail_w, rail_t, cap_h], center=true);
}
