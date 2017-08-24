key_height = 8;
bottom_size = 18;
top_x_size = 13;
top_y_size = 15;

union() {
  difference() {
    linear_extrude(height = key_height, scale = [top_x_size / bottom_size, top_y_size / bottom_size]) {
      square(size=bottom_size, center=true);
    }
    linear_extrude(height = 5, scale = [11/(bottom_size-3), 11/(bottom_size-3)]) {
      square(size=bottom_size-3, center=true);
    }
    rotate([90, 0, 0]) {
      translate([0, 20.125 + key_height, 0]) {
        cylinder(r=21.125, h = top_y_size + 2, center = true, $fn=180);
      }
    }
  }
  translate([0, 0, 3]) {
    difference() {
      cube([7, 5, 6], center=true);
      cube([5, 1.3, 12], center=true);
      cube([1.2, 6, 12], center=true);
    }
  }
  translate([(18-7)/2, 0, 0.2]) cube([(18-6)/2, 0.8, 0.4], center=true);
  translate([-(18-7)/2, 0, 0.2]) cube([(18-6)/2, 0.8, 0.4], center=true);
  translate([2, (18-7)/2, 0.2]) cube([0.8, (18-5)/2, 0.4], center=true);
  translate([-2, -(18-7)/2, 0.2]) cube([0.8, (18-5)/2, 0.4], center=true);
}
