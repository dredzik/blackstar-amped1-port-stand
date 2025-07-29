all: compile

compile:
	openscad -q src/Front.scad -o target/BlackstarAmped1FrontPlate.stl
	openscad -q src/Side.scad -o target/BlackstarAmped1SidePlate.stl
