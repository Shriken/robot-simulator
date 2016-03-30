module robot;

import std.algorithm;
import std.array;

import controller;
import model;
import sensor.sensor;
import simulator;

struct Robot {
	Model model;
	Sensor[] sensors;
	Controller controller;

	this(Model model, Controller controller) {
		this.model = model;
		this.controller = controller;
	}

	void update(Simulator simulator) {
		model.update();
		controller.update(
			model,
			sensors.map!(s => s.sense(simulator))
				.array
		);
	}
}
