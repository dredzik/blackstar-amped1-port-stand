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
  
  // Socket mounts
  translate([-70, 0, 0])
    socket_mount();
  translate([70, 0, 0])
    socket_mount();
  
  // Temple audio module mount  
  temple_audio_module_mount();
}

module m3_head_insert() {
  union() {
    translate([0, 0, 1])
      cylinder(d = 6, h = 3, center = true);
    translate([0, 0, -1.5])
      cylinder(d = 3, h = 2, center = true);
  }
}

module m4_head_insert() {
  union() {
    translate([0, 0, 1.25])
      cylinder(d1 = 4, d2 = 7.5, h = 2.5, center = true);
    translate([0, 0, -1.25])
      cylinder(d = 4, h = 2.5, center = true);
  }
}

module socket_mount() {
  union() {
    cylinder(d = 24.5, h = 5, center = true);
    translate([-9.5, 12, 0])
      m3_head_insert();
    translate([9.5, -12, 0])
      m3_head_insert();
  }
}

module temple_audio_module_mount() {
  union() {
    minkowski() {
      cube([92 - 4, 31 - 4, 5 - 1], true);
      cylinder(d = 4, h = 1, center = true);
    }
    translate([51.15, -12.60, 0])
      m4_head_insert();
    translate([-51.15, 12.60, 0])
      m4_head_insert();
  }
}