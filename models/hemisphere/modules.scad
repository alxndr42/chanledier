include <MCAD/regular_shapes.scad>

include <config.scad>

module arc(width, height, radius, angle=90) {
    rotate_extrude(angle=angle)
        translate([radius - width/2, 0, 0])
        square([width, height], center=true);
}

module connector(width=strip_w, margin=0) {
    tooth_h = hub_h/3;
    y1 = tooth_h*0.5 - margin;
    y2 = tooth_h*1.5 + margin;
    x1 = tooth_h + margin;
    x2 = tooth_h*2 + margin;

    points = [
        [0, y2],
        [0, -y2],
        [-x2, -y2],
        [-x2, -y1],
        [-x1, -y1],
        [-x1, y1],
        [-x2, y1],
        [-x2, y2],
    ];

    rotate([90, 0, 0])
        linear_extrude(width, center=true)
        polygon(points);
}

module loop(inner_r=3, width=4) {
    rotate([90, 0, 90])
        linear_extrude(width, center=true)
        ring(inner_r*2, width);
}

module ngon(sides, side_r=hub_r, height=hub_h) {
    inner_angle = 360/arms/2;
    outer_angle = 90 - inner_angle;
    ngon_r = side_r/sin(outer_angle);

    linear_extrude(height, center=true)
        rotate([0, 0, 360/sides/2])
        regular_polygon(sides, ngon_r);
}
