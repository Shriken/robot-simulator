import std.stdio;

import model;
import simulator;
import types;

void main() {
	Simulator simulator = new Simulator();
	simulator.addModel(new Model(WorldPos(0, 0), WorldDim(1, 0)));

	writeln(simulator);
	simulator.tick();
	writeln(simulator);
}
