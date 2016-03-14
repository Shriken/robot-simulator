import std.stdio;

import model;
import sensor.distance_sensor;
import simulator;
import types;

void main() {
	Simulator simulator = new Simulator();
	simulator.addModel(new Model(WorldPos(0, 0), WorldDim(1, 0)));
	auto sensor = new DistanceSensor(simulator.models[0]);

	writeln(simulator);
	simulator.tick();
	writeln(simulator);
	writeln(sensor.sense(simulator));
}
