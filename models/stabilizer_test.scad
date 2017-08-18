include <parameters.scad>

plat_x = border + 2*key_cell;
plat_y = border + key_cell;

use <common.scad>

difference() {
    cube([plat_x, plat_y, 5], center = true);
    double_wide(0, 0);
}