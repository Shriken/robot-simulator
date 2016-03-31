module simulator;

import std.algorithm;
import std.format;
import std.math;

import model.model;
import robot;
import types;

class Simulator {
	// simulation data
	Model[] models;
	Robot[] robots;

	void addModel(Model model) { models ~= model; }
	void addRobot(Robot robot) { robots ~= robot; }

	// worldbounds is the furthest from the center in either axis
	private {
		double bounds;
		bool boundsDirty = true;
	}
	@property double worldBounds() {
		if (boundsDirty) {
			bounds = max(
				models.map!(m => abs(m.pos.x)).reduce!max,
				models.map!(m => abs(m.pos.y)).reduce!max
			);
			boundsDirty = false;
		}

		return bounds;
	}

	void tick() {
		boundsDirty = true;
		foreach (model; models) {
			model.update();
		}
	}

	void toString(void delegate(const(char)[]) sink) const {
		formattedWrite(sink, "%s", models);
	}
}
