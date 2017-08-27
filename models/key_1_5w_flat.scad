key_height = 8;

bottom_x_size = 27;
bottom_y_size = 18;

top_x_size = 22;
top_y_size = 15;

union() {
  difference() {
    linear_extrude(height = key_height, scale = [top_x_size / bottom_x_size, top_y_size / bottom_y_size]) {
      square(size=[bottom_x_size, bottom_y_size], center=true);
    }
    linear_extrude(height = 5, scale = [11/(bottom_x_size-3), 11/(bottom_y_size-3)]) {
      square(size=[bottom_x_size-3, bottom_y_size-3], center=true);
    }
  }
  translate([0, 0, 3]) {
    difference() {
      cube([7, 5, 6], center=true);
      cube([5, 1.3, 12], center=true);
      cube([1.2, 6, 12], center=true);
    }
  }
  translate([8, 0, 0.2]) cube([(27-6)/2, 0.8, 0.4], center=true);
  translate([-8, 0, 0.2]) cube([(27-6)/2, 0.8, 0.4], center=true);
  translate([2, (18-7)/2, 0.2]) cube([0.8, (18-5)/2, 0.4], center=true);
  translate([-2, -(18-7)/2, 0.2]) cube([0.8, (18-5)/2, 0.4], center=true);
}
