module controller;

import model;
import sensor.sensor;

abstract class Controller {
	Model model;

	this(Model model) {
		this.model = model;
	}

	abstract void update(Model model, double[] sensorOutput);
}
