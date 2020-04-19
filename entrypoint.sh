#!/bin/bash
set -euo pipefail

secrets_directory=$1

cd $GITHUB_WORKSPACE/$secrets_directory

for encrypted_secret_file in encrypted/*; do
    echo "Decrypting ${encrypted_secret_file}"
    sops -d "${encrypted_secret_file}" > decrypted/$(basename "${encrypted_secret_file}")
done
