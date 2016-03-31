module robot;

import std.algorithm;
import std.array;

import controller.controller;
import model.model;
import sensor.sensor;
import simulator;

struct Robot {
	protected {
		Model model;
		Sensor[] sensors;
		Controller controller;
	}

	this(Model model, Controller controller) {
		this.model = model;
		this.controller = controller;
	}

	void addSensor(Sensor sensor) { sensors ~= sensor; }

	void update(Simulator simulator) {
		controller.update(
			sensors.map!(s => s.sense(simulator))
				.array
		);
	}
}
