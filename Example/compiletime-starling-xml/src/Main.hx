package;

using kha.graphics2.AtlasTools;

@:build(kha.internal.StarlingAtlasBuilder.build('../../common/Sheets/items-starling.xml', 'items_starling'))
private class ItemsAtlas {}

class Main {
	public static function main()
		kha.System.init(
			{ width : 1024, height : 512 },
			kha.Assets.loadEverything.bind(setup)
		);

	static var items : ItemsAtlas;

	public static function setup() {
		items  = new ItemsAtlas();
		kha.System.notifyOnRender(render);
	}

	static function render( fb : kha.Framebuffer ) {
		var g2 = fb.g2;
		
		g2.begin();
			g2.drawScaledSubTexture(items.cupcake, 0, 0, items.cupcake.fw * 2, items.cupcake.fh * 2);
			g2.drawSubTextureDebug(items.cupcake, 0, 0);
			
			g2.drawScaledSubTexture(items.brezel, 512, 0, items.brezel.fw * 2, items.brezel.fh * 2);
			g2.drawSubTextureDebug(items.brezel, 512, 0);
		g2.end();
	}
}
