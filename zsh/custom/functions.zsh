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

function getFinalRedirect {
    local url=$1
    while true; do
        nextloc=$( curl -s -I $url | grep -i ^Location: )
        if [ -n "$nextloc" ]; then
            url=${nextloc##location: }
        else
            break
        fi
    done

    echo $url
}

fuckwebp () {
    if [ -z "$1" -o -z "$2" ]; then
        echo "missing arguments"
        return 1
    fi
    file=$1
    filename=$(echo $file | rev | cut -d. -f2- | rev)
    ffmpeg -i "$file" "$filename.$2"
}
