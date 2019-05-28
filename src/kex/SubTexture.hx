package kex;

import kha.Image;

/**
 * A texture containing a region in the atlas.
 *
 * If the texture was trimmed, the frame data are can be used to restore it.
 */
@:structInit
class SubTexture {
	/**
	 * The atlas image
	 */
	public var image: Image;

	/**
	 * Left position of the region
	 */
	public var sx: Int;

	/**
	 * Top position of the region
	 */
	public var sy: Int;

	/**
	 * Width of the region
	 */
	public var sw: Int;

	/**
	 * Height of the region
	 */
	public var sh: Int;

	/**
	 * 0 or negative
	 */
	public var fx: Int;

	/**
	 * 0 or negative
	 */
	public var fy: Int;

	/**
	 * The full width of the original texture
	 */
	public var fw: Int;

	/**
	 * The full height of the original texture
	 */
	public var fh: Int;
}
