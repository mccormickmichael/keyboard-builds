
// Ortho Mega section 1: Top left corner.
key_size = 14;
key_sep = 5;
m_key_sep = 13.5;

border = 8;
b_post = 8;
m_post_s = 2;
m_post_l = 10;
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
    translate([-(plat_x-b_post)/2, -(plat_y-b_post)/2, -(plat_z + post_z)/2]) {
      difference() {
        cube([b_post, b_post, post_z], center = true);
        rotate([90, 0, 0]) cylinder(h=b_post+1, r=2, center=true, $fn=32);
      }
    }
    translate([-(plat_x-b_post)/2, (plat_y-b_post)/2, -(plat_z + post_z)/2]) cube([b_post, b_post, post_z], center = true);
    translate([(plat_x-b_post)/2, (plat_y-b_post)/2, -(plat_z + post_z)/2]) {
      difference() {
        cube([b_post, b_post, post_z], center = true);
        rotate([0, 90, 0]) cylinder(h=b_post+1, r=2, center=true, $fn=32);
      }
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

/*
translate([-x*inter_key/3, 0, 0]) {
                rotate([90, 0, 0]) {
                  cylinder(h=inter_key, r=1.5, center = true, $fn=32);
                }
              }
*/