module simulator;

import std.algorithm;
import std.format;
import std.math;

import model;
import types;

class Simulator {
	Model[] models;

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

	void addModel(Model model) {
		models ~= model;
	}

	void toString(void delegate(const(char)[]) sink) const {
		formattedWrite(sink, "%s", models);
	}
}
