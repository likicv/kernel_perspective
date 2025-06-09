#!/bin/bash
set -euo pipefail

ARCHIVE="kernel_exercises.tar.gz.enc"
DECRYPTED="kernel_exercises.tar.gz"

# Check for required file
if [ ! -f "${ARCHIVE}" ]; then
    echo "Error: '${ARCHIVE}' not found in current directory."
    exit 1
fi

# Prompt for password
read -s -p "Enter decryption password: " PASSWORD
echo

# Decrypt
openssl enc -d -aes-256-cbc -pbkdf2 -in "${ARCHIVE}" -out "${DECRYPTED}" \
        -pass pass:"${PASSWORD}"
echo "Decryption complete: ${DECRYPTED}"

# Extract
tar -xzf "${DECRYPTED}"
echo "Extraction complete: kernel_exercises/"

# Cleanup
rm -f "${DECRYPTED}"
echo "Temporary file removed."

echo -ne "\n All done.\n\n"
