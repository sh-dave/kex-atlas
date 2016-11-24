package;

using kha.graphics2.AtlasTools;
using kha.AtlasAssets;

class Main {
	public static function main() kha.System.init({ width : 1024, height : 512 }, kha.Assets.loadEverything.bind(setup));

	static var items : kha.TextureAtlas;

	public static function setup() {
		kha.Assets.loadAtlas(kha.AtlasFormat.StarlingXml, 'items_starling_xml', function( atlas ) {
			items = atlas;
			kha.System.notifyOnRender(render);
		});
	}

	static function render( fb : kha.Framebuffer ) {
		var g2 = fb.g2;

		g2.begin();
			var cc = items.get('cupcake');
			g2.drawScaledSubTexture(cc, 0, 0, cc.fw * 2, cc.fh * 2);
			g2.drawSubTextureDebug(cc, 0, 0);

			var brezel = items.get('brezel');
			g2.drawScaledSubTexture(brezel, 512, 0, brezel.fw * 2, brezel.fh * 2);
			g2.drawSubTextureDebug(brezel, 512, 0);
		g2.end();
	}
}
