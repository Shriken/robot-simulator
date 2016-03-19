module sensor.distance_sensor;

import std.math;

import model;
import sensor.sensor;
import simulator;
import types;
import utils;

class DistanceSensor : Sensor {
	this(
		Model model,
		WorldDim offset=WorldDim(0, 0),
		double headingOffset=0
	) {
		super(model, offset, headingOffset);
	}

	override double sense(Simulator simulator) {
		double closestSensed = double.infinity;

		foreach (model; simulator.models) {
			if (model is this.model) {
				continue;
			}

			auto heading = this.heading;
			auto rayDirection = WorldDim(cos(heading), sin(heading));

			size_t i = 0;
			foreach (point; model.boundary) {
				auto nextPoint = model.boundary[(i + 1) % $];
				auto intersection = intersect(
					point, nextPoint,
					pos, pos + simulator.worldBounds * rayDirection
				);

				if (
					segmentsIntersect(
						point, nextPoint,
						pos, pos + simulator.worldBounds * rayDirection
					)
				) {
					auto dist = (intersection - this.pos).length;
					if (dist < closestSensed) {
						closestSensed = dist;
					}
				}
				i++;
			}
		}

		return closestSensed;
	}
}
