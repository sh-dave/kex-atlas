package kha;

import kha.Assets;

class AtlasAssets {
	public static function loadAtlas( assets : Class<kha.Assets>, fmt : AtlasFormat, name : String, done : TextureAtlas -> Void ) {
		var description = Reflect.field(kha.Assets.blobs, '${name}Description');
		LoaderImpl.loadBlobFromDescription(description, function( blob : Blob ) {
			switch (fmt) {
#if haxe_format_starling
				case StarlingXml:
					var xml = Xml.parse(blob.toString());
					var ta = new format.starling.Reader(xml).read();

					kha.Assets.loadImage(haxe.io.Path.withoutExtension(ta.imagePath), function( image : Image ) {
						done([
							for (id in ta.subTextures.keys())
								id => kha.internal.StarlingAtlasMapper.mapSubTexture(ta.subTextures.get(id), image)
						]);
					});
#end
			}
		});
	}
}
