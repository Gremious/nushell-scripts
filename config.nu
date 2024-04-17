use ./gif.nu

alias ii = start
alias zq = zoxide query
alias rm = rm --trash

def show [path: path = "."] {
	match ($path | path type) {
		"file" => { bat -p $path },
		"dir" => { ls $path },
		_ => "idk"
	}
}

def to_kebab [glob: glob] {
	ls $glob | each { |f|
		let ext = (echo $f.name | path parse | get extension);
		let cur_stem = (echo $f.name | path parse | get stem);
		let new_name = (build-string (echo $cur_stem | str kebab-case) "." $ext)
			mv $f.name $new_name
	}
}

def scripts [] {
	fd '(nu$|sh$)' C:\Users\Gremious\bin\ | fzf --sync | nu $in
}
