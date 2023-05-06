include <MCAD/regular_shapes.scad>

include <config.scad>

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

module loop(inner_r=2, width=3) {
    rotate([90, 0, 90])
        linear_extrude(width, center=true)
        ring(inner_r*2, width);
}
