include <config.scad>
include <modules.scad>

module test_sockets() {
    difference() {
        translate([-hub_w/2, 0, 0])
            rotate([0, 0, 90])
            cube([strip_w*3 + 20, hub_w, hub_h], center=true);

        translate([-hub_w*0.75, -strip_w - 5, 0])
            cylinder(h=hub_h*2, r=1.5, center=true);

        translate([0.01, -strip_w - 5, 0])
            connector(margin=0.025);

        translate([0.01, 0, 0])
            connector(margin=0.05);

        translate([0.01, strip_w + 5, 0])
            connector(margin=0.075);
    }
}

module test_arm() {
    connector();
    translate([10 - 0.01, 0, 0])
        cube([20, arm_h, arm_h], center=true);
}

translate([0, 0, hub_h/2])
    test_sockets();

translate([hub_h, 0, strip_w/2])
    rotate([90, 0, 90])
    test_arm();
