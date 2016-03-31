module controller.car_controller;

import controller.controller;
import model.car_model;

class CarController : Controller {
	@property CarModel model() { return cast(CarModel) this.model; }

	this(CarModel model) {
		super(model);
	}

	override void update(double[] sensorOutput) {
	}
}
