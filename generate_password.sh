#!/usr/bin/env bash

# Usage: ./generate_password.sh <SERVICE> <USERNAME> <KEYWORD> [TARGET_FILE]

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
	echo "Usage: $0 <SERVICE> <USERNAME> <SALT> [TARGET_FILE]"
	echo "If TARGET_FILE is not provided, password will be printed to console only"
	exit 1
fi

SERVICE="$1"
USERNAME="$2"
SALT="$3" # Used internally to enhance randomness, not included in password
TARGET_FILE="$4"

# Random length between 13 and 20
PW_LENGTH=$((RANDOM % 8 + 13))

# Secure random password
RANDOM_PASSWORD=$(openssl rand -base64 48 | tr -dc 'A-Za-z0-9!@#$%^&*()-_=+' | head -c "$PW_LENGTH")

ENTRY="${SERVICE}, ${USERNAME}: ${RANDOM_PASSWORD}"

# If TARGET_FILE is provided, write to file; otherwise just print to console
if [ -n "$TARGET_FILE" ]; then
	# Check if target file exists
	if [ ! -f "$TARGET_FILE" ]; then
		echo "Notice: Target file '$TARGET_FILE' does not exist. Printing to console instead."
		echo "Generated password for ${SERVICE}:"
		echo "$ENTRY"
	else
		# Replace old entry if it exists
		TMP_FILE=$(mktemp)
		grep -v "^${SERVICE}, ${USERNAME}:" "$TARGET_FILE" 2>/dev/null >"$TMP_FILE"
		echo "$ENTRY" >>"$TMP_FILE"
		mv "$TMP_FILE" "$TARGET_FILE"
		
		chmod 600 "$TARGET_FILE"
		
		# Output
		echo "Updated entry for ${SERVICE}:"
		echo "$ENTRY"
	fi
else
	# Just print to console
	echo "Generated password for ${SERVICE}:"
	echo "$ENTRY"
	echo "Note: No target file specified. Please update your password records manually."
fi
