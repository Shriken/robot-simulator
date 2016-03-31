module model.model;

import std.format;

import types;

class Model {
	WorldPos pos = WorldPos(0, 0);
	WorldDim vel = WorldPos(0, 0);
	double heading = 0;

	WorldDim[] boundaryOffsets = [
		WorldDim(1, 1),
		WorldDim(-1, 1),
		WorldDim(-1, -1),
		WorldDim(1, -1),
	];

	@property BoundaryRange boundary() {
		return BoundaryRange(boundaryOffsets, pos);
	}

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

struct BoundaryRange {
	WorldDim[] boundaryOffsets;
	WorldPos pos;

	@property bool empty() const {
		return boundaryOffsets.length == 0;
	}

	@property WorldDim front() {
		return pos + boundaryOffsets[0];
	}

	@property void popFront() {
		boundaryOffsets = boundaryOffsets[1 .. $];
	}

	WorldDim opIndex(size_t i) {
		return pos + boundaryOffsets[i];
	}

	size_t opDollar() {
		return boundaryOffsets.length;
	}
}
