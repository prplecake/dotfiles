lime () {
	if [ ! -z "$1" ]; then
		smerge $1
		subl $1
		return 0
	fi
	return 1
}
