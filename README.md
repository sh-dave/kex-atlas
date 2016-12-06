# kha-textureatlas-extensions

## supported formats
- [x] starling's xml format (requires optional library [haxe-format-starling](https://github.com/sh-dave/haxe-format-starling))
- [x] texturepacker json array

## supported options
- [x] trimming
- [ ] ~~rotation - not planned~~, [reasoning here](https://github.com/sh-dave/kha-textureatlas-extension/issues/2)

## compiletime usage
```haxe
using kha.graphics2.AtlasTools; // import g2.drawSubTexture / g2.drawScaledSubTexture

// define the source for the atlas
@:build(kha.internal.TPJsonArrayBuilder.build('../../common/Sheets/birds-jsonarray.json', 'birds_jsonarray'))
private class BirdsAtlas {}

class Main {
	public static function main()
		kha.System.init(
			{ width : 1024, height : 512 },
			kha.Assets.loadEverything.bind(setup)
		);

	static var birds : BirdsAtlas;

	public static function setup() {
		birds = new BirdsAtlas(); // required images have to be loaded already
		kha.System.notifyOnRender(render);
	}

	static function render( fb : kha.Framebuffer ) {
		var g2 = fb.g2;
		
		g2.begin();
			g2.drawSubTexture(birds.owl, 16, 16);
			g2.drawScaledSubTexture(birds.rubber_duck, 512, 0, 512, 512);
		g2.end();
	}
}
```
## runtime usage
```haxe
using kha.graphics2.AtlasTools; // import g2.drawSubTexture / g2.drawScaledSubTexture
using kha.AtlasAssets; // import kha.Assets.loadAtlas

class Main {
	public static function main()
		kha.System.init(
			{ width : 1024, height : 512 },
			kha.Assets.loadEverything.bind(setup)
		);

	static var birds : kha.TextureAtlas;

	public static function setup() {
		kha.Assets.loadAtlas(kha.AtlasFormat.StarlingXml, 'birds_starling_xml', function( a ) {
			birds = a;
			kha.System.notifyOnRender(render);
		});
	}

	static function render( fb : kha.Framebuffer ) {
		var g2 = fb.g2;

		g2.begin();
			g2.drawSubTexture(birds.get('owl'), 16, 16);
			g2.drawScaledSubTexture(birds.get('rubber-duck'), 512, 0, 512, 512);
		g2.end();
	}
}
```
