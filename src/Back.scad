difference($fn=100) {
  length = 200;
  length1 = length / 2;

  width = 40;
  width1 = width / 2;

  height = 5;
  height1 = height / 2;

  cube([length, width, height], true);

  // Nut heads
  x = length1 - 10;
  y = width1 - 10;
  z = 0;

  translate([x, y, z])
    m3_head_insert();
  translate([x, -y, z])
    m3_head_insert();
  translate([-x, y, z])
    m3_head_insert();
  translate([-x, -y, z])
    m3_head_insert();
  
  // Decorative holes
  translate([0, 0, 0])
    cylinder(d = 24.5, h = 5, center = true);
  translate([32.5, 0, 0])
    cylinder(d = 24.5, h = 5, center = true);
  translate([65, 0, 0])
    cylinder(d = 24.5, h = 5, center = true);
  translate([-32.5, 0, 0])
    cylinder(d = 24.5, h = 5, center = true);
  translate([-65, 0, 0])
    cylinder(d = 24.5, h = 5, center = true);
}

module m3_head_insert() {
  union() {
    translate([0, 0, 1])
      cylinder(d = 6, h = 3, center = true);
    translate([0, 0, -1.5])
      cylinder(d = 3, h = 2, center = true);
  }
}