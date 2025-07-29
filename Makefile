all: compile

compile:
	openscad -q Side.scad -o target/BlackstarAmped1SidePlate.stl
