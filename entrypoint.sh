#!/bin/bash
set -euo pipefail

secrets_directory=${1}

if [ -z "${secrets_directory}" ]; then
    echo "secrets-directory is not set or is empty"
    exit 1
fi

full_path=${GITHUB_WORKSPACE}/${secrets_directory}

if [ ! -d "${full_path}" ]; then
    echo "secrets-directory ${secrets_directory} does not exist in ${GITHUB_WORKSPACE}"
    exit 1
fi

if [ ! -d "${full_path}/encrypted" ]; then
    echo "secrets-directory ${secrets_directory} does not contain an encrypted folder"
    exit 1
fi

if [ ! -d "${full_path}/decrypted" ]; then
    mkdir -p "${full_path}/decrypted"
fi

cd ${full_path}

for encrypted_secret_file in encrypted/*; do
    echo "Decrypting ${encrypted_secret_file}"
    sops -d "${encrypted_secret_file}" > decrypted/$(basename "${encrypted_secret_file}")
done
