
// Alien bat section 8: bottom left

include <parameters.scad>

plat_x = 4 * key_cell + key_cell/2 + border;
plat_y = 2 * key_cell + m_key_cell_x + border;

use <common.scad>

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    e_post_x(-(plat_x-b_post)/2, -(plat_y-b_post)/2);
    e_post((plat_x-b_post)/2, -(plat_y-b_post)/2);
    e_post_y((plat_x-b_post)/2, (plat_y-b_post)/2);

    i_post_y(-(plat_x-m_post_s)/2, (plat_y-m_post_l)/2);
    i_post_x(-(plat_x-m_post_l)/2, (plat_y-m_post_s)/2);
  }
  keyhole(-plat_x/2 + key_cell/2, plat_y/2 - key_cell/2);
  keyhole(-plat_x/2 + key_cell + key_cell/2, plat_y/2 - key_cell/2);
  keyhole(-plat_x/2 + key_cell/2, plat_y/2 - key_cell - key_cell/2);
  keyhole(-plat_x/2 + key_cell + key_cell/2, plat_y/2 - key_cell - key_cell/2);
  keyhole(l_key_cell_x/2, plat_y/2 - key_cell/2);

  for (col = [0:2]) {
    keyhole(plat_x/2 - col*key_cell - key_cell/2, -plat_y/2 + key_cell/2);
  }
  keyhole(plat_x/2 - key_cell - key_cell/2, -plat_y/2 + key_cell + key_cell/2);
}
