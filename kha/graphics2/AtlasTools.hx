package kha.graphics2;

class AtlasTools {
	// TODO (DK) handle rotation
	public static inline function drawSubTexture( g2 : kha.graphics2.Graphics, t : SubTexture, x : FastFloat, y : FastFloat )
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, x + t.fx, y + t.fy, t.sw, t.sh);

	// TODO (DK) handle rotation
	public static inline function drawScaledSubTexture( g2 : kha.graphics2.Graphics, t : SubTexture, dx : FastFloat, dy : FastFloat, dw : FastFloat, dh : FastFloat )
		g2.drawScaledSubImage(
			t.image, t.sx, t.sy, t.sw, t.sh,
			dx + kha.internal.MathTools.linear_remap(t.fx, 0, t.fw, 0, dw),
			dy + kha.internal.MathTools.linear_remap(t.fy, 0, t.fh, 0, dh),
			kha.internal.MathTools.linear_remap(t.sw, 0, t.fw, 0, dw),
			kha.internal.MathTools.linear_remap(t.sh, 0, t.fh, 0, dh)
		);

	// green rectangle: trimmed size
	// red rectangle: original image size
	public static inline function drawSubTextureDebug( g2 : kha.graphics2.Graphics, t : SubTexture, x : FastFloat, y : FastFloat ) {
		var colorGuard = g2.color;
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, x + t.fx, y + t.fy, t.sw, t.sh);
		g2.color = kha.Color.Red;
		g2.drawRect(x, y, t.fw, t.fh);
		g2.color = kha.Color.Green;
		g2.drawRect(x + t.fx, y + t.fy, t.sw, t.sh);
		g2.color = colorGuard;		
	}
}
