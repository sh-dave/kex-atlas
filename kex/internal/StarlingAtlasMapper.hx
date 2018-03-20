package kex.internal;

#if haxe_format_starling
class StarlingAtlasMapper {
	public static inline function mapSubTexture( t : format.starling.Data.SubTexture, image : Image ) : SubTexture return {
		image : image,
		sx : t.x, sy : t.y,
		sw : t.width, sh : t.height,
		fx : -(t.frameX != null ? t.frameX : 0), fy : -(t.frameY != null ? t.frameY : 0),
		fw : t.frameWidth != null ? t.frameWidth : t.width, fh : t.frameHeight != null ? t.frameHeight : t.height,
		rotated : t.rotated,
	}
}
#end
