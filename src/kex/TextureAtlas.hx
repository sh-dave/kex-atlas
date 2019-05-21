package kex;

@:forward
abstract TextureAtlas(Map<String, SubTexture>) {
	@:from public static function ofMap( m: Map<String, SubTexture> )
		return new TextureAtlas(m);

	inline function new( m: Map<String, SubTexture> )
		this = m;
}
