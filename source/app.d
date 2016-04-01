import std.stdio;

import model.particle_model;
import sensor.distance_sensor;
import simulator;
import types;

void main() {
	Simulator simulator = new Simulator();
	auto robotModel = new ParticleModel(WorldPos(0, 0), WorldDim(1, 0));
	simulator.addModel(robotModel);
	simulator.addModel(new ParticleModel(WorldPos(1, 0), WorldDim(2, 0)));
	auto sensor = new DistanceSensor(robotModel);

	writeln("simulator:\t", simulator);
	writeln("sensed at:\t", sensor.sense(simulator));
	writeln();

	simulator.tick();
	writeln("simulator:\t", simulator);
	writeln("sensed at:\t", sensor.sense(simulator));
}
