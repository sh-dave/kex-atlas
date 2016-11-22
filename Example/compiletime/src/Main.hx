package;

using kha.graphics2.AtlasTools;

@:build(kha.internal.StarlingAtlasBuilder.build('../../common/Sheets/birds.xml', 'birds'))
private class BirdsAtlas {}

class Main {
	public static function main()
		kha.System.init(
			{ width : 1024, height : 512 },
			kha.Assets.loadEverything.bind(setup)
		);

	static var birds : BirdsAtlas;

	public static function setup() {
		birds = new BirdsAtlas();
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
