
// Ortho Mega section 1: Top left corner.
key_size = 14;
key_sep = 5;
m_key_sep = 13.5;

border = 8;
b_post = 8;
m_post_s = 2;
m_post_l = 5;
post_z = 15;

key_cell = key_size + key_sep;
m_key_cell_x = key_size + m_key_sep;

plat_x = border + 4*key_cell + m_key_cell_x;
plat_y = border + 3*key_cell;
plat_z = 5;

module keyhole(x, y) {
  translate([x, y, 0]) {
    cube([key_size, key_size, plat_z + 1], center = true);
    cube([key_size + 1, key_size + 1, plat_z -2], center = true);
  }
}

// TODO: holes for lights, if you want them
// TODO: bolt holes for attaching sections 2 and 5

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    for (t = [[-1, 1], [1, 1], [-1, -1]]) {
      translate([t[0]*(plat_x-b_post)/2, t[1]*(plat_y-b_post)/2, -(plat_z + post_z)/2]) cube([b_post, b_post, post_z], center = true);
    }
    translate([(plat_x - m_post_s)/2, -(plat_y - m_post_l)/2, -(plat_z + post_z)/2]) cube([m_post_s, m_post_l, post_z], center = true);
    translate([(plat_x - m_post_l)/2, -(plat_y - m_post_s)/2, -(plat_z + post_z)/2]) cube([m_post_l, m_post_s, post_z], center = true);
  }
  
  for (i = [0:3]) {
    keyhole(-plat_x/2 + border + key_cell/2 + i*key_cell, -plat_y/2 + key_cell/2);
  }  
  for (i = [0:2]) {
    keyhole(plat_x/2 - m_key_cell_x/2, -plat_y/2 + key_cell/2 + i*key_cell);
  } 
  keyhole(plat_x/2 - m_key_cell_x - m_key_cell_x/2, -plat_y/2 + key_cell + key_cell/2);
  keyhole(plat_x/2 - 2*m_key_cell_x - m_key_cell_x/2, -plat_y/2 + key_cell + key_cell/2);

}