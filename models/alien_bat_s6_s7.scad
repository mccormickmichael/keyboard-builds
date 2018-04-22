
// Alien bat sections 6 and 7: bottom center sections

include <parameters.scad>

plat_x = 4 * key_cell;
plat_y = border + 2 * key_cell + m_key_cell_x;

use <common.scad>

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    e_post_x(-(plat_x-b_post)/2, -(plat_y-b_post)/2);
    e_post_x((plat_x-b_post)/2, -(plat_y-b_post)/2);

    i_post_y((plat_x-m_post_s)/2, (plat_y-m_post_l)/2);
    i_post_x((plat_x-m_post_l)/2, (plat_y-m_post_s)/2);
    i_post_y(-(plat_x-m_post_s)/2, (plat_y-m_post_l)/2);
    i_post_x(-(plat_x-m_post_l)/2, (plat_y-m_post_s)/2);
  }

  for (row = [0:1]) {
    for (col = [0:3]) {
      keyhole(-plat_x/2 + col*key_cell + key_cell/2, plat_y/2 - row*key_cell - key_cell/2);
    }
  }
  for (col = [0:2]) {
    keyhole(-key_cell + col*key_cell, -plat_y/2 + border + m_key_cell_x/2);
  }
}
