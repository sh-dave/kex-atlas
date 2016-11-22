package kha.internal;

#if haxe_format_starling

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sys.io.File;

using StringTools;

class StarlingAtlasBuilder {
	macro public static function build( filename : String, image : String ) : Array<Field> {
		var fields = Context.getBuildFields();
		var fileContent = File.getContent(Context.resolvePath(filename));
		var atlas = new format.starling.Reader(Xml.parse(fileContent)).read();
		var subTextures = atlas.subTextures;

		for (id in subTextures.keys()) {
			var st = subTextures.get(id);
			fields.push({
				name : sanitizeId(id),
				kind : FVar(macro : kha.SubTexture, macro {
					image : kha.Assets.images.$image,
					sx : $v{st.x}, sy : $v{st.y}, sw : $v{st.width}, sh : $v{st.height},
					fx : $v{st.frameX}, fy : $v{st.frameY}, fw : $v{st.frameWidth}, fh : $v{st.frameHeight},
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

	static inline function sanitizeId( id : String ) return id
		.replace('-', '_')
		.replace(' ', '_')
		.replace('+', '_')
		.replace('.', '_')
		.replace('/', '_')
		.replace(',', '_')
		.replace('\\', '_')
		.replace(';', '_');
}

#end
