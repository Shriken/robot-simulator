module model.car_model;

import std.algorithm;
import std.math;

import model.model;

class CarModel : Model {
	double acceleration = 0;
	double steeringAngle = 0;
	double steeringAngleRange = PI / 2;

	void setSteeringAngle(double steeringAngle) {
		this.steeringAngle = clamp(
			steeringAngle,
			-steeringAngleRange,
			steeringAngleRange
		);
	}

	void setAcceleration(double acceleration) {
		this.acceleration = acceleration;
	}

	override void update() {}
}
