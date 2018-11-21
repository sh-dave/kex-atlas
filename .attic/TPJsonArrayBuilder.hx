package kex.internal;

// #if haxe_format_tpjsonarray

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sys.io.File;

class TPJsonArrayBuilder {
	macro public static function build( filename : String, image : String ) : Array<Field> {
		var fields = Context.getBuildFields();
		var fileContent = File.getContent(Context.resolvePath(filename));
		var atlas = haxe.Json.parse(fileContent);
		var frames : Array<Dynamic> = atlas.frames;

// {
// 	"filename": "parrot2.png",
// 	"frame": {"x":161,"y":1,"w":28,"h":34},
// 	"rotated": false,
// 	"trimmed": true,
// 	"spriteSourceSize": {"x":18,"y":15,"w":28,"h":34},
// 	"sourceSize": {"w":64,"h":64},
// 	"pivot": {"x":0.5,"y":0.5}
// },

		for (frame in frames) {
			fields.push({
				name : kha.internal.FilenameTools.sanitizeId(frame.filename),
				kind : FVar(macro : kha.SubTexture, macro {
					image : kha.Assets.images.$image,
					sx : $v{frame.frame.x}, sy : $v{frame.frame.y}, sw : $v{frame.frame.w}, sh : $v{frame.frame.h},
					fx : $v{frame.spriteSourceSize.x}, fy : $v{frame.spriteSourceSize.y}, fw : $v{frame.sourceSize.w}, fh : $v{frame.sourceSize.h},
					rotated : $v{frame.rotated},

					// TODO (DK) handle frame.pivot.x / frame.pivot.y
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

// #end
