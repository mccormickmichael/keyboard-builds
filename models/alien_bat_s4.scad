
// Alien bat section 4: top right section

include <parameters.scad>

plat_x = 4 * key_cell + key_cell/2 + border;
plat_y = 3 * key_cell + border;

use <common.scad>

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    e_post_x(-(plat_x-b_post)/2, (plat_y-b_post)/2);
    e_post((plat_x-b_post)/2, (plat_y-b_post)/2);
    e_post_y((plat_x-b_post)/2, -(plat_y-b_post)/2);

    i_post_y(-(plat_x-m_post_s)/2, -(plat_y-m_post_l)/2);
    i_post_x(-(plat_x-m_post_l)/2, -(plat_y-m_post_s)/2);
  }
  for (row = [0:2]) {
    for (col = [0:3]) {
      keyhole(-plat_x/2 + key_cell/2 + col * key_cell, -plat_y/2 + row*key_cell + key_cell/2);
    }
  }
}
