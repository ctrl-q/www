#!/bin/bash

set -e
set -o nounset
set -o pipefail

if [ -z "${BROWSER:-}" ]; then
	IFS=: read -ra data_dirs <<< "${XDG_DATA_DIRS}"
	for data_dir in "${data_dirs[@]}"; do
		if [ -d "${data_dir}/applications" ]; then
			grep -l "Categories=.*WebBrowser" "${data_dir}"/applications/*.desktop |
			xargs sed -e '/^Exec=.*%[uU]/ { s/^Exec=//;s/%[uU]//g;p }; d'
		fi
	done | sort | dmenu | xargs -d '\n' -i echo {} "'${1}'" | bash
else exec ${BROWSER} "$@"
fi
