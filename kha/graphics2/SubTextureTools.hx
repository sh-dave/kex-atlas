package kha.graphics2;

class SubTextureTools {
	// TODO (DK) handle frame + rotation
	public static inline function drawSubTexture( g2 : kha.graphics2.Graphics, i : Image, t : format.starling.Data.SubTexture, x : FastFloat, y : FastFloat )
		g2.drawScaledSubImage(i, t.x, t.y, t.width, t.height, x, y, t.width, t.height);

	// TODO (DK) handle frame + rotation
	public static inline function drawScaledSubTexture( g2 : kha.graphics2.Graphics, i : Image, t : format.starling.Data.SubTexture, dx : FastFloat, dy : FastFloat, dw : FastFloat, dh : FastFloat )
		g2.drawScaledSubImage(i, t.x, t.y, t.width, t.height, dx, dy, dw, dh);
}
