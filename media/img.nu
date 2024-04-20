export def make_transparent [path: path, --strength: int = 13] {
	let out_name = outname $path 'trans'

	let strength = $"($strength)%"

	magick convert $path -fuzz $strength -transparent white $out_name

	$out_name
}

export def trim [path: path] {
	let out_name = outname $path 'trim'

	magick convert $path -trim $out_name

	$out_name
}

