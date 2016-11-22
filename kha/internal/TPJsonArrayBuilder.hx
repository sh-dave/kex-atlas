package kha.internal;

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

		for (frame in frames) {
			fields.push({
				name : kha.internal.FilenameTools.sanitizeId(frame.filename),
				kind : FVar(macro : kha.SubTexture, macro {
					image : kha.Assets.images.$image,
					sx : $v{frame.frame.x}, sy : $v{frame.frame.y}, sw : $v{frame.frame.w}, sh : $v{frame.frame.h},
					fx : $v{frame.spriteSourceSize.x}, fy : $v{frame.spriteSourceSize.y}, fw : $v{frame.spriteSourceSize.w}, fh : $v{frame.spriteSourceSize.h},
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
