export module vid.nu
export module img.nu

export def outname [path: path, prefix: string = 'out'] {
	if ($path | path type) == "dir" {
		error make {msg: "Directory, not a file."}
	}

	$path | path parse
		| update stem { |full| $"($prefix)-($full.stem)" }
		| update extension { 'png' }
		| path join
}

