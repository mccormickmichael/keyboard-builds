key_size = 14;

b_post = 8;
m_post_s = 2;
m_post_l = 10;
post_z = 15;

plat_z = 5;

module keyhole(x, y) {
  translate([x, y, 0]) {
    cube([key_size, key_size, plat_z + 1], center = true);
    cube([key_size + 1, key_size + 1, plat_z -2], center = true);
  }
}

module e_post(x, y, z) {
  translate([x, y, z]) {
    cube([b_post, b_post, post_z], center = true);
  }
}

module e_post_i(x, y, r) {
  translate([x, y, -(plat_z + post_z)/2]) {
    difference() {
      cube([b_post, b_post, post_z], center = true);
      rotate(r) cylinder(h=b_post+1, r=2, center=true, $fn=32);
    }
  }
}

module e_post_x(x, y) {
  e_post_i(x, y, [0, 90, 0]);
}


module e_post_y(x, y) {
  e_post_i(x, y, [90, 0, 0]);
}

module i_post_x(x, y) {
  translate([x, y, -(plat_z + post_z)/2]) cube([m_post_l, m_post_s, post_z], center = true);
}

module i_post_y(x, y) {
  translate([x, y, -(plat_z + post_z)/2]) cube([m_post_s, m_post_l, post_z], center = true);
}
