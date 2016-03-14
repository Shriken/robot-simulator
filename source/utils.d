module utils;

import gfm.math.vector;

import types;

T2 convertVector(T2, T1)(T1 vec) if (
	isVectorInstantiation!T2 && isVectorInstantiation!T1
) {
	T2 result;
	foreach (i, x; vec) {
		if (i >= result.v.length) {
			break;
		}
		result[i] = x;
	}

	foreach (i; vec.v.length..result.v.length) {
		result[i] = 0.;
	}

	return result;
}

WorldPos intersect(WorldPos p1, WorldPos p2, WorldPos p3, WorldPos p4) {
	auto p = convertVector!vec3d(p1);
	auto r = convertVector!vec3d(p2 - p1);
	auto q = convertVector!vec3d(p3);
	auto s = convertVector!vec3d(p4 - p3);

	auto top = (q - p).cross(s);
	auto bottom = r.cross(s);
	auto t = top.z - bottom.z;
	return convertVector!vec2d(p + t * r);
}
