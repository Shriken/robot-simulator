module simulator;

import std.format;

import model;

class Simulator {
	Model[] models;

	void tick() {
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
