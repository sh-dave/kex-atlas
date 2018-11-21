package kex.graphics2;

import kha.graphics2.Graphics;
import kex.internal.MathTools.linearRemap;

class G2AtlasExtension {
	public static inline function drawSubTexture( g2: Graphics, t: SubTexture, x: FastFloat, y: FastFloat )
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, x + t.fx, y + t.fy, t.sw, t.sh);

	public static inline function drawScaledSubTexture( g2: Graphics, t: SubTexture, x: FastFloat, y: FastFloat, w: FastFloat, h: FastFloat )
		g2.drawScaledSubImage(
			t.image, t.sx, t.sy, t.sw, t.sh,
			x + linearRemap(t.fx, 0, t.fw, 0, w),
			y + linearRemap(t.fy, 0, t.fh, 0, h),
			linearRemap(t.sw, 0, t.fw, 0, w),
			linearRemap(t.sh, 0, t.fh, 0, h)
		);

	// green rectangle: trimmed size
	// red rectangle: original image size
	public static function drawSubTextureDebug( g2: Graphics, t: SubTexture, x: FastFloat, y: FastFloat ) {
		var colorGuard = g2.color;
		g2.drawScaledSubImage(t.image, t.sx, t.sy, t.sw, t.sh, x + t.fx, y + t.fy, t.sw, t.sh);
		g2.color = kha.Color.Red;
		g2.drawRect(x, y, t.fw, t.fh);
		g2.color = kha.Color.Green;
		g2.drawRect(x + t.fx, y + t.fy, t.sw, t.sh);
		g2.color = colorGuard;
	}
}
