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

ttm () {
    if [ -z "$1" ]; then
        echo "missing -f or -u flag"
        return 1
    fi
    case $1 in
    "-f")
        if [ -z "$2" ]; then
            echo "missing filename"
            return 1
        fi
        ecxo "size: $(stat -c %s $2)"
        payload="file=$2"
        ;;
    "-u")
        if [ -z "$2" ]; then
            echo "missing url"
            return 1
        fi
        payload="url=$2"
        ;;
    esac
    curl -F"$payload" https://ttm.sh | pbcopy
}