include <config.scad>
include <modules.scad>

shield_r = hub_r + 5;
plate_h = 5;
gap_h = rail_h + 1;
pin_h = 5;

// Pins
translate([0, 0, plate_h/2 + gap_h + pin_h/2 - 0.01]) {
    difference() {
        cylinder(h=pin_h, r=shield_r, center=true);
        ngon(arms, side_r=hub_r - 0.25, height=pin_h*2);
        slits();
    }
}

// Gap
translate([0, 0, plate_h/2 + gap_h/2 - 0.01]) {
    difference() {
        cylinder(h=gap_h, r=shield_r, center=true);
        ngon(arms, side_r=hub_r - 1.25, height=gap_h*2);
        slits();
    }
}

// Plate
cylinder(h=plate_h, r=shield_r, center=true);

module slits() {
    for(i=[0:1:arms/2 - 1]) {
        rotate([0, 0, 360/arms*i])
            cube([100, strip_w + rail_w*2 + 1, 100], center=true);
    }
}
