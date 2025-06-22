#!/usr/bin/env bash

# Usage: ./generate_password.sh <SERVICE> <USERNAME> <KEYWORD> <TARGET_FILE>

if [ "$#" -ne 4 ]; then
	echo "Usage: $0 <SERVICE> <USERNAME> <SALT> <TARGET_FILE>"
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

# Replace old entry if it exists
TMP_FILE=$(mktemp)
grep -v "^${SERVICE}, ${USERNAME}:" "$TARGET_FILE" 2>/dev/null >"$TMP_FILE"
echo "$ENTRY" >>"$TMP_FILE"
mv "$TMP_FILE" "$TARGET_FILE"

chmod 600 "$TARGET_FILE"

# Output
echo "Updated entry for ${SERVICE}:"
echo "$ENTRY"
