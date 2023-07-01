include <config.scad>
include <modules.scad>

height = 60;

difference() {
    cylinder(h=height, r=hub_r + 5, center=true);
    ngon(arms, side_r=hub_r + 0.5, height=height*2);
}
