package kex.internal;

using StringTools;

class FilenameTools {
	public static inline function sanitizeId( id : String ) return id
		.replace('-', '_')
		.replace(' ', '_')
		.replace('+', '_')
		.replace('.', '_')
		.replace('/', '_')
		.replace(',', '_')
		.replace('\\', '_')
		.replace(';', '_');
}
