#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/apple/pkl"
TOOL_NAME="pkl"
TOOL_TEST="pkl -v"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

# convert os to macos, linux, or alpine-linux
get_os() {
	if test -f /etc/os-release; then
		case $(. /etc/os-release && echo "$ID") in
		alpine) echo "alpine-linux" ;;
		*) echo "linux" ;;
		esac
	else
		local os
		os="$(uname -s | tr '[:upper:]' '[:lower:]')"
		case "$os" in
		darwin) echo "macos" ;;
		linux) echo "linux" ;;
		*) fail "Unsupported OS: $os" ;;
		esac
	fi
}

get_arch() {
	case "$(uname -m)" in
	aarch64) echo "aarch64" ;;
	arm64) echo "aarch64" ;;
	arm) echo "aarch64" ;;
	x86_64) echo "amd64" ;;
	*) fail "Unknown architecture: $(uname -m)" ;;
	esac
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$GH_REPO/releases/download/${version}/pkl-$(get_os)-$(get_arch)"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		chmod +x "$install_path/$TOOL_NAME"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
