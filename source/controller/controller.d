module controller.controller;

import model.model;
import sensor.sensor;

abstract class Controller {
	protected Model _model;

	this(Model model) {
		this._model = model;
	}

	abstract void update(double[] sensorOutput);
}
