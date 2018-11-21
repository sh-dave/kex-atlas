package kex;

class RegionMapper {
#if haxe_format_tpjsaa
    public static function mapTpjsaaRegion( frame: format.tpjsaa.types.Frame, img: kha.Image ) : SubTexture
        return {
            image: img,
            sx: frame.frame.x,
            sy: frame.frame.y,
            sw: frame.frame.w,
            sh: frame.frame.h,
            fx: frame.spriteSourceSize.x,
            fy: frame.spriteSourceSize.y,
            fw: frame.spriteSourceSize.w,
            fh: frame.spriteSourceSize.h,
        }
#end

#if haxe_format_starling
    public static function mapStarlingRegion( frame: format.starling.SubTexture, img: kha.Image ) : SubTexture
        return {
            image: img,
            sx: frame.x,
            sy: frame.y,
            sw: frame.width,
            sh: frame.height,
            fx: -(frame.frameX != null ? frame.frameX : 0),
            fy: -(frame.frameY != null ? frame.frameY : 0),
            fw: frame.frameWidth != null ? frame.frameWidth : frame.width,
            fh: frame.frameHeight != null ? frame.frameHeight : frame.height,
        }
#end
}
