difference($fn=100) {
  length = 147;
  length1 = length / 2;

  width = 40;
  width1 = width / 2;

  height = 15;
  height1 = height / 2;

  rimSize = 2.5;
  rimSize1 = rimSize / 2;
  rimSize2 = rimSize * 2;
  rimSize4 = rimSize * 4;

  cube([length, width, height], true);

  // The big gap in the middle
  translate([0, 0, rimSize])
    cube([length - rimSize4, width, height - rimSize2], true);

  rimWidth = 2.5;
  rimHalf = rimWidth / 2;

  // X axis rim
  xr = 0;
  yr = width1 - rimSize1;
  zr = height1 - (rimSize + rimSize1);

  translate([xr, yr, -zr])
    cube([length - rimSize4, rimSize, rimSize], true);
  translate([0, -yr, -zr])
    cube([length - rimSize4, rimSize, rimSize], true);

  // Z axis rim
  xr = length1 - (rimSize + rimSize1);
  yr = width1 - rimSize1;
  zr = 0;
  
  translate([xr, yr, zr])
    cube([rimWidth, rimWidth, height], true);
  translate([xr, -yr, zr])
    cube([rimWidth, rimWidth, height], true);
  translate([-xr, yr, zr])
    cube([rimWidth, rimWidth, height], true);
  translate([-xr, -yr, zr])
    cube([rimWidth, rimWidth, height], true);

  // Decorative holes
  cdiameter = 24.5;
  xc_offset = (length / 4);
  xc1 = xc_offset / 2;
  xc2 = xc1 + xc_offset;
    
  translate([xc1, 0, 0])
    cylinder(d = cdiameter, h = height, center = true);
  translate([xc2, 0, 0])
    cylinder(d = cdiameter, h = height, center = true);
  translate([-xc1, 0, 0])
    cylinder(d = cdiameter, h = height, center = true);
  translate([-xc2, 0, 0])
    cylinder(d = cdiameter, h = height, center = true);

  // Nut inserts
  nx = (length / 2) - rimSize;
  ny = width1 / 2;
  nz = rimSize;
  
  translate([nx, ny, nz])
    rotate([0, 90, 0])
      m3_nut_insert();

  translate([nx, -ny, nz])
    rotate([0, 90, 0])
      m3_nut_insert();

  translate([-nx, ny, nz])
    rotate([0, -90, 0])
      m3_nut_insert();

  translate([-nx, -ny, nz])
    rotate([0, -90, 0])
      m3_nut_insert();
}

module m3_nut_insert() {
  union() {
    translate([0, 0, 1])
      cylinder(d = 3, h = 3, center = true);
    translate([0, 0, -1.5])
      cylinder(r = 3.175, h = 2, center = true, $fn = 6);
  }
}
