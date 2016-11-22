package kha;

import kha.Assets;

class AtlasAssets {
	public static function loadAtlas( assets : Class<kha.Assets>, fmt : AtlasFormat, name : String, done : TextureAtlas -> Void ) {
		var description = Reflect.field(kha.Assets.blobs, '${name}Description');
		LoaderImpl.loadBlobFromDescription(description, function( blob : Blob ) {
			switch (fmt) {
#if haxe_format_starling
				case AtlasFormat.StarlingXml:
					var xml = Xml.parse(blob.toString());
					var ta = new format.starling.Reader(xml).read();
					var clean1 = haxe.io.Path.withoutExtension(ta.imagePath);
					var clean2 = kha.internal.FilenameTools.sanitizeId(clean1);

					kha.Assets.loadImage(clean2, function( image : Image ) {
						done([
							for (id in ta.subTextures.keys())
								id => kha.internal.StarlingAtlasMapper.mapSubTexture(ta.subTextures.get(id), image)
						]);
					});
#end
				case AtlasFormat.TexturePackerJsonArray:
					// haxe.macro.Context.error('TODO (DK) IMPLEMENT ME');
					throw 'TODO (DK)AtlasAssets.loadAtlas / TexturePackerJsonArray implement me';
			}
		});
	}
}
