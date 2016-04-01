module model.particle_model;

import std.format;

import model.model;
import types;

class ParticleModel : Model {
	WorldDim vel;

	this(
		WorldPos pos=WorldPos(0, 0),
		WorldDim vel=WorldDim(0, 0),
		double heading=0
	) {
		super(pos, heading);
		this.vel = vel;
	}

	override void update() {
		pos += vel;
	}

	override void toString(void delegate(const(char)[]) sink) const {
		formattedWrite(sink, "{%s, %s, %s}", pos, vel, heading);
	}
}
