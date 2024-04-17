# def main [input: path, --fps = 30, --width = 320, --quality = 70] {
	# to_gif ($input $fps $width $quality)
# }

# mpdecimate to "remove frames that do not greatly differ from the previous frame"
def to_gif [input: path, --fps = 30, --width = 320, --quality = 70] {
	let framerate = get_framerate $input

	# Don't raise fps, only lower
	let fps = $framerate | if ($in < $fps) { $in } else { $fps }

	mkdir ./t
	cd ./t
	ffmpeg -i $input -r $fps ./%04d.png

	# glob * | path basename | str join ' '
	ls | get name | str join ' '
	| $"../gifski.exe --fps ($fps) --width ($width) --quality ($quality) -o ../out.gif ($in)"
	| nu -c $in

	cd ..
	# rm -rf ./t
}

def get_framerate [input: path] {
	ffprobe -v quiet -print_format json -show_streams $input
	| from json
	| get streams | where codec_type == "video"
	| first
	| get avg_frame_rate
	| split row '/' | first | into int
}
