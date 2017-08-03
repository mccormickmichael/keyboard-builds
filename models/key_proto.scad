keys_x = 4;
keys_y = 4;

key_size = 14;
inter_key = 5;

cell_size = key_size + inter_key;
plat_x = keys_x * (cell_size) + inter_key;
plat_y = keys_y * (cell_size) + inter_key;

union() {
  difference() {
    cube([plat_x, plat_y, 5], center = true);
    for (yk = [0:(keys_y - 1)]) {
      translate([-cell_size*(keys_x - 1)/2, -cell_size*(keys_y - 1)/2 + cell_size * yk, 0]) {
        for (xk = [0:(keys_x - 1)]) {
          translate([cell_size * xk, 0, 0]) {
            cube([key_size, key_size, 6], center = true);
            cube([key_size + 1, key_size + 1, 2], center = true);
          }
        }
      }
    }
  }
  for (x = [-1, 1]) {
    for (y = [-1, 1]) {
      translate([x*(cell_size*keys_x+1)/2, y*(cell_size*keys_y+1)/2, inter_key*1.5]) {
        translate([0, -y*inter_key, 0]) {
          difference() {
            cube([inter_key-1, 3*inter_key-1, inter_key*3], center = true);
            rotate([0, 90, 0]) {
              cylinder(h=inter_key+1, r=inter_key/2, center = true, $fn=32);
            }
          }
        }
        translate([-x*inter_key, 0, 0]) {
          cube([3*inter_key-1, inter_key-1, inter_key*3], center = true);
        }
      }
    }
  }
}
        


//TODO: consider a snap-in ring around the inside of the insert
//TODO: 4x4, 19mm on center