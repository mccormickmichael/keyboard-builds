/* key_height = 10; */
/* bottom_size = 18; */
/* top_x_size = 13; */
/* top_y_size = 15; */

/* difference() { */
/*   linear_extrude(height = key_height, scale = [top_x_size / bottom_size, top_y_size / bottom_size]) { */
/*     square(size=18, center=true); */
/*   } */
/*   translate([0, 0, 5]) { */
/*     cube([3, 1.1, 15], center = true); */
/*     cube([1, 3, 15], center = true); */
/*   } */
/*   rotate([90, 0, 0]) { */
/*     translate([0, 30, 0]) { */
/*      cylinder(r=21, h = top_y_size + 2, center = true, $fn=180); */
/*     } */
/*   } */
/* } */
/* rotate([90, 0, 0]) { */
/*   translate([0, 20, 0]) { */
/*       cylinder(r=11, h=10, $fn=180); */
/*     } */
/*   } */

union() {
  cylinder(r=8, h=2, center=true, $fn=36);
  translate([0, 0, 5]) {
    difference() {
      cube([7, 5, 10], center=true);
      cube([5, 1.4, 12], center=true);
      cube([1.3, 6, 12], center=true);
    }
  }
}
