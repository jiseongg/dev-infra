#!/usr/bin/env bash

PARENT_DIR="$1"
AUTHOR="$2"
YEAR="${3:-$(date +%Y)}"

if [ -z "$PARENT_DIR" ] || [ -z "$AUTHOR" ]; then
	echo "Usage: $0 /path/to/parent-directory \"Author Name\" [year]"
	exit 1
fi

if [ ! -d "$PARENT_DIR" ]; then
	echo "Error: $PARENT_DIR is not a directory"
	exit 1
fi

paths=()  # 상대 경로
counts=() # 커밋 수
max_len=0 # 가장 긴 경로 길이
total=0
idx=0

for dir in "$PARENT_DIR"/*; do
	[ -d "$dir" ] || continue

	git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1 || continue

	rel="${dir#$PARENT_DIR/}"

	cnt=$(git -C "$dir" log --all --author="$AUTHOR" --since="$YEAR-01-01" --until="$YEAR-12-31" \
		--pretty=format:%h 2>/dev/null | wc -l | tr -d ' ')
	paths[idx]="$rel"
	counts[idx]="$cnt"

	((${#rel} > max_len)) && max_len=${#rel}
	total=$((total + cnt))
	idx=$((idx + 1))
done

for ((i = 0; i < ${#paths[@]}; i++)); do
	if [[ ${counts[i]} -ne 0 ]]; then
		printf "%-${max_len}s : %s\n" "${paths[i]}" "${counts[i]}"
	fi
done

echo "=========="
echo "Total commits in $YEAR: $total"
