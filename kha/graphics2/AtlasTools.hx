package kha.graphics2;

class AtlasTools {
	// TODO (DK) handle frame + rotation
	public static inline function drawSubTexture( g2 : kha.graphics2.Graphics, t : SubTexture, x : FastFloat, y : FastFloat )
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, x, y, t.sw, t.sh);

	// TODO (DK) handle frame + rotation
	public static inline function drawScaledSubTexture( g2 : kha.graphics2.Graphics, t: SubTexture, dx : FastFloat, dy : FastFloat, dw : FastFloat, dh : FastFloat )
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, dx, dy, dw, dh);
}
