module model;

import std.format;

import types;

class Model {
	WorldPos pos = WorldPos(0, 0);
	WorldDim vel = WorldPos(0, 0);
	double heading = 0;

	WorldDim[] boundary = [
		WorldDim(1, 1),
		WorldDim(-1, 1),
		WorldDim(-1, -1),
		WorldDim(1, -1),
	];

	this() {} // use default parameters

	this(
		WorldPos pos=WorldPos(0, 0),
		WorldDim vel=WorldDim(0, 0),
		double heading=0
	) {
		this.pos = pos;
		this.vel = vel;
		this.heading = heading;
	}

	void update() {
		pos += vel;
	}

	void toString(void delegate(const(char)[]) sink) const {
		formattedWrite(sink, "{%s, %s, %s}", pos, vel, heading);
	}
}
