lime () {
	if [ ! -z "$1" ]; then
		smerge $1
		code $1
		return 0
	fi
	return 1
}

clime () {
	cd $1
	lime $1
}

curl-gitignore () {
	lang=$1
	curl -L https://raw.githubusercontent.com/github/gitignore/main/$lang.gitignore -o .gitignore
}