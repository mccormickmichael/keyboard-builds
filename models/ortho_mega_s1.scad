
// Ortho Mega section 1: Top left corner.

include <parameters.scad>

plat_x = border + 4*key_cell + m_key_cell_x;
plat_y = border + 3*key_cell;

use <common.scad>

// TODO: holes for lights or a display, if you want them

difference() {
  union() {
    cube([plat_x, plat_y, 5], center = true);
    e_post_y(-(plat_x-b_post)/2, -(plat_y-b_post)/2);
    e_post(-(plat_x-b_post)/2, (plat_y-b_post)/2);
    e_post_x((plat_x-b_post)/2, (plat_y-b_post)/2);

    i_post_y((plat_x - m_post_s)/2, -(plat_y - m_post_l)/2);
    i_post_x((plat_x - m_post_l)/2, -(plat_y - m_post_s)/2);
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
