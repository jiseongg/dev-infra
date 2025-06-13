#!/usr/bin/env bash

# ==== Usage: ./count_commits.sh /path/to/parent-dir ====

PARENT_DIR="$1"
AUTHOR="$2"

if [ -z "$PARENT_DIR" ]; then
	echo "Usage: $0 /path/to/parent-directory \"Author Name\" [year]"
	exit 1
fi

if [ -z "$AUTHOR" ]; then
	echo "Usage: $0 /path/to/parent-directory \"Author Name\" [year]"
	exit 1
fi

if [[ -z $3 ]]; then
	CURRENT_YEAR=$(date +"%Y")
else
	CURRENT_YEAR=$3
fi

if [ ! -d "$PARENT_DIR" ]; then
	echo "Error: $PARENT_DIR is not a directory"
	exit 1
fi

total=0

for dir in "$PARENT_DIR"/*; do
	if [ -d "$dir" ]; then
		if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
			echo "Checking $dir ..."
			count=$(git -C "$dir" log --all --author="$AUTHOR" --since="$CURRENT_YEAR-01-01" --pretty=oneline 2>/dev/null | wc -l)
			echo "  $count commits"
			total=$((total + count))
		else
			echo "Skipping $dir (not a Git repo)"
		fi
	fi
done

echo "=========="
echo "Total commits in $CURRENT_YEAR: $total"
