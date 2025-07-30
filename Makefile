all: compile

compile:
	openscad -q src/Back.scad -o target/BlackstarAmped1BackPlate.stl
	openscad -q src/Front.scad -o target/BlackstarAmped1FrontPlate.stl
	openscad -q src/Side.scad -o target/BlackstarAmped1SidePlate.stl
