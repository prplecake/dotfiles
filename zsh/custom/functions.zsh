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