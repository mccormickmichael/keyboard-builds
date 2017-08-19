key_height = 8;

bottom_x_size = 37;
bottom_y_size = 18;

top_x_size = 32;
top_y_size = 15;

difference() {
  union() {
    difference() {
      linear_extrude(height = key_height, scale = [top_x_size / bottom_x_size, top_y_size / bottom_y_size]) {
        square(size=[bottom_x_size, bottom_y_size], center=true);
      }
      linear_extrude(height = 5, scale = [(top_x_size-3)/(bottom_x_size-3), (top_y_size-3)/(bottom_y_size-3)]) {
        square(size=[bottom_x_size-3, bottom_y_size-3], center=true);
      }
    }
    for (offset=[-12, 0, 12]) {
      translate([offset, 0, 3]) cube([7, 5, 6], center=true);
    }
  }
  for (offset=[-12, 0, 12]) {
    translate([offset, 0, 3]) {
      cube([5, 1.3, 6], center=true);
      cube([1.2, 6, 6], center=true);
    }
  }
}
