package kha.internal;

#if haxe_format_starling
class StarlingAtlasMapper {
	public static inline function mapSubTexture( t : format.starling.Data.SubTexture, image : Image ) : SubTexture return {
		image : image,
		sx : t.x, sy : t.y,
		sw : t.width, sh : t.height,
		fx : t.frameX, fy : t.frameY,
		fw : t.frameWidth, fh : t.frameHeight,
		rotated : t.rotated,
	}
}
#end
