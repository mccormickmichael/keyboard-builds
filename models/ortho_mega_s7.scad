
// Ortho Mega section 7: bottom mid-right section

include <parameters.scad>

plat_x = 5*key_cell;
plat_y = border + 3*key_cell;

use <common.scad>

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    e_post_x(-(plat_x-b_post)/2, -(plat_y-b_post)/2);
    
    e_post_x((plat_x-b_post)/2, -(plat_y-b_post)/2);

    i_post_y((plat_x - m_post_s)/2, (plat_y - m_post_l)/2);
    i_post_x((plat_x - m_post_l)/2, (plat_y - m_post_s)/2);
    
    i_post_y(-(plat_x - m_post_s)/2, (plat_y - m_post_l)/2);
    i_post_x(-(plat_x - m_post_l)/2, (plat_y - m_post_s)/2);
  }

  for (x = [0:4]) {
    for (y = [0:1]) {
      keyhole(-plat_x/2 + key_cell/2 + x*key_cell, plat_y/2 - key_cell/2 - y*key_cell);
    }
  }
  keyhole(-plat_x/2 + l_key_cell_x/2, plat_y/2 - key_cell/2 - 2*key_cell);
  keyhole(-plat_x/2 + l_key_cell_x + m_key_cell_x/2, plat_y/2 - key_cell/2 - 2*key_cell);
  keyhole(-plat_x/2 + l_key_cell_x + +m_key_cell_x + m_key_cell_x/2, plat_y/2 - key_cell/2 - 2*key_cell);
}
