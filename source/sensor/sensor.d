module sensor.sensor;

import model;
import simulator;
import types;

class Sensor {
	Model model;
	WorldDim offset = WorldDim(0, 0);
	double headingOffset = 0; // heading is model.heading + headingOffset

	@property WorldPos pos() { return model.pos + offset; }
	@property double heading() { return model.heading + headingOffset; }

	this(
		Model model,
		WorldDim offset=WorldDim(0, 0),
		double headingOffset=0
	) {
		this.model = model;
		this.offset = offset;
		this.headingOffset = headingOffset;
	}

	abstract double sense(Simulator simulator);
}
