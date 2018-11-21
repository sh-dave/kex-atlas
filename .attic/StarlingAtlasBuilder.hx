package kex.internal;

#if haxe_format_starling

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sys.io.File;

class StarlingAtlasBuilder {
	macro public static function build( filename : String, image : String ) : Array<Field> {
		var fields = Context.getBuildFields();
		var fileContent = File.getContent(Context.resolvePath(filename));
		var atlas = new format.starling.Reader(Xml.parse(fileContent)).read();
		var subTextures = atlas.subTextures;

		for (id in subTextures.keys()) {
			var st = subTextures.get(id);
			fields.push({
				name : kha.internal.FilenameTools.sanitizeId(id),
				kind : FVar(macro : kha.SubTexture, macro {
					image : kha.Assets.images.$image,
					sx : $v{st.x}, sy : $v{st.y}, sw : $v{st.width}, sh : $v{st.height},
					fx : -$v{st.frameX != null ? st.frameX : 0}, fy : -$v{st.frameY != null ? st.frameY : 0},
					fw : $v{st.frameWidth != null ? st.frameWidth : st.width}, fh : $v{st.frameHeight != null ? st.frameHeight : st.height},
					rotated : $v{st.rotated}
				}),
				access : [APublic],
				pos : Context.currentPos(),
			});
		}

		fields.push({
			name : 'new',
			kind : FFun({ ret : null, expr : macro {}, args : [] }),
			access : [APublic],
			pos : Context.currentPos(),
		});

		return fields;
	}
}

#end
