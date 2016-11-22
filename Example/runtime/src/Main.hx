package;

using kha.graphics2.AtlasTools;
using kha.AtlasAssets;

class Main {
	public static function main() kha.System.init({ width : 1024, height : 512 }, kha.Assets.loadEverything.bind(setup));

	static var birds : kha.TextureAtlas;

	public static function setup() {
		kha.Assets.loadAtlas(kha.AtlasFormat.StarlingXml, 'birds_xml', function( a ) {
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
