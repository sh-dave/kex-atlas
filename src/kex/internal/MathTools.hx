package kex.internal;

class MathTools {
	public static inline function lerp( t: Float, a: Float, b: Float )
		return a + t * (b - a);

	public static inline function unlerp( t: Float, a: Float, b: Float )
		return (t - a) / (b - a);

	public static inline function linearRemap( x: Float, a: Float, b: Float, c: Float, d: Float )
		return lerp(unlerp(x, a, b), c, d);
}
